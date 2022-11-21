package com.online_course_order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.cfg.SecondaryTableSecondPass;

import com.online_course_order_detail.model.OnlineCourseOrderDetailVO;

public class OnlineCourseOrderJDBCDAO implements OnlineCourseOrderDAO_interface {
	
	private static DataSource ds = null;
	 static {
	  try {
	   Context ctx = new InitialContext();
	   ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jihaoshi");
	  } catch (NamingException e) {
	   e.printStackTrace();
	  }
	 }


	@Override
	public void update(OnlineCourseOrderVO onlineCourseOrderVO) {
		String sql = "update Online_course_order set order_status = ? where order_no = ?";
		try (Connection conn =  ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {		
			pstmt.setInt(1, onlineCourseOrderVO.getOrderStatus());
			pstmt.setInt(2, onlineCourseOrderVO.getOrderNo());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	@Override
	public List<OnlineCourseOrderVO> findByMemNo(Integer memberNo) {
		String sql = "select o.*, m.member_account "
				+ "from Online_course_order o "
				+ "join member m "
				+ "on o.member_no = m.member_no "
				+ "where o.member_no = ?";
		try (Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setInt(1, memberNo);
			try (ResultSet rs = pstmt.executeQuery()) {
				List<OnlineCourseOrderVO> list = new ArrayList<>();
				while (rs.next()) {
					OnlineCourseOrderVO vo = new OnlineCourseOrderVO();								
					vo.setMemberNo(rs.getInt("member_no"));
					vo.setMemberAccount(rs.getString("member_account"));
					vo.setOrderNo(rs.getInt("order_no"));
					vo.setOrderTime(rs.getTimestamp("order_time"));
					vo.setOrderVolume(rs.getInt("order_volume"));
					vo.setOrderPrice(rs.getInt("order_price"));
					vo.setOrderStatus(rs.getInt("order_status"));
					list.add(vo);
				}
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<OnlineCourseOrderVO> getAll() {
		String sql = "select * from Online_course_order";
		try (Connection conn =ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			List<OnlineCourseOrderVO> list = new ArrayList<>();
			while (rs.next()) {
				OnlineCourseOrderVO vo = new OnlineCourseOrderVO();
				vo.setOrderNo(rs.getInt("order_no"));					
				vo.setMemberNo(rs.getInt("member_no"));
				vo.setOrderTime(rs.getTimestamp("order_time"));
				vo.setOrderVolume(rs.getInt("order_volume"));
				vo.setOrderPrice(rs.getInt("order_price"));
				vo.setOrderStatus(rs.getInt("order_status"));
				list.add(vo);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public OnlineCourseOrderVO getOrderDetail(Integer orderNo) {
		String sql = "select o.*, od.course_no, od.course_price, od.order_photo "
				+ "from"
				+ "	Online_course_order o"
				+ "    join Online_course_order_detail od"
				+ "		on o.order_no = od.order_no "
				+ "where o.order_no = ?";
		try (
			Connection conn =ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			pstmt.setInt(1, orderNo);
			try (ResultSet rs = pstmt.executeQuery()) {
				List<OnlineCourseOrderVO> list = new ArrayList<>();
				OnlineCourseOrderVO orderVo = null;
				List<OnlineCourseOrderDetailVO> detailList = null;
				while (rs.next()) {
					if (orderVo == null || orderVo.getOrderNo() != rs.getInt("order_no")) {
						orderVo = new OnlineCourseOrderVO();
						orderVo.setOrderNo(rs.getInt("order_no"));
						orderVo.setMemberNo(rs.getInt("member_no"));
						orderVo.setOrderTime(rs.getTimestamp("order_time"));
						orderVo.setOrderVolume(rs.getInt("order_volume"));
						orderVo.setOrderPrice(rs.getInt("order_price"));
						orderVo.setOrderStatus(rs.getInt("order_status"));
						detailList = new ArrayList<>();
						orderVo.setOrderDetailList(detailList);
						list.add(orderVo);
					}
					OnlineCourseOrderDetailVO detailVo = new OnlineCourseOrderDetailVO();
					detailVo.setCourseNo(rs.getInt("course_no"));			
					detailVo.setCoursePrice(rs.getInt("course_price"));			
					detailVo.setOrderPhoto(rs.getBytes("order_photo"));
					detailList.add(detailVo);
				}
				return orderVo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}