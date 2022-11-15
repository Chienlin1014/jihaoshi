<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.forum_article_report.model.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>論壇文章檢舉新增</title>
<link type="text/css" href="<%=request.getContextPath()%>/css/jihaoshi.css" rel="stylesheet">
    <style>
        #pageHead { 
            width: 100%;
            height: 30%; 
        }
        div.divflex{
        display:flex;
        width:100%;
        margin:0;
        height:100vh-30%;
        }
        body{
        height: 100vh;
        background-color:#FFFAF0;
        }
        div.formdiv{
        style="width:80%%;
        background: #FFFAF0;
        }
    </style>

</head>
 
<body bgcolor='white'>
<img src="<%=request.getContextPath()%>/images/JihaoshiPageHead.jpg" id="pageHead">
	<h1>論壇文章檢舉新增:</h1>
	<br>
	<form method="post" action="/web/Forum_article_reportServlet" id="form1">
		<div>
		
			<label>輸入論壇文章編號：</label><input type="text" name="article_no" value="${param.article_no}" required><br>
			<br> 
			<label>輸入會員編號：</label><input type="text" name="member_no" value="${param.member_no}" required><br>
			<br>
			
			<label>輸入檢舉事由：</label><textarea name="report_reason" value="${param.report_reason}" required></textarea>
			<br>
			<br> <input type="hidden" name="action" value="insert">
			
			<button type="submit" form="form1" value="送出">送出新增</button>
			
		</div>
	</form>
</body>

</html>