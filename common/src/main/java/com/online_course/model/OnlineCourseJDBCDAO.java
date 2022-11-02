package com.online_course.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OnlineCourseJDBCDAO implements OnlineCourseDAO_interface {
	private DataSource dataSource;

	public OnlineCourseJDBCDAO() {
		try {
			dataSource = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/jihaoshi");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insert(OnlineCourseVO onlineCourseVO) {
		String sql = "INSERT INTO Online_course(course_name ,course_hr ,course_teacher ,course_info , course_price ,course_status,course_photo) VALUES(?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {

			pstmt.setString(1, onlineCourseVO.getCourseName());
			pstmt.setString(2, onlineCourseVO.getCourseHr());
			pstmt.setString(3, onlineCourseVO.getCourseTeacher());
			pstmt.setString(4, onlineCourseVO.getCourseInfo());
			pstmt.setInt(5, onlineCourseVO.getCoursePrice());
			pstmt.setInt(6, onlineCourseVO.getCourseStatus());
			pstmt.setBytes(7, onlineCourseVO.getOnlineCoursePhoto());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(OnlineCourseVO onlineCourseVO) {
		String sql = "update Online_course set course_name = ?, course_hr = ?, course_teacher = ? ,course_info = ?,course_price = ?,course_status = ?,comment_people = ?, comment_score = ? , course_photo = ? where course_no = ?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, onlineCourseVO.getCourseName());
			pstmt.setString(2, onlineCourseVO.getCourseHr());
			pstmt.setString(3, onlineCourseVO.getCourseTeacher());
			pstmt.setString(4, onlineCourseVO.getCourseInfo());
			pstmt.setInt(5, onlineCourseVO.getCoursePrice());
			pstmt.setInt(6, onlineCourseVO.getCourseStatus());
			pstmt.setInt(7, onlineCourseVO.getCommentPeople());
			pstmt.setInt(8, onlineCourseVO.getCommentScore());
			pstmt.setInt(9, onlineCourseVO.getCourseNo());
			pstmt.setBytes(10, onlineCourseVO.getOnlineCoursePhoto());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void delete(OnlineCourseVO onlineCourseVO) {
		String sql = "delete from Online_course where course_no = ?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {

			pstmt.setInt(1, onlineCourseVO.getCourseNo());
			int rowCount = pstmt.executeUpdate();
			System.out.println(rowCount + " row(s) deleted!!");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public OnlineCourseVO findByPrimaryKey(Integer courseNo) {
		String sql = "select * from Online_course where course_no = ?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setInt(1, courseNo);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					OnlineCourseVO vo = new OnlineCourseVO();
					vo.setCourseNo(rs.getInt("course_no"));
					vo.setCourseName(rs.getString("course_name"));
					vo.setCourseHr(rs.getString("course_hr"));
					vo.setCourseTeacher(rs.getString("course_teacher"));
					vo.setCourseInfo(rs.getString("course_info"));
					vo.setCoursePrice(rs.getInt("course_price"));
					vo.setCourseStatus(rs.getInt("course_status"));
					vo.setUpdateDate(rs.getTimestamp("update_date"));
					vo.setCommentPeople(rs.getInt("comment_people"));
					vo.setCommentScore(rs.getInt("comment_score"));

					return vo;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<OnlineCourseVO> getAll() {
		String sql = "select * from Online_course";
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			List<OnlineCourseVO> list = new ArrayList<>();
			while (rs.next()) {
				OnlineCourseVO vo = new OnlineCourseVO();
				vo.setCourseNo(rs.getInt("course_no"));
				vo.setCourseName(rs.getString("course_name"));
				vo.setCourseHr(rs.getString("course_hr"));
				vo.setCourseTeacher(rs.getString("course_teacher"));
				vo.setCourseInfo(rs.getString("course_info"));
				vo.setCoursePrice(rs.getInt("course_price"));
				vo.setCourseStatus(rs.getInt("course_status"));
				vo.setUpdateDate(rs.getTimestamp("update_date"));
				vo.setCommentPeople(rs.getInt("comment_people"));
				vo.setCommentScore(rs.getInt("comment_score"));
				vo.setCommentScore(rs.getInt("comment_score"));
				vo.setOnlineCoursePhoto(rs.getBytes("course_photo"));
				list.add(vo);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {

		OnlineCourseJDBCDAO dao = new OnlineCourseJDBCDAO();

//		// 新增
//		OnlineCourseVO OnlineCourseVO01 = new OnlineCourseVO();
//		OnlineCourseVO01.setCourseName("三杯雞");
//		OnlineCourseVO01.setCourseHr("40分鐘");
//		OnlineCourseVO01.setCourseTeacher("大番茄");
//		OnlineCourseVO01.setCourseInfo("好吃一直吃");
//		OnlineCourseVO01.setCoursePrice(999);
//		OnlineCourseVO01.setCourseStatus(0);
//		dao.insert(OnlineCourseVO01);
//
//		// 修改
//		OnlineCourseVO OnlineCourseVO2 = new OnlineCourseVO();
//		OnlineCourseVO2.setCourseName("炒飯");
//		OnlineCourseVO2.setCourseHr("35分鐘");
//		OnlineCourseVO2.setCourseTeacher("美女小番茄");
//		OnlineCourseVO2.setCourseInfo("輕鬆煮好晚餐");
//		OnlineCourseVO2.setCoursePrice(888);
//		OnlineCourseVO2.setCourseStatus(0);
//		OnlineCourseVO2.setCommentPeople(0);
//		OnlineCourseVO2.setCommentScore(0);
//		OnlineCourseVO2.setCourseNo(7);
//		dao.update(OnlineCourseVO2);
//
//		// 刪除
//		OnlineCourseVO vo = new OnlineCourseVO();
//		vo.setCourseNo(11);
//		dao.delete(vo);

		// 查詢單筆
//		OnlineCourseVO OnlineCourseVO3 = dao.findByPrimaryKey(2);
//		System.out.print(OnlineCourseVO3.getCourseNo() + ",");
//		System.out.print(OnlineCourseVO3.getCourseName() + ",");
//		System.out.print(OnlineCourseVO3.getCourseHr() + ",");
//		System.out.print(OnlineCourseVO3.getCourseTeacher() + ",");
//		System.out.print(OnlineCourseVO3.getCourseInfo() + ",");
//		System.out.print(OnlineCourseVO3.getCoursePrice() + ",");
//		System.out.print(OnlineCourseVO3.getCourseStatus()+ ",");
//		System.out.print(OnlineCourseVO3.getUpdateDate()+ ",");
//		System.out.print(OnlineCourseVO3.getCommentPeople()+ ",");
//		System.out.print(OnlineCourseVO3.getCommentScore());
//		
//		System.out.println("---------------------");

//		 查詢多筆
//		List<OnlineCourseVO> list = dao.getAll();
//		for (OnlineCourseVO aEmp : list) {
//			System.out.print(aEmp.getCourseNo() + ",");
//			System.out.print(aEmp.getCourseName() + ",");
//			System.out.print(aEmp.getCourseHr() + ",");
//			System.out.print(aEmp.getCourseTeacher() + ",");
//			System.out.print(aEmp.getCourseInfo() + ",");
//			System.out.print(aEmp.getCoursePrice() + ",");
//			System.out.print(aEmp.getCourseStatus()+ ",");
//			System.out.print(aEmp.getUpdateDate() + ",");
//			System.out.print(aEmp.getCommentPeople() + ",");
//			System.out.print(aEmp.getCommentScore());
//			System.out.println();
//		}
	}

	@Override
	public List<OnlineCourseVO> selectByCourseName(String courseName) {
		String sql = "select * from Online_course where course_name like ?";
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, "%" + courseName + "%");
			try (ResultSet rs = pstmt.executeQuery()) {
				List<OnlineCourseVO> list = new ArrayList<>();
				while (rs.next()) {
					OnlineCourseVO vo = new OnlineCourseVO();
					vo.setCourseNo(rs.getInt("course_no"));
					vo.setCourseName(rs.getString("course_name"));
					vo.setCourseHr(rs.getString("course_hr"));
					vo.setCourseTeacher(rs.getString("course_teacher"));
					vo.setCourseInfo(rs.getString("course_info"));
					vo.setCoursePrice(rs.getInt("course_price"));
					vo.setCourseStatus(rs.getInt("course_status"));
					vo.setUpdateDate(rs.getTimestamp("update_date"));
					vo.setCommentPeople(rs.getInt("comment_people"));
					vo.setCommentScore(rs.getInt("comment_score"));
					list.add(vo);
				}
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
