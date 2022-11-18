package com.manager.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.manager.model.ManagerService;
import com.manager.model.ManagerVO;

@WebServlet("/manager/ManagerServlet")
public class ManagerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("Login".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			final HttpSession session = req.getSession();

			String manageracc = req.getParameter("managerAccount");
			String managerpas = req.getParameter("managerPassword");

			if (manageracc == null || manageracc.trim().length() == 0) {
				errorMsgs.add("會員帳號請勿空白");
			}
			if (managerpas == null || managerpas.trim().length() == 0) {
				errorMsgs.add("會員密碼請勿空白");
			}

			ManagerVO mgrVO = new ManagerVO();
			ManagerVO mgrVO2 = new ManagerVO();
//			memVO.setMemberAccount(memberacc);
//			memVO.setMemberPassword(memberpas);

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("ManagerVO", mgrVO);
				RequestDispatcher failureView = req.getRequestDispatcher("/manager/login.jsp");
				failureView.forward(req, res);
				return;
			}

			ManagerService mgrSvc = new ManagerService();
			mgrVO = mgrSvc.Login(manageracc, managerpas);
			if (mgrVO == null) {
				errorMsgs.add("帳號或密碼錯誤");
			}
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", mgrVO);
				RequestDispatcher failureView = req.getRequestDispatcher("/manager/login.jsp");
				failureView.forward(req, res);
				return;
			}
			Integer no = mgrVO.getManagerNo();
			mgrVO2 = mgrSvc.getAuthority(no);
			
			session.setAttribute("ManagerAcc", mgrVO.getManagerAccount());
			session.setAttribute("ManagerName", mgrVO.getManagerName());
			session.setAttribute("ManagerNo", mgrVO.getManagerNo());
			session.setAttribute("AuthorityNo",mgrVO2.getAuthorityNo());
			String location = (String) session.getAttribute("location");
			if (location != null) {
				session.removeAttribute("location");
				res.sendRedirect(location);
			}
			res.sendRedirect(req.getContextPath() + "/index.jsp");

		}

		// 登出
		if ("Logout".equals(action)) {
			final HttpSession session = req.getSession();
			session.removeAttribute("ManagerAcc");
			session.removeAttribute("ManagerName");
			session.removeAttribute("ManagerNo");
			res.sendRedirect(req.getContextPath() + "/index.jsp");
		}
	}
}
