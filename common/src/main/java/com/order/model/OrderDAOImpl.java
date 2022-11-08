package com.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.cart.model.CartProdVO;
import com.orderDetail.model.OrderDetailDAO;
import com.orderDetail.model.OrderDetailDAOImpl;

public class OrderDAOImpl implements OrderDAO{
    public static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jihaoshi");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void insert(OrderVO order, List<CartProdVO> cartProds) {
        String INSERT =
                "INSERT INTO MEAL_ORDER(ORDER_NO, MEMBER_NO,ORDER_PRICE,TRADE_NO) " +
                "VALUES (?,?,?,?)";
        Connection conn= null;
        try {
            conn= ds.getConnection();
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(INSERT);
            ps.setString(1,order.getOrderNo());
            ps.setInt(2, order.getMemberNo());
            ps.setInt(3,order.getPrice());
            ps.setString(4,order.getTradeNo());
            ps.executeUpdate();
            OrderDetailDAO dao=new OrderDetailDAOImpl();
            for (CartProdVO prod : cartProds) {
                dao.insert(order.getOrderNo(), prod, conn);
            }
            conn.commit();
            conn.setAutoCommit(true);
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

    }
}
