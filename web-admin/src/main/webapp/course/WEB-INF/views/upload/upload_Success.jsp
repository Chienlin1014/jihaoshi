<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>upload_Success.jsp</title>

<style>
  table#table-1 {
    width: 450px;
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

</head>
<body>
<h4>${msg}</h4> <!-- 見GlobalExceptionHandler.java(第39行) -->
	<h2>上傳成功</h2>${name}
		<c:forEach items="${parts}" var="part">
	      <table border=1>
			<tr>
				<td>getOriginalFilename():</td>
				<td>${part.getOriginalFilename()}</td>
			</tr>
			<tr>
				<td>getContentType():</td>
				<td>${part.getContentType()}</td>
			</tr>
			<tr>
				<td>getSize():</td>
				<td>${part.getSize()}</td>
			</tr>
			<tr>
			<td>額外測試秀圖:</td>
				<td><img src="<%=request.getContextPath()%>/images_uploaded/${part.originalFilename}"></td>
			</tr>
	      </table><br><br>
		</c:forEach>

</body>
</html>