package com.online_course.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OnlineCourseInsert")
@MultipartConfig(fileSizeThreshold = 0, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class OnlineCourseServlet extends HttpServlet {
	@Override
	 protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");
        
//        Integer course_no =Integer.valueOf(req.getParameter("course_no"));
        String courseName = req.getParameter("course_name");
        String courseHr = req.getParameter("course_hr");
        String courseTeacher = req.getParameter("course_teacher");
        String courseInfo = req.getParameter("course_info");
        Integer coursePrice = Integer.valueOf(req.getParameter("course_price"));
        Integer courseStatus = Integer.valueOf(req.getParameter("course_status"));
        
        
        OnlineCourseVO course = new OnlineCourseVO(courseName, courseHr, courseTeacher, courseInfo, coursePrice, courseStatus);
        OnlineCourseJDBCDAO dao = new OnlineCourseJDBCDAO();
        dao.insert(course);

//        InputStream in = req.getPart("mealPhoto").getInputStream();

    }
}


