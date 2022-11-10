package com.course.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.course.model.*;


@WebServlet("/course/cou.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

public class CourseServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	String saveDirectory = "/images_uploaded";

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
	

<<<<<<< HEAD
		if ("getOne_For_Display".equals(action)) { 
=======
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("course_no");
				if (str == null || (str.trim()).length() == 0) {
<<<<<<< HEAD
					errorMsgs.add("請輸入課程编號。");
=======
					errorMsgs.add("請輸入 course_no");
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/course/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer course_no = null;
				try {
					course_no = Integer.valueOf(str);
				} catch (Exception e) {
<<<<<<< HEAD
					errorMsgs.add("課程編號格式不正確");
=======
					errorMsgs.add("course_no 格式不正確");
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/course/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				PhyCouService phyCouSvc = new PhyCouService();
				PhyCouVO phyCouVO = phyCouSvc.getOneCou(course_no);
				if (phyCouVO== null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/course/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
<<<<<<< HEAD
				req.setAttribute("phyCouVO", phyCouVO);
				String url = "/course/listOneCou.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
=======
				req.setAttribute("phyCouVO", phyCouVO); // 資料庫取出的empVO物件,存入req
				String url = "/course/listOneCou.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				successView.forward(req, res);
		}
		
		
<<<<<<< HEAD
		if ("getOne_For_Update".equals(action)) { 

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
=======
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
				Integer course_no = Integer.valueOf(req.getParameter("course_no"));
				
				/***************************2.開始查詢資料****************************************/
				PhyCouService phyCouSvc = new PhyCouService();
				PhyCouVO phyCouVO = phyCouSvc.getOneCou(course_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
<<<<<<< HEAD
				String param = "?course_no="    +phyCouVO.getCourse_no()+
						       "&course_name="  +phyCouVO.getCourse_name()+
						       "&course_hr="    +phyCouVO.getCourse_hr()+
						       "&course_price=" +phyCouVO.getCourse_price()+
						       "&course_teacher="+phyCouVO.getCourse_teacher()+
						       "&course_date="  +phyCouVO.getCourse_date()+
						       "&course_location="+phyCouVO.getCourse_location()+
						       "&course_info="   +phyCouVO.getCourse_info()+
						       "&course_status=" +phyCouVO.getCourse_status()+
						       "&create_date="   +phyCouVO.getCreate_date()+
						       "&update_time="   +phyCouVO.getUpdate_time()+
						       "&sign_up_start_day="+phyCouVO.getSign_up_start_day()+
						       "&sign_up_end_day="+phyCouVO.getSign_up_end_day()+
						       "&max_sign_up_people="+phyCouVO.getMax_sign_up_people()+
						       "&min_sign_up_people="+phyCouVO.getMin_sign_up_people()+
						       "&current_sign_up_people="+phyCouVO.getCurrent_sign_up_people();
				req.setAttribute("phyCouVO", phyCouVO);        
				String url = "/course/update_cou_input.jsp"+param;
				RequestDispatcher successView = req.getRequestDispatcher(url);
=======
				req.setAttribute("phyCouVO", phyCouVO);         // 資料庫取出的empVO物件,存入req
				String url = "/course/update_cou_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				successView.forward(req, res);
		}
		
		
<<<<<<< HEAD
		if ("update".equals(action)) { 
			
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
=======
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
<<<<<<< HEAD
			Integer course_no = Integer.valueOf(req.getParameter("course_no").trim());		

			String course_name = req.getParameter("course_name");
			if (course_name == null || course_name.trim().length() == 0) {
				errorMsgs.put("name", "課程名稱 請勿空白");
			}
			Integer course_hr = null;
			try {			
			    course_hr = Integer.valueOf(req.getParameter("course_hr").trim());
			} catch (Exception e) {
				errorMsgs.put("hr", "上課時數 請填數字");
			}
//			if (course_hr == null || course_hr == 0) {
//				errorMsgs.add("course_hr 請勿空白");
//			}
			Integer course_price = null;
			try {			
			    course_price = Integer.valueOf(req.getParameter("course_price").trim());
			} catch (Exception e) {
				errorMsgs.put("price", "課程費用 請填數字");
			}
=======
Integer course_no = Integer.valueOf(req.getParameter("course_no").trim());		

String course_name = req.getParameter("course_name");
			if (course_name == null || course_name.trim().length() == 0) {
				errorMsgs.add("course_name 請勿空白");
			}
Integer course_hr = null;
try {			
    course_hr = Integer.valueOf(req.getParameter("course_hr").trim());
} catch (Exception e) {
	errorMsgs.add("course_hr 請填數字");
}
//			if (course_hr == null || course_hr == 0) {
//				errorMsgs.add("course_hr 請勿空白");
//			}
Integer course_price = null;
try {			
    course_price = Integer.valueOf(req.getParameter("course_price").trim());
} catch (Exception e) {
	errorMsgs.add("course_price 請填數字");
}
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
//			if (course_price == null || course_price == 0) {
//				errorMsgs.add("course_price 請勿空白");
//			}
			
<<<<<<< HEAD
			String course_teacher = req.getParameter("course_teacher").trim();
			if (course_teacher == null || course_teacher.trim().length() == 0) {
				errorMsgs.put("teacher", "上課教師 請勿空白");
=======
String course_teacher = req.getParameter("course_teacher").trim();
			if (course_teacher == null || course_teacher.trim().length() == 0) {
				errorMsgs.add("course_teacher 請勿空白");
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
			}
			
			java.sql.Date course_date = null;
			try {				
<<<<<<< HEAD
				course_date = java.sql.Date.valueOf(req.getParameter("course_date").trim());
			} catch (IllegalArgumentException e) {
				course_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("coursedate", "請輸入日期!");
			}
			
			String course_location = req.getParameter("course_location").trim();
			if (course_location == null || course_location.trim().length() == 0) {
				errorMsgs.put("location", "上課教室 請勿空白");
			}
			
			String course_info = req.getParameter("course_info").trim();
			if (course_info == null || course_info.trim().length() == 0) {
				errorMsgs.put("info", "課程資訊 請勿空白");
			}
			Integer course_status = null;
			try {		
			    course_status = Integer.valueOf(req.getParameter("course_status").trim()); 
			} catch (Exception e) {
				errorMsgs.put("status", "課程狀態 請填數字");
			}
=======
course_date = java.sql.Date.valueOf(req.getParameter("course_date").trim());
			} catch (IllegalArgumentException e) {
				course_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
			}
			
String course_location = req.getParameter("course_location").trim();
			if (course_location == null || course_location.trim().length() == 0) {
				errorMsgs.add("course_location 請勿空白");
			}
			
String course_info = req.getParameter("course_info").trim();
			if (course_info == null || course_info.trim().length() == 0) {
				errorMsgs.add("course_info 請勿空白");
			}
Integer course_status = null;
try {		
    course_status = Integer.valueOf(req.getParameter("course_status").trim()); 
} catch (Exception e) {
	errorMsgs.add("course_status 請填數字");
}
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
//			if (course_status == null ) {
//				errorMsgs.add("course_status 請勿空白");
//			}
			
			java.sql.Date create_date = null;
			try {				
<<<<<<< HEAD
				create_date = java.sql.Date.valueOf(req.getParameter("create_date").trim());
			} catch (IllegalArgumentException e) {
				create_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("create", "請輸入日期!");
=======
create_date = java.sql.Date.valueOf(req.getParameter("create_date").trim());
			} catch (IllegalArgumentException e) {
				create_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
			}
			
			java.sql.Date update_time = null;
			try {				
<<<<<<< HEAD
				update_time = java.sql.Date.valueOf(req.getParameter("update_time").trim());
			} catch (IllegalArgumentException e) {
				create_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("update", "請輸入日期!");
=======
update_time = java.sql.Date.valueOf(req.getParameter("update_time").trim());
			} catch (IllegalArgumentException e) {
				create_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
			}
			
			java.sql.Date sign_up_start_day = null;
			try {				
<<<<<<< HEAD
				sign_up_start_day = java.sql.Date.valueOf(req.getParameter("sign_up_start_day").trim());
			} catch (IllegalArgumentException e) {
				create_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("start", "請輸入日期!");
=======
sign_up_start_day = java.sql.Date.valueOf(req.getParameter("sign_up_start_day").trim());
			} catch (IllegalArgumentException e) {
				create_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
			}
			
			java.sql.Date sign_up_end_day = null;
			try {				
<<<<<<< HEAD
				sign_up_end_day = java.sql.Date.valueOf(req.getParameter("sign_up_end_day").trim());
			} catch (IllegalArgumentException e) {
				create_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("end", "請輸入日期!");
			}
			Integer max_sign_up_people = null;
			try {						
			    max_sign_up_people = Integer.valueOf(req.getParameter("max_sign_up_people").trim());
			} catch (Exception e) {
				errorMsgs.put("max", "人數上限 請填數字");
			}
//			if (max_sign_up_people == null || max_sign_up_people == 0) {
//				errorMsgs.add("max_sign_up_people 請勿空白");
//			}
			Integer min_sign_up_people = null;
			try {			
			    min_sign_up_people = Integer.valueOf(req.getParameter("min_sign_up_people").trim());
			} catch (Exception e) {
				errorMsgs.put("min", "人數下限 請填數字");
			}
//			if (min_sign_up_people == null || min_sign_up_people == 0) {
//				errorMsgs.add("min_sign_up_people 請勿空白");
//			}
			Integer current_sign_up_people = null;
			try {		
			    current_sign_up_people = Integer.valueOf(req.getParameter("current_sign_up_people").trim());
			} catch (Exception e) {
				errorMsgs.put("current", "目前報名人數 請填數字");
			}
=======
sign_up_end_day = java.sql.Date.valueOf(req.getParameter("sign_up_end_day").trim());
			} catch (IllegalArgumentException e) {
				create_date=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
			}
Integer max_sign_up_people = null;
try {						
    max_sign_up_people = Integer.valueOf(req.getParameter("max_sign_up_people").trim());
} catch (Exception e) {
	errorMsgs.add("max_sign_up_people 請填數字");
}
//			if (max_sign_up_people == null || max_sign_up_people == 0) {
//				errorMsgs.add("max_sign_up_people 請勿空白");
//			}
Integer min_sign_up_people = null;
try {			
    min_sign_up_people = Integer.valueOf(req.getParameter("min_sign_up_people").trim());
} catch (Exception e) {
	errorMsgs.add("min_sign_up_people 請填數字");
}
//			if (min_sign_up_people == null || min_sign_up_people == 0) {
//				errorMsgs.add("min_sign_up_people 請勿空白");
//			}
Integer current_sign_up_people = null;
try {		
    current_sign_up_people = Integer.valueOf(req.getParameter("current_sign_up_people").trim());
} catch (Exception e) {
	errorMsgs.add("current_sign_up_people 請填數字");
}
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
//			if (current_sign_up_people == null ) {
//				errorMsgs.add("current_sign_up_people 請勿空白");
//			}
			
			Part part = req.getPart("pic");
			byte[] buf = null;
			InputStream in = part.getInputStream();
			buf = new byte[in.available()];
			in.read(buf);
			in.close();
			
			
 
<<<<<<< HEAD
//			PhyCouVO phyCouVO = new PhyCouVO();
//			phyCouVO.setCourse_no(course_no);
//			phyCouVO.setCourse_name(course_name);
//			phyCouVO.setCourse_hr(course_hr);
//			phyCouVO.setCourse_price(course_price);
//			phyCouVO.setCourse_teacher(course_teacher);
//			phyCouVO.setCourse_date(course_date);
//			phyCouVO.setCourse_location(course_location);
//			phyCouVO.setCourse_info(course_info);
//			phyCouVO.setCourse_status(course_status);
//			phyCouVO.setCreate_date(create_date);
//			phyCouVO.setUpdate_time(update_time);
//			phyCouVO.setSign_up_start_day(sign_up_start_day);
//			phyCouVO.setSign_up_end_day(sign_up_end_day);
//			phyCouVO.setMax_sign_up_people(max_sign_up_people);
//			phyCouVO.setMin_sign_up_people(min_sign_up_people);
//			phyCouVO.setCurrent_sign_up_people(current_sign_up_people);
//			phyCouVO.setPic(buf);
					

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("phyCouVO", phyCouVO); 
				RequestDispatcher failureView = req
						.getRequestDispatcher("/course/update_cou_input.jsp");
=======
			PhyCouVO phyCouVO = new PhyCouVO();
			phyCouVO.setCourse_no(course_no);
			phyCouVO.setCourse_name(course_name);
			phyCouVO.setCourse_hr(course_hr);
			phyCouVO.setCourse_price(course_price);
			phyCouVO.setCourse_teacher(course_teacher);
			phyCouVO.setCourse_date(course_date);
			phyCouVO.setCourse_location(course_location);
			phyCouVO.setCourse_info(course_info);
			phyCouVO.setCourse_status(course_status);
			phyCouVO.setCreate_date(create_date);
			phyCouVO.setUpdate_time(update_time);
			phyCouVO.setSign_up_start_day(sign_up_start_day);
			phyCouVO.setSign_up_end_day(sign_up_end_day);
			phyCouVO.setMax_sign_up_people(max_sign_up_people);
			phyCouVO.setMin_sign_up_people(min_sign_up_people);
			phyCouVO.setCurrent_sign_up_people(current_sign_up_people);
			phyCouVO.setPic(buf);
			
			

		

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
req.setAttribute("phyCouVO", phyCouVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/course/select_page.jsp");
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				failureView.forward(req, res);
				return;
			}
				
				/***************************2.開始修改資料*****************************************/
				PhyCouService phyCouSvc = new PhyCouService();
<<<<<<< HEAD
				PhyCouVO phyCouVO = phyCouSvc.updateCou(course_no, course_name, course_hr, course_price, course_teacher, course_date, course_location, course_info, course_status, create_date, update_time, sign_up_start_day, sign_up_end_day, max_sign_up_people, min_sign_up_people, current_sign_up_people, buf);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("phyCouVO", phyCouVO); 
=======
				phyCouVO = phyCouSvc.updateCou(course_no, course_name, course_hr, course_price, course_teacher, course_date, course_location, course_info, course_status, create_date, update_time, sign_up_start_day, sign_up_end_day, max_sign_up_people, min_sign_up_people, current_sign_up_people, buf);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("phyCouVO", phyCouVO); // 資料庫update成功後,正確的的empVO物件,存入req
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				String url = "/course/listOneCou.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
		}

<<<<<<< HEAD
        if ("insert".equals(action)) {   
=======
        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
			
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
<<<<<<< HEAD
			String course_name = req.getParameter("course_name");
				if (course_name == null || course_name.trim().length() == 0) {
					errorMsgs.put("name", "課程名稱 請勿空白");
				}
			Integer course_hr = null;
			try {				
			    course_hr = Integer.valueOf(req.getParameter("course_hr").trim());
			} catch  (Exception e) {
				errorMsgs.put("hr", "上課時數 請輸入數字");
			}
=======
String course_name = req.getParameter("course_name");
				if (course_name == null || course_name.trim().length() == 0) {
					errorMsgs.put("name", "course_name 請勿空白");
				}
Integer course_hr = null;
try {				
 course_hr = Integer.valueOf(req.getParameter("course_hr").trim());
} catch  (Exception e) {
	errorMsgs.put("hr", "course_hr 請勿空白");
}
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024

	//			if (course_hr == null || course_hr == 0) }
//{
//					errorMsgs.add("course_hr 請勿空白");
//				}
<<<<<<< HEAD
			Integer course_price = null;
			try {	
				course_price = Integer.valueOf(req.getParameter("course_price").trim());
			} catch (Exception e) {
				errorMsgs.put("price", "課程費用 請輸入數字");
			}
=======
Integer course_price = null;
try {	
	course_price = Integer.valueOf(req.getParameter("course_price").trim());
} catch (Exception e) {
	errorMsgs.put("price", "course_price 請輸入數字");
}
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
//				if (course_price == null || course_price == 0) {
//					errorMsgs.add("course_price 請勿空白");
//				}
				
<<<<<<< HEAD
			String course_teacher = req.getParameter("course_teacher").trim();
				if (course_teacher == null || course_teacher.trim().length() == 0) {
					errorMsgs.put("teacher", "上課教師 請勿空白");
=======
String course_teacher = req.getParameter("course_teacher").trim();
				if (course_teacher == null || course_teacher.trim().length() == 0) {
					errorMsgs.put("teacher", "course_teacher 請勿空白");
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				}
				
				java.sql.Date course_date = null;
				try {				
<<<<<<< HEAD
					course_date = java.sql.Date.valueOf(req.getParameter("course_date").trim());
=======
course_date = java.sql.Date.valueOf(req.getParameter("course_date").trim());
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				} catch (IllegalArgumentException e) {
					course_date=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.put("courseDate", "請輸入日期!");
				}
				
<<<<<<< HEAD
				String course_location = req.getParameter("course_location").trim();
				if (course_location == null || course_location.trim().length() == 0) {
					errorMsgs.put("location", "上課教室 請勿空白");
				}
				
				String course_info = req.getParameter("course_info").trim();
				if (course_info == null || course_info.trim().length() == 0) {
					errorMsgs.put("info", "課程資訊 請勿空白");
				}
				Integer course_status = null;		
				try {				
				    course_status = Integer.valueOf(req.getParameter("course_status").trim());
				} catch (Exception e ) { 
					errorMsgs.put("status", "課程狀態 請輸入數字");
				}
=======
String course_location = req.getParameter("course_location").trim();
				if (course_location == null || course_location.trim().length() == 0) {
					errorMsgs.put("location", "course_location 請勿空白");
				}
				
String course_info = req.getParameter("course_info").trim();
				if (course_info == null || course_info.trim().length() == 0) {
					errorMsgs.put("info", "course_info 請勿空白");
				}
Integer course_status = null;		
try {				
    course_status = Integer.valueOf(req.getParameter("course_status").trim());
} catch (Exception e ) { 
	errorMsgs.put("status", "course_status 請輸入數字");
}
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024

//
//				if (course_status == null || course_status <0 ) {
//					errorMsgs.add("course_status 請勿空白");
//				}
				
				
				java.sql.Date sign_up_start_day = null;
				try {				
<<<<<<< HEAD
					sign_up_start_day = java.sql.Date.valueOf(req.getParameter("sign_up_start_day").trim());
=======
sign_up_start_day = java.sql.Date.valueOf(req.getParameter("sign_up_start_day").trim());
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				} catch (IllegalArgumentException e) {
					sign_up_start_day=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.put("start", "請輸入日期!");
				}
				
				java.sql.Date sign_up_end_day = null;
				try {				
<<<<<<< HEAD
					sign_up_end_day = java.sql.Date.valueOf(req.getParameter("sign_up_end_day").trim());
=======
sign_up_end_day = java.sql.Date.valueOf(req.getParameter("sign_up_end_day").trim());
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				} catch (IllegalArgumentException e) {
					sign_up_end_day=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.put("end", "請輸入日期!");
				}
<<<<<<< HEAD
				Integer max_sign_up_people = null ;			
				try {								
				    max_sign_up_people = Integer.valueOf(req.getParameter("max_sign_up_people").trim());
				} catch (Exception e) {
					errorMsgs.put("max", "人數上限 請輸入數字");
				}
//				if (max_sign_up_people == null || max_sign_up_people == 0) {
//					errorMsgs.add("max_sign_up_people 請勿空白");
//				}
				Integer min_sign_up_people = null;
				try {
				    min_sign_up_people = Integer.valueOf(req.getParameter("min_sign_up_people").trim());}
				catch ( Exception e) {
				    errorMsgs.put("min", "人數下限 請輸入數字");
				}
//				if (min_sign_up_people == null || min_sign_up_people == 0) {
//					errorMsgs.add("min_sign_up_people 請勿空白");
//				}
				Integer current_sign_up_people = null;
				try {
				    current_sign_up_people = Integer.valueOf(req.getParameter("current_sign_up_people").trim());}
				catch ( Exception e ) {
					errorMsgs.put("current", "目前報名人數 請輸入數字");
				}
=======
Integer max_sign_up_people = null ;			
try {								
    max_sign_up_people = Integer.valueOf(req.getParameter("max_sign_up_people").trim());
} catch (Exception e) {
	errorMsgs.put("max", "max_sign_up_people 請輸入數字");
}
//				if (max_sign_up_people == null || max_sign_up_people == 0) {
//					errorMsgs.add("max_sign_up_people 請勿空白");
//				}
Integer min_sign_up_people = null;
try {
    min_sign_up_people = Integer.valueOf(req.getParameter("min_sign_up_people").trim());}
catch ( Exception e) {
    errorMsgs.put("min", "min_sign_up_people 請輸入數字");
}
//				if (min_sign_up_people == null || min_sign_up_people == 0) {
//					errorMsgs.add("min_sign_up_people 請勿空白");
//				}
Integer current_sign_up_people = null;
try {
    current_sign_up_people = Integer.valueOf(req.getParameter("current_sign_up_people").trim());}
catch ( Exception e ) {
	errorMsgs.put("current", "current_sign_up_people 請輸入數字");
}
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
//				if (current_sign_up_people == null || current_sign_up_people< 0 ) {
//					errorMsgs.add("current_sign_up_people 請勿空白");
//				}
				
				Part part = req.getPart("pic");
				byte[] buf = null;
				InputStream in  = part.getInputStream();
				buf = new byte[in.available()];
				in.read(buf);
				in.close();
						
				
<<<<<<< HEAD
//				PhyCouVO phyCouVO = new PhyCouVO();
//				phyCouVO.setCourse_name(course_name);
//				phyCouVO.setCourse_hr(course_hr);
//				phyCouVO.setCourse_price(course_price);
//				phyCouVO.setCourse_teacher(course_teacher);
//				phyCouVO.setCourse_date(course_date);
//				phyCouVO.setCourse_location(course_location);
//				phyCouVO.setCourse_info(course_info);
//				phyCouVO.setCourse_status(course_status);
//				phyCouVO.setSign_up_start_day(sign_up_start_day);
//				phyCouVO.setSign_up_end_day(sign_up_end_day);
//				phyCouVO.setMax_sign_up_people(max_sign_up_people);
//				phyCouVO.setMin_sign_up_people(min_sign_up_people);
//				phyCouVO.setCurrent_sign_up_people(current_sign_up_people);
//				phyCouVO.setPic(buf);
=======
				PhyCouVO phyCouVO = new PhyCouVO();
				phyCouVO.setCourse_name(course_name);
				phyCouVO.setCourse_hr(course_hr);
				phyCouVO.setCourse_price(course_price);
				phyCouVO.setCourse_teacher(course_teacher);
				phyCouVO.setCourse_date(course_date);
				phyCouVO.setCourse_location(course_location);
				phyCouVO.setCourse_info(course_info);
				phyCouVO.setCourse_status(course_status);
				phyCouVO.setSign_up_start_day(sign_up_start_day);
				phyCouVO.setSign_up_end_day(sign_up_end_day);
				phyCouVO.setMax_sign_up_people(max_sign_up_people);
				phyCouVO.setMin_sign_up_people(min_sign_up_people);
				phyCouVO.setCurrent_sign_up_people(current_sign_up_people);
				phyCouVO.setPic(buf);
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
		

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
<<<<<<< HEAD
//					req.setAttribute("phyCouVO", phyCouVO); 
=======
req.setAttribute("phyCouVO", phyCouVO); // 含有輸入格式錯誤的empVO物件,也存入req
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
					RequestDispatcher failureView = req
							.getRequestDispatcher("/course/addCou.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				PhyCouService phyCouSvc = new PhyCouService();
<<<<<<< HEAD
				phyCouSvc.addCou(course_name, course_hr, course_price, course_teacher, course_date, course_location, course_info, course_status, sign_up_start_day, sign_up_end_day, max_sign_up_people, min_sign_up_people, current_sign_up_people, buf);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/course/listAllCou.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
=======
				phyCouVO = phyCouSvc.addCou(course_name, course_hr, course_price, course_teacher, course_date, course_location, course_info, course_status, sign_up_start_day, sign_up_end_day, max_sign_up_people, min_sign_up_people, current_sign_up_people, buf);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/course/listAllCou.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				successView.forward(req, res);				
		}
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
				/***************************1.接收請求參數***************************************/
				Integer course_no = Integer.valueOf(req.getParameter("course_no"));
				
				/***************************2.開始刪除資料***************************************/
				PhyCouService phyCouSvc = new PhyCouService();
				phyCouSvc.deleteCou(course_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/course/listAllCou.jsp";
<<<<<<< HEAD
				RequestDispatcher successView = req.getRequestDispatcher(url);
=======
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
				successView.forward(req, res);
		}
	
	
	
<<<<<<< HEAD
	if ("listCous_ByCompositeQuery".equals(action)) { 
=======
	if ("listCous_ByCompositeQuery".equals(action)) { // 來自select_page.jsp的複合查詢請求
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);

			
			/***************************1.將輸入資料轉為Map**********************************/ 
			//採用Map<String,String[]> getParameterMap()的方法 
			//注意:an immutable java.util.Map 
			Map<String, String[]> map = req.getParameterMap();
			
			/***************************2.開始複合查詢***************************************/
			PhyCouService phyCouSvc = new PhyCouService();
			List<PhyCouVO> list  = phyCouSvc.getAll(map);
			
			/***************************3.查詢完成,準備轉交(Send the Success view)************/
<<<<<<< HEAD
			req.setAttribute("listCous_ByCompositeQuery", list); 
			RequestDispatcher successView = req.getRequestDispatcher("/course/listCous_ByCompositeQuery.jsp"); 
=======
			req.setAttribute("listCous_ByCompositeQuery", list); // 資料庫取出的list物件,存入request
			RequestDispatcher successView = req.getRequestDispatcher("/course/listCous_ByCompositeQuery.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
			successView.forward(req, res);
	}		

}
}
