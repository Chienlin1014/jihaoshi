package com.online_course_order_detail.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.cart.model.CartCourseVO;
import com.cart.model.CartProdVO;




public class OnlineCourseOrderDetailJDBCDAO implements OnlineCourseOrderDetailDAO_interface {
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

	public void insert(String orderNo, CartCourseVO prod, Connection conn) {
		String sql = "INSERT INTO Online_course_order_detail (order_no ,course_no ,course_price ,order_photo) VALUES(?, ?, ?, ?)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, orderNo);
			pstmt.setInt(2, prod.getCourse().getCourseNo());
			pstmt.setInt(3, prod.getCourse().getCoursePrice());
			pstmt.setBytes(4, prod.getCourse().getOnlineCoursePhoto());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public OnlineCourseOrderDetailVO findByPrimaryKey(Integer orderNo, Integer courseNo) {
		String sql = "select * from Online_course_order_detail where order_no = ? and course_no = ?";
		Connection conn=null;
		try{
			conn = ds.getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			pstmt.setInt(2, courseNo);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					OnlineCourseOrderDetailVO vo = new OnlineCourseOrderDetailVO();
					vo.setOrderNo(rs.getString("order_no"));
					vo.setCourseNo(rs.getInt("course_no"));
					vo.setCoursePrice(rs.getInt("course_price"));
					vo.setOrderPhoto(rs.getBytes("order_photo"));
					return vo;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<OnlineCourseOrderDetailVO> getAll() {
		String sql = "select * from Online_course_order_detail";
		Connection conn=null;
		try{
			conn = ds.getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        ResultSet rs = pstmt.executeQuery();
			List<OnlineCourseOrderDetailVO> list = new ArrayList<>();
			while (rs.next()) {
				OnlineCourseOrderDetailVO vo = new OnlineCourseOrderDetailVO();
				vo.setOrderNo(rs.getString("order_no"));
				vo.setCourseNo(rs.getInt("course_no"));
				vo.setCoursePrice(rs.getInt("course_price"));
				vo.setOrderPhoto(rs.getBytes("order_photo"));

				list.add(vo);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
