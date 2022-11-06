package com.forum_comment.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum_article.model.Forum_articleService;
import com.forum_article.model.Forum_articleVO;
import com.forum_comment.model.Forum_commentService;
import com.forum_comment.model.Forum_commentVO;

@WebServlet("/Forum_commentServlet")
//@MultipartConfig(fileSizeThreshold = 0, maxFileSize = 5)

public class Forum_commentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
//			 Store this set in the request scope, in case we need to
//			 send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("comment_no");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入論壇文章留言編號");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum_article/forum_article_select_page.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			Integer comment_no = null;
			try {
				comment_no = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.add("論壇文章編號格式不正確");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum_comment/forum_comment_select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷

			}
			/*************************** 2.開始查詢資料 *****************************************/
			Forum_commentService forum_commentSvc = new Forum_commentService();
			Forum_commentVO forum_commentVO = forum_commentSvc.getOneForum_comment(comment_no);
			if (Forum_commentVO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum_article/forum_article_select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("forum_articleVO", forum_articleVO); // 資料庫取出的forum_articleVO物件,存入req
			String url = "/forum_article/listOneForum_article.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneForum_article.jsp
			successView.forward(req, res);
		}

}
