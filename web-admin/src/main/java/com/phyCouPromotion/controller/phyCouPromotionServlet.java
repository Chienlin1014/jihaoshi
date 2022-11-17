package com.phyCouPromotion.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.course.model.*;
import com.phyCouPromotion.model.PhyCouPromotionService;
import com.phyCouPromotion.model.PhyCouPromotionVO;


@WebServlet("/phyCouPromotion/promotion")
public class phyCouPromotionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
	

		if ("getOne_For_Display".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("project_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入促銷專案编號。");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/phyCouPromotion/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer project_no = null;
				try {
					project_no = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("促銷專案編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/phyCouPromotion/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				PhyCouPromotionService phyCouPromotionSvc = new PhyCouPromotionService();
				PhyCouPromotionVO phyCouPromotionVO = phyCouPromotionSvc.getOnePro(project_no);
				if (phyCouPromotionVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/phyCouPromotion/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("phyCouPromotionVO", phyCouPromotionVO);
				String url = "/phyCouPromotion/listOnePro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
		}
		
		
		if ("getOne_For_Update".equals(action)) { 

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
				Integer project_no = Integer.valueOf(req.getParameter("project_no"));
				
				/***************************2.開始查詢資料****************************************/
				PhyCouPromotionService phyCouPromotionSvc = new PhyCouPromotionService();
				PhyCouPromotionVO phyCouPromotionVO = phyCouPromotionSvc.getOnePro(project_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				String param = "?project_no="    +phyCouPromotionVO.getProject_no()+
						       "&project_name="  +phyCouPromotionVO.getProject_name()+
						       "&start_date="    +phyCouPromotionVO.getStart_date()+
						       "&end_date=" +phyCouPromotionVO.getEnd_date()+
						       "&prom_description="+phyCouPromotionVO.getProm_description()+
						       "&prom_status="  +phyCouPromotionVO.getProm_status()+
						       "&update_time="  +phyCouPromotionVO.getUpdate_time();

						       
				req.setAttribute("phyCouPromotionVO", phyCouPromotionVO);        
				String url = "/phyCouPromotion/update_pro_input.jsp"+param;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
		

		if ("update".equals(action)) { 
			
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			Integer project_no = Integer.valueOf(req.getParameter("project_no").trim());		

			String project_name = req.getParameter("project_name");
			if (project_name == null || project_name.trim().length() == 0) {
				errorMsgs.put("project_name", "專案名稱 請勿空白");
			}
			
			java.sql.Date start_date = null;
			try {				
				start_date = java.sql.Date.valueOf(req.getParameter("start_date").trim());
			} catch (IllegalArgumentException e) {
				start_date = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("start_date", "請輸入日期!");
			}
			
			java.sql.Date end_date = null;
			try {				
				end_date = java.sql.Date.valueOf(req.getParameter("end_date").trim());
			} catch (IllegalArgumentException e) {
				end_date = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("end_date", "請輸入日期!");
			}
			
			String prom_description = req.getParameter("prom_description").trim();
			if (prom_description == null || prom_description.trim().length() == 0) {
				errorMsgs.put("prom_description", "促銷活動敘述 請勿空白");
			}
			
			Integer prom_status = null;
			try {		
				prom_status = Integer.valueOf(req.getParameter("prom_status").trim()); 
			} catch (Exception e) {
				errorMsgs.put("prom_status", "專案狀態 請填數字");
			}
			
			java.sql.Date update_time = null;
			try {				
				update_time = java.sql.Date.valueOf(req.getParameter("update_time").trim());
			} catch (IllegalArgumentException e) {
				update_time = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("update_time", "請輸入日期!");
			}

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
						.getRequestDispatcher("/phyCouPromotion/update_pro_input.jsp");
				failureView.forward(req, res);
				return;
			}
				
				/***************************2.開始修改資料*****************************************/
				PhyCouPromotionService phyCouPromotionSvc = new PhyCouPromotionService();
				PhyCouPromotionVO phyCouPromotionVO = phyCouPromotionSvc.updatePhyCouPromotion(project_no, project_name, start_date, end_date, prom_description, prom_status, update_time);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("phyCouPromotionVO", phyCouPromotionVO); 
				String url = "/phyCouPromotion/listOnePro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
		}

        if ("insert".equals(action)) {   
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/

			String project_name = req.getParameter("project_name");
			if (project_name == null || project_name.trim().length() == 0) {
				errorMsgs.put("project_name", "專案名稱 請勿空白");
			}
			
			java.sql.Date start_date = null;
			try {				
				start_date = java.sql.Date.valueOf(req.getParameter("start_date").trim());
			} catch (IllegalArgumentException e) {
				start_date = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("start_date", "請輸入日期!");
			}
			
			java.sql.Date end_date = null;
			try {				
				end_date = java.sql.Date.valueOf(req.getParameter("end_date").trim());
			} catch (IllegalArgumentException e) {
				end_date = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("end_date", "請輸入日期!");
			}
			
			String prom_description = req.getParameter("prom_description").trim();
			if (prom_description == null || prom_description.trim().length() == 0) {
				errorMsgs.put("prom_description", "促銷活動敘述 請勿空白");
			}
			
			Integer prom_status = null;
			try {		
				prom_status = Integer.valueOf(req.getParameter("prom_status").trim()); 
			} catch (Exception e) {
				errorMsgs.put("prom_status", "專案狀態 請填數字");
			}
						
			String proCous = req.getParameter("proCous").trim();
			if (prom_description == null || prom_description.trim().length() == 0) {
				errorMsgs.put("proCous", "促銷課程清單 請勿空白");
			}
				
			Integer prom_price = null;
			try {		
				prom_status = Integer.valueOf(req.getParameter("prom_price").trim()); 
			} catch (Exception e) {
				errorMsgs.put("prom_price", "促銷打折內容 請填數字");
			}

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
		
        
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("phyCouPromotionVO", phyCouPromotionVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/phyCouPromotion/addPro.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				PhyCouPromotionService phyCouPromotionSvc = new PhyCouPromotionService();
				phyCouPromotionSvc.addPhyCouPromotion(project_name, start_date, end_date, prom_description, prom_status);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/phyCouPromotion/listAllPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);				
		}
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
				/***************************1.接收請求參數***************************************/
				Integer project_no = Integer.valueOf(req.getParameter("project_no"));
				
				/***************************2.開始刪除資料***************************************/
				PhyCouPromotionService phyCouPromotionSvc = new PhyCouPromotionService();
				phyCouPromotionSvc.deletePro(project_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/phyCouPromotion/listAllPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
	
	
//	if ("listPros_ByCompositeQuery".equals(action)) { 
//		List<String> errorMsgs = new LinkedList<String>();
//		// Store this set in the request scope, in case we need to
//		// send the ErrorPage view.
//		req.setAttribute("errorMsgs", errorMsgs);
//
//			
//			/***************************1.將輸入資料轉為Map**********************************/ 
//			//採用Map<String,String[]> getParameterMap()的方法 
//			//注意:an immutable java.util.Map 
//			Map<String, String[]> map = req.getParameterMap();
//			
//			/***************************2.開始複合查詢***************************************/
//			PhyCouPromotionService phyCouPromotionSvc = new PhyCouPromotionService();
//			List<PhyCouPromotionVO> list  = phyCouPromotionSvc.getAll(map);
//			
//			/***************************3.查詢完成,準備轉交(Send the Success view)************/
//			req.setAttribute("listCous_ByCompositeQuery", list); 
//			RequestDispatcher successView = req.getRequestDispatcher("/phyCouPromotion/listCous_ByCompositeQuery.jsp"); 
//			successView.forward(req, res);
//	}		

}
}
