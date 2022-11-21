package com.onlinecourseorder.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.online_course_order.model.OnlineCourseOrderService;
import com.online_course_order.model.OnlineCourseOrderVO;


@WebServlet("/onlineCourseOrderServlet")
public class OnlineCourseOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OnlineCourseOrderService courseorderSV = new OnlineCourseOrderService();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		

		if ("orderlist".equals(action)) {
			List<OnlineCourseOrderVO> list = courseorderSV.getOneOnlineCourseOrderMem(4); //整合的時候要改，串到登入的資料
			req.setAttribute("list", list);
			req.getRequestDispatcher("/onlineCourseOrder/ListMemOnlineCourseOrder.jsp").forward(req, res);

		}
	
	
	 if("searchOrderDetail".equals(action)) {
		Integer orderNo = Integer.parseInt(req.getParameter("orderNo"));
		OnlineCourseOrderVO order = courseorderSV.getOrderDetail(orderNo);
		req.setAttribute("order", order);
		req.getRequestDispatcher("/onlineCourseOrder/OnlineCourseOrderDetail.jsp").forward(req, res);
	}
 }
}
