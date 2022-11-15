<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>

<%
MemService memSvc = new MemService();
MemberVO MemberVO = (MemberVO) request.getAttribute("MemberVO");
%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-color: lightgray;
}

h1 {
	color: blue;
	display: inline;
	margin-left: 43%;
}
</style>

<style>
table {
	width: 800px;
	/* 	background-color: #79798c; */
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: auto;
	margin-right: auto;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

<title>listOneMember</title>
</head>
<body>
	<div>
		會員編號:${MemberVO.memberNo}<br>
		會員密碼:${MemberVO.memberPassword}<br>
		會員姓名:${MemberVO.memberName}<br>
		會員電話:${MemberVO.memberPhone}<br>
		會員暱稱:${MemberVO.memberNickname}<br>
		會員地址:${MemberVO.memberAddress}<br>
		會員e-mail:${MemberVO.memberEmail}
	</div>

<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/member/MemberServlet"
		style="margin-bottom: 0px;">
		<input type="submit" value="修改"> <input type="hidden"
			name="memberNo" value="${MemberVO.memberNo}"> <input
			type="hidden" name="action" value="getOne_For_Update">

	</FORM>




	<a href='../index.jsp'>到首頁</a>
	<br>
	<br>

</body>
</html>