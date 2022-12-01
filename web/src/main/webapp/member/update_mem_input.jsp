<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mem.model.*" %>

<%
    MemberVO MemberVO = (MemberVO) request.getAttribute("MemberVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>會員資料修改</title>
    <style>
        #content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        #form {
            display: flex;
            justify-content: center;
            flex-direction: column;
            border-radius: 0.6rem;
            border: 3px solid #ccc;
            width: 600px;
            height: 300px;
            border-style: outset;
        }
    </style>

</head>
<body>
<%@ include file="../navbar.file" %>
<c:if test="${not empty errorMsgs}">
    <font style="color: red">請修正以下錯誤:</font>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color: red">${message}</li>
        </c:forEach>
    </ul>
</c:if>
    <div id="content">
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/MemberServlet">
            <div id="form">
                <div style="margin: 0px auto;">會員編號:
                    <label>${MemberVO.memberNo}</label></div>
                <div style="margin: 0px auto;">會員帳號:
                    <input type="TEXT" name="memberAccount" size="45"
                           value="<%=MemberVO.getMemberAccount()%>"/></div>
                <div style="margin: 0px auto;">會員密碼:
                    <input type="password" name="memberPassword" size="45"
                           value="<%=MemberVO.getMemberPassword()%>"/></div>
                <div style="margin: 0px auto;">會員姓名:
                    <input type="TEXT" name="memberName" size="45"
                           value="<%=MemberVO.getMemberName()%>"/></div>
                <div style="margin: 0px auto;">會員電話:
                    <input type="TEXT" name="memberPhone" size="45"
                           value="<%= MemberVO.getMemberPhone()%>"/></div>
                <div style="margin: 0px auto;">會員暱稱:
                    <input type="TEXT" name="memberNickname" size="45"
                           value="<%=MemberVO.getMemberNickname()%>"/></div>
                <div style="margin: 0px auto;">會員地址:
                    <input type="TEXT" name="memberAddress" size="45"
                           value="<%=MemberVO.getMemberAddress()%>"/></div>

                <div style="margin: 0px auto;">會員email:
                    <input type="TEXT" name="memberEmail" size="45"
                           value="<%=MemberVO.getMemberEmail()%>"/></div>
                <div style="margin: 0px auto;">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="memberNo" value="<%=MemberVO.getMemberNo()%>">
                    <input type="submit" value="送出修改">
                </div>
            </div>
        </FORM>
    </div>

</body>
</html>