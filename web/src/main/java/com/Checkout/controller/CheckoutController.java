package com.Checkout.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.model.CartProdVO;
import com.cart.model.CartService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@WebServlet("/checkout/checkoutController")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class CheckoutController extends HttpServlet {
    CartService cartSV=new CartService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String action = req.getParameter("action");
        if ("checkout".equals(action)) {
            HttpSession session = req.getSession();
            List<CartProdVO> cartProds = (ArrayList<CartProdVO>) session.getAttribute("cartProds");
            Integer totalPrice = cartSV.setTotalPrice(cartProds);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String tradeDate = sdf.format(new Date(System.currentTimeMillis()));
            AllInOne allInOne = new AllInOne("");
            AioCheckOutALL aioCheckOutALL = new AioCheckOutALL();
            // 最後的1預計放會員編號 todo
            aioCheckOutALL.setMerchantTradeNo(tradeDate.replace("/", "").replace(":", "").replace(" ", "") + 1);
            aioCheckOutALL.setMerchantTradeDate(tradeDate);
            aioCheckOutALL.setTotalAmount(String.valueOf(totalPrice));
            aioCheckOutALL.setTradeDesc("付款測試");
            aioCheckOutALL.setReturnURL("http://localhost:8081/web/checkout/checkoutController?action=callBack");
            aioCheckOutALL.setOrderResultURL("http://localhost:8081/web/checkout/checkoutController?action=callBack");
            aioCheckOutALL.setClientBackURL("http://localhost:8081/web");
            aioCheckOutALL.setNeedExtraPaidInfo("N");
            aioCheckOutALL.setItemName("商品總價");

            String checkoutPage=allInOne.aioCheckOut(aioCheckOutALL,null);
            req.setAttribute("checkoutPage",checkoutPage);
            RequestDispatcher goCheckout = req
                    .getRequestDispatcher("/checkout/CheckoutPage.jsp");
            goCheckout.forward(req, res);
        }
        if ("callBack".equals(action)) {
            System.out.println("結帳成功喔");
            String test=req.getParameter("TradeNo");
            System.out.println(test);
        }
    }
}
