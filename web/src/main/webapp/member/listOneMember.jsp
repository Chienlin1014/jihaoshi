<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mem.model.*" %>

<%
    MemService memSvc = new MemService();
    MemberVO MemberVO = (MemberVO) request.getAttribute("MemberVO");
%>
<!DOCTYPE html>
<html>
<head>

    <title>listOneMember</title>
</head>
<body>


<%@ include file="../navbar.file" %>
<table>
    <tr>
        <td>會員編號</td>
        <td>${MemberVO.memberNo}</td>
    </tr>
    <tr>
        <td>會員姓名</td>
        <td>${MemberVO.memberName}</td>
    </tr>
    <tr>
        <td>會員電話</td>
        <td>${MemberVO.memberPhone}</td>
    </tr>
    <tr>
        <td>會員暱稱</td>
        <td>${MemberVO.memberNickname}</td>
    </tr>
    <tr>
        <td>會員地址</td>
        <td>${MemberVO.memberAddress}</td>
    </tr>
    <tr>
        <td>會員e-mail</td>
        <td>${MemberVO.memberEmail}</td>
    </tr>
    <tr>
        <td>會員狀態</td>
        <td>${MemberVO.memberState}</td>
    </tr>
    <tr>
        <FORM METHOD="post" ACTION="member/MemberServlet">
            <b></b>
            <input type="hidden" name="memberNo" value="${member.memberNo}">
            <input type="hidden" name="action" value="getOne_For_Update">
            <input type="submit" value="修改">

        </FORM>
    <tr>
</table>
<br>
<br>

</body>
</html>