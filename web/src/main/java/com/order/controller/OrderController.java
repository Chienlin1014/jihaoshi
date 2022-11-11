package com.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.model.CartProdVO;
import com.cart.model.CartService;
import com.order.model.OrderService;

@WebServlet("/order/orderController")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<CartProdVO> cartProds = (ArrayList<CartProdVO>) session.getAttribute("cartProds");
        String action = req.getParameter("action");
        CartService cartSV=new CartService();

        if ("orderInsert".equals(action)) {
            //            Integer memberNo = req.getParameter("memberNo");

            Integer memberNo=1;
            String merchantTradeNo=req.getParameter("MerchantTradeNo"); // 店內之交易編號
            String tradeNo=req.getParameter("TradeNo"); // 綠界之交易編號
            Integer totalPrice = cartSV.calculateTotalPrice(cartProds);
            OrderService orderSV=new OrderService();
            orderSV.orderInsert(merchantTradeNo, memberNo, totalPrice, tradeNo, cartProds);
            session.removeAttribute("cartProds");
            session.removeAttribute("totalPrice");
            res.sendRedirect(req.getContextPath()+"/order/ListOrder.jsp");
        }

        if ("orderList".equals(action)) {
//            Integer memberNo = req.getParameter("memberNo");
            Integer memberNo=1;


        }
    }
}
