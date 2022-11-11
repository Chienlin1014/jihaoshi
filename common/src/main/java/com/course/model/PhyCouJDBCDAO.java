package com.course.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class PhyCouJDBCDAO implements PhyCouDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://15.152.181.134:3306/JihaoDB?serverTimezone=Asia/Taipei";
	String userid = "tsai";
	String passwd = "Tibame@cga104";

	private static final String INSERT_STMT = 
		"INSERT INTO Physical_course (course_name, course_hr, course_price, course_teacher, course_date, course_location, course_info, course_status, sign_up_start_day, sign_up_end_day, max_sign_up_people, min_sign_up_people,	current_sign_up_people, pic) VALUES ( ?, ?, ?, ?,   ?, ?, ?, ?,  ?, ?, ?, ?,  ?, ?)";
	private static final String INSERT_STMT_NOPIC = 
		"INSERT INTO Physical_course (course_name, course_hr, course_price, course_teacher, course_date, course_location, course_info, course_status, sign_up_start_day, sign_up_end_day, max_sign_up_people, min_sign_up_people,	current_sign_up_people) VALUES      ( ?, ?, ?, ?,   ?, ?, ?, ?,  ?, ?, ?, ?,  ?)";
	private static final String GET_ALL_STMT = 
		"SELECT * FROM Physical_course order by course_no";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM Physical_course where course_no = ?";
	private static final String DELETE = 
		"update Physical_course set course_status = ? where course_no= ?" ;
	private static final String UPDATE = 
		"UPDATE Physical_course set course_name=?, course_hr=?, course_price=?, course_teacher=?, course_date=?, course_location=?, course_info=?, course_status=?, create_date=?, update_time=?, sign_up_start_day=?, sign_up_end_day=?, max_sign_up_people=?, min_sign_up_people=?,	current_sign_up_people=?, pic=? where course_no=? ";
	private static final String UPDATE_NOPIC = 
		"UPDATE Physical_course set course_name=?, course_hr=?, course_price=?, course_teacher=?, course_date=?, course_location=?, course_info=?, course_status=?, create_date=?, update_time=?, sign_up_start_day=?, sign_up_end_day=?, max_sign_up_people=?, min_sign_up_people=?,	current_sign_up_people=? where course_no=? ";

	@Override
	public void insert(PhyCouVO phyCouVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);	
			if ( phyCouVO.getPic().length != 0 || phyCouVO.getPic() != null ) {
				pstmt = con.prepareStatement(INSERT_STMT);
				
	
				pstmt.setString(1, phyCouVO.getCourse_name());
				pstmt.setInt(2, phyCouVO.getCourse_hr());
				pstmt.setInt(3, phyCouVO.getCourse_price());
				pstmt.setString(4, phyCouVO.getCourse_teacher());
				pstmt.setDate(5, phyCouVO.getCourse_date());
				pstmt.setString(6, phyCouVO.getCourse_location());
				pstmt.setString(7, phyCouVO.getCourse_info());
				pstmt.setInt(8, phyCouVO.getCourse_status());
				pstmt.setDate(9, phyCouVO.getSign_up_start_day());
				pstmt.setDate(10, phyCouVO.getSign_up_end_day());
				pstmt.setInt(11, phyCouVO.getMax_sign_up_people());
				pstmt.setInt(12, phyCouVO.getMin_sign_up_people());
				pstmt.setInt(13, phyCouVO.getCurrent_sign_up_people());
				pstmt.setBytes(14, phyCouVO.getPic());			
	
				pstmt.executeUpdate();
			} else {
				pstmt = con.prepareStatement(INSERT_STMT_NOPIC);
				
				
				pstmt.setString(1, phyCouVO.getCourse_name());
				pstmt.setInt(2, phyCouVO.getCourse_hr());
				pstmt.setInt(3, phyCouVO.getCourse_price());
				pstmt.setString(4, phyCouVO.getCourse_teacher());
				pstmt.setDate(5, phyCouVO.getCourse_date());
				pstmt.setString(6, phyCouVO.getCourse_location());
				pstmt.setString(7, phyCouVO.getCourse_info());
				pstmt.setInt(8, phyCouVO.getCourse_status());
				pstmt.setDate(9, phyCouVO.getSign_up_start_day());
				pstmt.setDate(10, phyCouVO.getSign_up_end_day());
				pstmt.setInt(11, phyCouVO.getMax_sign_up_people());
				pstmt.setInt(12, phyCouVO.getMin_sign_up_people());
				pstmt.setInt(13, phyCouVO.getCurrent_sign_up_people());
								
				pstmt.executeUpdate();
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(PhyCouVO phyCouVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			if (phyCouVO.getPic().length != 0) {
				pstmt = con.prepareStatement(UPDATE);
	
				pstmt.setString(1, phyCouVO.getCourse_name());
				pstmt.setInt(2, phyCouVO.getCourse_hr());
				pstmt.setInt(3, phyCouVO.getCourse_price());
				pstmt.setString(4, phyCouVO.getCourse_teacher());
				pstmt.setDate(5, phyCouVO.getCourse_date());
				pstmt.setString(6, phyCouVO.getCourse_location());
				pstmt.setString(7, phyCouVO.getCourse_info());
				pstmt.setInt(8, phyCouVO.getCourse_status());
				pstmt.setDate(9, phyCouVO.getCreate_date());
				pstmt.setDate(10, phyCouVO.getUpdate_time());
				pstmt.setDate(11, phyCouVO.getSign_up_start_day());
				pstmt.setDate(12, phyCouVO.getSign_up_end_day());
				pstmt.setInt(13, phyCouVO.getMax_sign_up_people());
				pstmt.setInt(14, phyCouVO.getMin_sign_up_people());
				pstmt.setInt(15, phyCouVO.getCurrent_sign_up_people());
				pstmt.setBytes(16, phyCouVO.getPic());
				pstmt.setInt(17, phyCouVO.getCourse_no());
				
				pstmt.executeUpdate();
			} else {
				pstmt = con.prepareStatement(UPDATE_NOPIC);
				
				pstmt.setString(1, phyCouVO.getCourse_name());
				pstmt.setInt(2, phyCouVO.getCourse_hr());
				pstmt.setInt(3, phyCouVO.getCourse_price());
				pstmt.setString(4, phyCouVO.getCourse_teacher());
				pstmt.setDate(5, phyCouVO.getCourse_date());
				pstmt.setString(6, phyCouVO.getCourse_location());
				pstmt.setString(7, phyCouVO.getCourse_info());
				pstmt.setInt(8, phyCouVO.getCourse_status());
				pstmt.setDate(9, phyCouVO.getCreate_date());
				pstmt.setDate(10, phyCouVO.getUpdate_time());
				pstmt.setDate(11, phyCouVO.getSign_up_start_day());
				pstmt.setDate(12, phyCouVO.getSign_up_end_day());
				pstmt.setInt(13, phyCouVO.getMax_sign_up_people());
				pstmt.setInt(14, phyCouVO.getMin_sign_up_people());
				pstmt.setInt(15, phyCouVO.getCurrent_sign_up_people());
				pstmt.setInt(16, phyCouVO.getCourse_no());
				
				pstmt.executeUpdate();
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer course_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, 2);
			pstmt.setInt(2, course_no);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public PhyCouVO findByPrimaryKey(Integer course_no) {

		PhyCouVO phyCouVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, course_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				phyCouVO = new PhyCouVO();
				phyCouVO.setCourse_no(rs.getInt("course_no"));
				phyCouVO.setCourse_name(rs.getString("course_name"));
				phyCouVO.setCourse_hr(rs.getInt("course_hr"));
				phyCouVO.setCourse_price(rs.getInt("course_price"));
				phyCouVO.setCourse_teacher(rs.getString("course_teacher"));
				phyCouVO.setCourse_date(rs.getDate("course_date"));
				phyCouVO.setCourse_location(rs.getString("course_location"));
				phyCouVO.setCourse_info(rs.getString("course_info"));
				phyCouVO.setCourse_status(rs.getInt("course_status"));
				phyCouVO.setCreate_date(rs.getDate("create_date"));
				phyCouVO.setUpdate_time(rs.getDate("update_time"));
				phyCouVO.setSign_up_start_day(rs.getDate("sign_up_start_day"));
				phyCouVO.setSign_up_end_day(rs.getDate("sign_up_end_day"));
				phyCouVO.setMax_sign_up_people(rs.getInt("max_sign_up_people"));
				phyCouVO.setMin_sign_up_people(rs.getInt("min_sign_up_people"));
				phyCouVO.setCurrent_sign_up_people(rs.getInt("current_sign_up_people"));
				phyCouVO.setPic(rs.getBytes("pic"));
							
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return phyCouVO;
	}

	@Override
	public List<PhyCouVO> getAll() {
		List<PhyCouVO> list = new ArrayList<PhyCouVO>();
		PhyCouVO phyCouVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO �]�٬� Domain objects
				phyCouVO = new PhyCouVO();
				phyCouVO.setCourse_no(rs.getInt("course_no"));
				phyCouVO.setCourse_name(rs.getString("course_name"));
				phyCouVO.setCourse_hr(rs.getInt("course_hr"));
				phyCouVO.setCourse_price(rs.getInt("course_price"));
				phyCouVO.setCourse_teacher(rs.getString("course_teacher"));
				phyCouVO.setCourse_date(rs.getDate("course_date"));
				phyCouVO.setCourse_location(rs.getString("course_location"));
				phyCouVO.setCourse_info(rs.getString("course_info"));
				phyCouVO.setCourse_status(rs.getInt("course_status"));
				phyCouVO.setCreate_date(rs.getDate("create_date"));
				phyCouVO.setUpdate_time(rs.getDate("update_time"));
				phyCouVO.setSign_up_start_day(rs.getDate("sign_up_start_day"));
				phyCouVO.setSign_up_end_day(rs.getDate("sign_up_end_day"));
				phyCouVO.setMax_sign_up_people(rs.getInt("max_sign_up_people"));
				phyCouVO.setMin_sign_up_people(rs.getInt("min_sign_up_people"));
				phyCouVO.setCurrent_sign_up_people(rs.getInt("current_sign_up_people"));
				phyCouVO.setPic(rs.getBytes("pic"));
				list.add(phyCouVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<PhyCouVO> getAll(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return null;
	}

//	public static void main(String[] args) {

//		PhyCouDAO dao = new PhyCouDAO();

		// �s�W
//		PhyCouVO phyCouVO1 = new PhyCouVO();
//		phyCouVO1.setCourse_name("�׶�");
//		phyCouVO1.setCourse_hr(3);
//		phyCouVO1.setCourse_price(1999);
//		phyCouVO1.setCourse_teacher("�j�d�Ѯv");
//		phyCouVO1.setCourse_date(java.sql.Date.valueOf("2022-12-31"));
//		phyCouVO1.setCourse_location("904");
//		phyCouVO1.setCourse_info("�y�L��u�A�@�w�n�ӡA���L�i��");
//		phyCouVO1.setCourse_status(0);
//		phyCouVO1.setCreate_date(java.sql.Date.valueOf("2022-01-01"));
//		phyCouVO1.setUpdate_time(java.sql.Date.valueOf("2022-10-01"));
//		phyCouVO1.setSign_up_start_day(java.sql.Date.valueOf("2022-10-01"));
//		phyCouVO1.setSign_up_end_day(java.sql.Date.valueOf("2022-12-27"));
//		phyCouVO1.setMax_sign_up_people(100);
//		phyCouVO1.setMin_sign_up_people(20);
//		phyCouVO1.setCurrent_sign_up_people(46);
//		dao.insert(phyCouVO1);

		// �ק�
//		PhyCouVO phyCouVO2 = new PhyCouVO();
//		phyCouVO2.setCourse_no(5);
//		phyCouVO2.setCourse_name("�׶�");
//		phyCouVO2.setCourse_hr(3);
//		phyCouVO2.setCourse_price(1999);
//		phyCouVO2.setCourse_teacher("�j�d�Ѯv");
//		phyCouVO2.setCourse_date(java.sql.Date.valueOf("2022-12-31"));
//		phyCouVO2.setCourse_location("904");
//		phyCouVO2.setCourse_info("�y�L��u�A�@�w�n�ӡA���L�i��");
//		phyCouVO2.setCourse_status(0);
//		phyCouVO2.setCreate_date(java.sql.Date.valueOf("2022-01-01"));
//		phyCouVO2.setUpdate_time(java.sql.Date.valueOf("2022-10-01"));
//		phyCouVO2.setSign_up_start_day(java.sql.Date.valueOf("2022-10-01"));
//		phyCouVO2.setSign_up_end_day(java.sql.Date.valueOf("2022-12-27"));
//		phyCouVO2.setMax_sign_up_people(100);
//		phyCouVO2.setMin_sign_up_people(20);
//		phyCouVO2.setCurrent_sign_up_people(46);
//		dao.update(phyCouVO2);

		// �R��
//		dao.delete(5);

		// �d��
//		PhyCouVO phyCouVO3 = dao.findByPrimaryKey(2);
//		System.out.print(phyCouVO3.getCourse_no() + ",");
//		System.out.print(phyCouVO3.getCourse_name() + ",");
//		System.out.print(phyCouVO3.getCourse_hr() + ",");
//		System.out.print(phyCouVO3.getCourse_price() + ",");
//		System.out.print(phyCouVO3.getCourse_teacher() + ",");
//		System.out.print(phyCouVO3.getCourse_date() + ",");
//		System.out.print(phyCouVO3.getCourse_location() + ",");
//		System.out.print(phyCouVO3.getCourse_info() + ",");
//		System.out.print(phyCouVO3.getCourse_status() + ",");
//		System.out.print(phyCouVO3.getCreate_date() + ",");
//		System.out.print(phyCouVO3.getUpdate_time() + ",");
//		System.out.print(phyCouVO3.getSign_up_start_day() + ",");
//		System.out.print(phyCouVO3.getSign_up_end_day() + ",");
//		System.out.print(phyCouVO3.getMax_sign_up_people() + ",");
//		System.out.print(phyCouVO3.getMin_sign_up_people() + ",");		
//		System.out.println(phyCouVO3.getCurrent_sign_up_people());		
//		System.out.println("---------------------");

		// �d��
//		List<PhyCouVO> list = dao.getAll();
//		for (PhyCouVO aCourse : list) {
//			System.out.print(aCourse.getCourse_no() + ",");
//			System.out.print(aCourse.getCourse_name() + ",");
//			System.out.print(aCourse.getCourse_hr() + ",");
//			System.out.print(aCourse.getCourse_price() + ",");
//			System.out.print(aCourse.getCourse_teacher() + ",");
//			System.out.print(aCourse.getCourse_date() + ",");
//			System.out.print(aCourse.getCourse_location() + ",");
//			System.out.print(aCourse.getCourse_info() + ",");
//			System.out.print(aCourse.getCourse_status() + ",");
//			System.out.print(aCourse.getCreate_date() + ",");
//			System.out.print(aCourse.getUpdate_time() + ",");
//			System.out.print(aCourse.getSign_up_start_day() + ",");
//			System.out.print(aCourse.getSign_up_end_day() + ",");
//			System.out.print(aCourse.getMax_sign_up_people() + ",");
//			System.out.print(aCourse.getMin_sign_up_people() + ",");		
//			System.out.println(aCourse.getCurrent_sign_up_people());		
//			System.out.println();
//		}
//	}
}
