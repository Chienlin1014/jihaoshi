<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
MemberVO MemberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>

<title>會員新增 - addmember.jsp</title>

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

	<h3>會員註冊:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red ">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="MemberServlet" name="form1">
		<table>
			<tr>
				<td>會員帳號:</td>
				<td><input type="TEXT" name="memberAccount" size="45"
					value="<%=(MemberVO == null) ? "" : MemberVO.getMemberAccount()%>" /></td>
			</tr>
			<tr>
				<td>會員密碼:</td>
				<td><input type="password" name="memberPassword" size="45"
					value="<%=(MemberVO == null) ? "" : MemberVO.getMemberPassword()%>" /></td>
			</tr>
			<tr>
				<td>會員姓名:</td>
				<td><input type="TEXT" name="memberName" size="45"
					value="<%=(MemberVO == null) ? "" : MemberVO.getMemberName()%>" /></td>
			</tr>
			<tr>
				<td>會員電話:</td>
				<td><input type="TEXT" name="memberPhone" size="45"
					value="<%=(MemberVO == null) ? "" : MemberVO.getMemberPhone()%>" /></td>
			</tr>
			<tr>
				<td>會員暱稱:</td>
				<td><input type="TEXT" name="memberNickname" size="45"
					value="<%=(MemberVO == null) ? "" : MemberVO.getMemberNickname()%>" /></td>
			</tr>
			<tr>
				<td>會員地址:</td>
				<td><input type="TEXT" name="memberAddress" size="45"
					value="<%=(MemberVO == null) ? "" : MemberVO.getMemberAddress()%>" /></td>
			</tr>
			<tr>
				<td>會員email:</td>
				<td><input type="TEXT" name="memberEmail" size="45"
					value="<%=(MemberVO == null) ? "" : MemberVO.getMemberEmail()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增" id="submit">

	</FORM>
</body>
<script>
	
</script>
</html>