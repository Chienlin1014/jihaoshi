package com.online_course.model;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/onlineCourse/onlineCourse.do")
public class Online_CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OnlineCourseService service = new OnlineCourseService();
		String action = request.getParameter("action");
		if ("SearchByNumber".equals(action)) {
			String courseNumber = request.getParameter("course_no");
			Integer courseNo = Integer.parseInt(courseNumber);
			OnlineCourseVO vo = service.getOneOnlineCourse(courseNo);

			request.setAttribute("onlineCourse", vo);
			request.getRequestDispatcher("/onlineCourse/select_page.jsp").forward(request, response);

		} else {
			List<OnlineCourseVO> onlineCourseList = service.getAll();
			request.setAttribute("onlineCourseList", onlineCourseList);
			request.getRequestDispatcher("/onlineCourse/select_page.jsp").forward(request, response);

		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OnlineCourseService service = new OnlineCourseService();
		String action = request.getParameter("action");
		if ("SearchByNumber".equals(action)) {
			String courseNumber = request.getParameter("course_no");
			Integer courseNo = Integer.parseInt(courseNumber);
			OnlineCourseVO vo = service.getOneOnlineCourse(courseNo);

			request.setAttribute("onlineCourse", vo);
			request.getRequestDispatcher("/onlineCourse/select_page.jsp").forward(request, response);

		}
	
	}
}
