package com.order.model;

import java.util.List;

import com.cart.model.CartProdVO;

public class OrderService {
    OrderDAO dao=new OrderDAOImpl();
    public boolean orderInsert(String merchantTradeNo, Integer memberNo, Integer totalPrice, String tradeNo, List<CartProdVO> cartProds ) {
        OrderVO order=new OrderVO();
        order.setOrderNo(merchantTradeNo);
        order.setMemberNo(memberNo);
        order.setPrice(totalPrice);
        order.setTradeNo(tradeNo);
        dao.insert(order,cartProds);
        return true;
    }
}
