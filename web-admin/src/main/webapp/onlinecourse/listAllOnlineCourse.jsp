<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.online_course.model.*"%>


<%
OnlineCourseService onlinecourseSvc = new OnlineCourseService();
List<OnlineCourseVO> list = onlinecourseSvc.getAll();
pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<html>
<head>
<title>所有課程資料- listAllOnlineCourse.jsp</title>
<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>


	<table id="table-1">
		<tr>
			<td>
				<h3>所有線上課程資料 - listAllOnlineCourse.jsp</h3>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>線上課程編號</th>
			<th>線上課程名稱</th>
			<th>線上課程時數</th>
			<th>線上課程師資</th>
			<th>線上課程簡介</th>
			<th>線上課程價格</th>
			<th>線上課程狀態</th>
			<th>編輯時間</th>
			<th>評論人數</th>
			<th>評論分數</th>
			
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="onlinecourseVO" items="${list}" 
		    begin="<%=pageIndex%>" 
			end="<%=pageIndex+rowsPerPage-1%>"> 

			<tr>
				<td>${onlinecourseVO.courseNo}</td>
				<td>${onlinecourseVO.courseName}</td>
				<td>${onlinecourseVO.courseHr}</td>
				<td>${onlinecourseVO.courseTeacher}</td>
				<td>${onlinecourseVO.courseInfo}</td>
				<td>${onlinecourseVO.coursePrice}</td>
				<td>${onlinecourseVO.courseStatus}</td>
				<td>${onlinecourseVO.updateDate}</td>
				<td>${onlinecourseVO.commentPeople}</td>
				<td>${onlinecourseVO.commentScore}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/OnlineCourse"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="courseNo" value="${onlinecourseVO.courseNo}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/OnlineCourse"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="courseNo" value="${onlinecourseVO.courseNo}"> <input type="hidden"
							name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>


</body>
</html>