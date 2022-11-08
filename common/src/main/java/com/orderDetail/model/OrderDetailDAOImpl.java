package com.orderDetail.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.cart.model.CartProdVO;

public class OrderDetailDAOImpl implements OrderDetailDAO{
    @Override
    public int insert(String orderNo, CartProdVO prod, Connection conn) {
        String INSERT =
                "INSERT INTO MEAL_ORDER_DETAIL (ORDER_NO, MEAL_NO, QUANTITY, AMOUNT, PRICE) " +
                "values (?,?,?,?,?);";
        try {
            PreparedStatement ps = conn.prepareStatement(INSERT);
            ps.setString(1, orderNo);
            ps.setInt(2,prod.getMeal().getMealNo());
            ps.setDouble(3,prod.getQuantity());
            ps.setInt(4,prod.getAmount());
            ps.setInt(5,prod.getPrice());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return 0;
    }
}
