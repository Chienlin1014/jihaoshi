package com.orderDetail.model;

import java.sql.Connection;

import com.cart.model.CartProdVO;

public interface OrderDetailDAO {
    public int insert(String orderNo, CartProdVO prod, Connection conn);
}
