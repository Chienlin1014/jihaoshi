package com.onlinecoursecomment.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;
import com.onlinecoursecomment.model.OnlineCourseCommentService;
import com.onlinecoursecomment.model.OnlineCourseCommentVO;

@WebServlet("/OnlineCourseCommentServlet")
public class OnlineCourseCommentServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		res.setContentType("text/html; charset=UTF-8");
		
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			String str = req.getParameter("memberNo");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入會員編號");
			}
			Integer memberNo = null;
			try {
				memberNo = new Integer(str);
			} catch (Exception e) {}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/onlinecoursecomment/onlinecoursecomment_select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 ****************************************/
			OnlineCourseCommentService onlineCourseCommentSvc = new OnlineCourseCommentService();
			List<OnlineCourseCommentVO> list = onlineCourseCommentSvc.getOnlineCommentsByMemberNo(memberNo);
			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("getOne_For_Display", list); // 資料庫取出的list物件,存入request

			String url = null;
			if ("getOne_For_Display".equals(action))
				url = "/onlinecoursecomment/listOneMemberComments.jsp"; // 成功轉交

			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("add".equals(action)) { // 來自add.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/		
			Integer memberNo=1;
			//HttpSisson session=req.getSession();
			Integer courseNo=5;
			//String courseNo = req.getParameter("courseNo");
			
			String commentCentent = req.getParameter("commentContent");
			if (commentCentent == null || commentCentent.trim().length() == 0) {
				errorMsgs.add("請輸入評論內容");
			}

			String str = req.getParameter("commentScore");
			if (str == null || "0".equals(str)) {
				errorMsgs.add("請選擇評論分數");
			}
			Integer commentScore = null;
			try {
				commentScore = Integer.valueOf(str);
			} catch (Exception e) {}
			
			OnlineCourseCommentVO onlineCourseCommentVO = new OnlineCourseCommentVO();
			onlineCourseCommentVO.setMemberNo(memberNo);
			onlineCourseCommentVO.setCourseNo(courseNo);
			onlineCourseCommentVO.setCommentContent(commentCentent);
			onlineCourseCommentVO.setCommentScore(commentScore);

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("onlineCourseCommentVO", onlineCourseCommentVO); // 含有輸入格式錯誤的物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/onlinecoursecomment/addOnlineCourseComment.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 2.開始新增資料 ***************************************/
			OnlineCourseCommentService onlineCourseCommentSvc = new OnlineCourseCommentService();
			onlineCourseCommentVO = onlineCourseCommentSvc.addOnlineCourseComment(memberNo,courseNo,commentCentent,commentScore);
			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/onlinecoursecomment/listAllOnlineCourseComment.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交
			successView.forward(req, res);

		}
		
		if ("delete".equals(action) || "delete_Bymember".equals(action)){ // 來自listAll.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer commentNo = Integer.valueOf(req.getParameter("commentNo"));

			/*************************** 2.開始刪除資料 ***************************************/
			OnlineCourseCommentService onlineCourseCommentSvc = new OnlineCourseCommentService();
			onlineCourseCommentSvc.deleteOnlineCourseComment(commentNo);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = null;
			if ("delete".equals(action))
				url = "/onlinecoursecomment/listAllOnlineCourseComment.jsp";        // 成功轉交 .jsp
			else if ("delete_Bymember".equals(action))
				url = "/onlinecoursecomment/onlinecoursecomment_select_page.jsp";		
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}
		
		if ("getOne_For_Update".equals(action)) { // 來自listAll.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer commentNo = Integer.valueOf(req.getParameter("commentNo"));

			/*************************** 2.開始查詢資料 ****************************************/
			OnlineCourseCommentService onlineCourseCommentSvc = new OnlineCourseCommentService();
			OnlineCourseCommentVO onlineCourseCommentVO = onlineCourseCommentSvc.getOneOnlineCourseComment(commentNo);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("onlineCourseCommentVO", onlineCourseCommentVO); // 資料庫取出的VO物件,存入req
			String url = "/onlinecoursecomment/update_onlinecoursecomment_input.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update__input.jsp
			successView.forward(req, res);
		}
		
		if ("update".equals(action)) { // 來自update__input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer commentNo = Integer.valueOf(req.getParameter("commentNo"));		
			Integer memberNo = Integer.valueOf(req.getParameter("memberNo"));
			Integer courseNo = Integer.valueOf(req.getParameter("courseNo"));
			
			String commentCentent = req.getParameter("commentContent");
			if (commentCentent == null || commentCentent.trim().length() == 0) {
				errorMsgs.add("請輸入評論內容");
			}

			String str = req.getParameter("commentScore");
			if (str == null || str.trim().length() == 0) {
				errorMsgs.add("請選擇評論分數");
			}
			Integer commentScore = null;
			try {
				commentScore =  Integer.valueOf(str);
			} catch (Exception e) {}
			
			OnlineCourseCommentVO onlineCourseCommentVO = new OnlineCourseCommentVO();
			onlineCourseCommentVO.setMemberNo(memberNo);
			onlineCourseCommentVO.setCourseNo(courseNo);
			onlineCourseCommentVO.setCommentContent(commentCentent);
			onlineCourseCommentVO.setCommentScore(commentScore);

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("onlineCourseCommentVO", onlineCourseCommentVO); // 含有輸入格式錯誤的VO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/onlinecoursecomment/update_onlinecoursecomment_input.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始修改資料 *****************************************/
			OnlineCourseCommentService onlineCourseCommentSvc = new OnlineCourseCommentService();
			onlineCourseCommentVO = onlineCourseCommentSvc.updateOnlineCourseComment(commentNo,memberNo,courseNo,commentCentent,commentScore);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("onlineCourseCommentVO", onlineCourseCommentVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/onlinecoursecomment/listAllOnlineCourseComment.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneFAQ.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Status".equals(action)) { // 來自listAll.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer commentNo = Integer.valueOf(req.getParameter("commentNo"));
			Integer commentStatus = Integer.valueOf(req.getParameter("commentStatus"));
			
			OnlineCourseCommentVO onlineCourseCommentVO = new OnlineCourseCommentVO();
			onlineCourseCommentVO.setCommentNo(commentNo);
			onlineCourseCommentVO.setCommentStatus(commentStatus);
			
			/*************************** 2. ****************************************/
			OnlineCourseCommentService onlineCourseCommentSvc = new OnlineCourseCommentService();
			onlineCourseCommentVO = onlineCourseCommentSvc.updateOnlineCourseCommentStatus(commentNo,commentStatus);
			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("onlineCourseCommentVO", onlineCourseCommentVO); // 資料庫取出的VO物件,存入req
			String url = "/onlinecoursecomment/listAllOnlineCourseComment.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update__input.jsp
			successView.forward(req, res);
		}
	}
}