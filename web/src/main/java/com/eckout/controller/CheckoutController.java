package com.eckout.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;

import com.cart.model.CartProdVO;
import com.cart.model.CartService;
import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@WebServlet("/checkout/checkoutController")
public class CheckoutController extends HttpServlet {
    CartService cartSV=new CartService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<CartProdVO> cartProds = (ArrayList<CartProdVO>) session.getAttribute("cartProds");
        String action = req.getParameter("action");
        if ("checkout".equals(action)) {
            Integer totalPrice = cartSV.calculateTotalPrice(cartProds);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String tradeDate = sdf.format(new Date(System.currentTimeMillis()));
            AllInOne allInOne = new AllInOne("");
            AioCheckOutALL aioCheckOutALL = new AioCheckOutALL();
            String itemName="";
            for (CartProdVO prod : cartProds) {
                itemName+="品名："+prod.getMeal().getMealName()+" 份量："+prod.getQuantity()+" 數量："+prod.getAmount()+"#";
            }
            if (itemName.length()>=200) {
                itemName = "Jihaoshi商品一批";
            }
            String ranAlphabet = RandomStringUtils.randomAlphabetic(2).toUpperCase();
            int ranNum = (int) (Math.random() * 8999+ 1000);
            String merchantTradeNo=ranAlphabet+tradeDate.replace("/", "").replace(":", "").replace(" ", "")+ranNum;
            aioCheckOutALL.setMerchantTradeNo(merchantTradeNo);
            aioCheckOutALL.setMerchantTradeDate(tradeDate);
            aioCheckOutALL.setTotalAmount(String.valueOf(totalPrice));
            aioCheckOutALL.setTradeDesc("付款測試");
            aioCheckOutALL.setReturnURL(req.getRequestURL()+"?action=serverCallBack");
            aioCheckOutALL.setOrderResultURL(req.getRequestURL()+"?action=callBack");
            aioCheckOutALL.setClientBackURL("http://localhost:8081/web");
            aioCheckOutALL.setNeedExtraPaidInfo("N");
            aioCheckOutALL.setItemName(itemName);
            String checkoutPage=allInOne.aioCheckOut(aioCheckOutALL,null);
            req.setAttribute("checkoutPage",checkoutPage);
            RequestDispatcher goCheckout = req
                    .getRequestDispatcher("/checkout/CheckoutPage.jsp");
            goCheckout.forward(req, res);
        }
        if ("serverCallBack".equals(action)) {
            res.getWriter().println("1|OK");
            return;
        }
        if ("callBack".equals(action)) {

            Integer rtnCode = Integer.valueOf(req.getParameter("RtnCode")); // rtnCode==1 交易成功

            if (rtnCode.equals(1)) {
                RequestDispatcher orderInsert =req.getRequestDispatcher("/order/orderController?action=orderInsert");
                orderInsert.forward(req,res);
            }else {
                res.sendRedirect("");
            }
        }
    }
}
