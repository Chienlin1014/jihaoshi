<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>front page</title>
<style>
table {
	width: 270px;
	background-color: lightgray;
	margin-top: 1px;
	margin-bottom: 1px;
	magin-left: 50%;
	font-size: 18px;
}

h3 {
	text-align: center;
}

form {
	margin: 65px;
	border: 1px solid black;
	/* 	width: 270px; */
	height: 400px;
	margin-left: 38%;
	position: absolute;
	background-color: lightgray;
	border-radius: 10px 10px 10px 10px;
}

#submit {
	position: absolute;
	margin-left: 40%;
}
</style>

</head>
<body>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>


	<FORM METHOD="post" ACTION="MemberServlet">
		<h3 id="form-title">登入會員:</h3>
		<table>
			<tr>
				<td>會員帳號:</td>
				<td><input type="text" name="memberAccount" id="account"></td>
			</tr>

			<tr>
				<td>會員密碼:</td>
				<td><input type="password" name="memberPassword" id="password"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="action" value="Login"> <input
					type="submit" value="送出" onclick="login()"></td>
				<td><a
					href="<%=request.getContextPath()%>/member/addmember.jsp">註冊</a></td>
			</tr>
		</table>


	</FORM>
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
        
	async function login() {
        const ac = document.getElementById("account").value
        const pas = document.getElementById("password").value
        console.log(ac);
        console.log(pas);
        const url = './MemberServlet?action=Login&memberAccount=ac&memberPassword=pas';
//                member/MemberServlet?action=Login&memberAccount=tony&memberPassword=password
        fetch(url)
            .then(res => res.json())
            .then(memVO => {
				const account = \${memVO.memberAccount};
				const No= \${memVO.memberNo};
                sessionStorage.setItem("account", account);
				sessionStorage.setItem("No", No);
				
            });
    }
    </script>

</body>
</html>