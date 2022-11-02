<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.online_course.model.*"%>
<!DOCTYPE html>

<%
OnlineCourseVO onlinecourseVO = (OnlineCourseVO) request.getAttribute("onlinecourseVO");
%>



<html>
<head>

<meta charset="UTF-8">
<title>線上課程新增</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>

<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>線上課程新增 - addOnlineCourse.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="${pageContext.request.contextPath}/onlinecourse/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>線上課程資料新增:</h3>


	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="${pageContext.request.contextPath}/OnlineCourse" name="form1"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>線上課程名稱:</td>
				<td><input type="TEXT" name="courseName" size="45"
					value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCourseName()%>" /></td>
			</tr>
			<tr>
				<td>線上課程時數:</td>
				<td><input type="TEXT" name="courseHr" size="45"
					value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCourseHr()%>" /></td>
			</tr>
			<tr>
				<td>線上課程師資:</td>
				<td><input type="TEXT" name="courseTeacher" size="45"
					value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCourseTeacher()%>" /></td>
			</tr>
			<tr>
				<td>線上課程簡介:</td>
				<td><input type="TEXT" name="courseInfo" size="45"
					value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCourseInfo()%>" /></td>
			</tr>
			<tr>
				<td>線上課程價格:</td>
				<td><input type="TEXT" name="coursePrice" size="45"
					value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCoursePrice()%>" /></td>
			</tr>

			<tr>
				<td>評論人數:</td>
				<td><input type="TEXT" name="commentPeople" size="45"
					value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCommentPeople()%>" /></td>
			</tr>


			<tr>
				<td>評論分數:</td>
				<td><input type="TEXT" name="commentScore" size="45"
					value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCommentScore()%>" /></td>
			</tr>

			<tr>
				<td>圖片上傳:</td>
				<td><input type="file" name="photo"></td>
			</tr>

			<tr>
				<td>上架狀態:</td>
				<td><input type="radio" name="courseStatus" value="0"
					${(onlinecourseVO == null || onlinecourseVO.courseStatus==0)? 'checked':'' } /> 上架 <input
					type="radio" name="courseStatus" value="1"
					${(onlinecourseVO.courseStatus==1)? 'checked':'' } />下架</td>
			</tr>

			<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.online_course.model.OnlineCourseService" /> --%>
			<!-- 	<tr> -->
			<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
			<!-- 		<td><select size="1" name="deptno"> -->
			<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
			<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname} --%>
			<%-- 			</c:forEach> --%>
			<!-- 		</select></td> -->
			<!-- 	</tr> -->

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>


</html>