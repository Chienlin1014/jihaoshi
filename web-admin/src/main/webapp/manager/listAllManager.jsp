<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.manager.model.*"%>

<%
ManagerService manSvc = new ManagerService();
List<ManagerVO> list = manSvc.getAll();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listAllManager</title>
</head>
<body>
<h1>會員資料</h1>
	<table>
		<tr>
			<th>管理員編號</th>
			<th>管理員姓名</th>
			<th>管理員帳號</th>
			<th>管理員狀態</th>
			<th>權限名稱</th>

		</tr>
		<c:forEach var="ManagerVO" items="${list}">
			<tr>
				<td>${ManagerVO.managerNo}</td>
				<td>${ManagerVO.managerName}</td>
				<td>${ManagerVO.managerAccount}</td>
				<td>${ManagerVO.managerStatus}</td>
				<td>${ManagerVO.authorityName}</td>
				
			</tr>
		</c:forEach>
	</table>
<!-- 	<a href='frontPage.jsp'>到首頁</a> -->
	<br>
	<br>
</body>
</html>