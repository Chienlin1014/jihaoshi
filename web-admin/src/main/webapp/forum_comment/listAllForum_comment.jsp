<%@ page import="com.forum_comment.model.Forum_commentVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.forum_comment.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// Forum_commentVO forum_commentVO = (Forum_commentVO) request.getAttribute("forum_commentVO"); //Forum_commentServlet.java(Concroller), 存入req的Forum_commentVO物件
Forum_commentService forum_commentSvc = new Forum_commentService();
// List<Forum_commentVO> list = forum_commentSvc.getAll(1);
List<Forum_commentVO> list = forum_commentSvc.getAll();
pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>論壇留言資料</title>
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
	width: 1280px;
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
<img src="<%=request.getContextPath()%>/images/JihaoshiPageHead.jpg" id="pageHead">


	<table id="table-1">
		<tr>
			<td>
				<h3>論壇留言資料</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/forum_comment/forum_comment_select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>論壇文章留言編號</th>
			<th>論壇文章編號</th>
			<th>會員編號</th>
			<th>編輯時間</th>
			<th>留言內容</th>
			<th>留言狀態</th>
			
		</tr>
		<%@ include file="forum_comment_page1.file"%>
		<c:forEach var="forum_commentVO" items="${list}"
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">


			<tr>
				<td>${forum_commentVO.comment_no}</td>
				<td>${forum_commentVO.article_no}</td>
				<td>${forum_commentVO.member_no}</td>
				<td>${forum_commentVO.comment_time}</td>
				<td>${forum_commentVO.comment_content}</td>
				
				<td>[${forum_commentVO.comment_status}]
				  ${(forum_commentVO.comment_status==0)? '隱藏':''}
				  ${(forum_commentVO.comment_status==1)? '顯示':''}
			<td>
					<FORM METHOD="post" ACTION="/web-admin/Forum_commentServlet?whichPage=" <%=pageIndex%> style="margin-bottom: 0px;">
						 
						   <input type="submit" value="修改留言狀態"> 
						
						
						
						<input type="hidden" name="comment_no" value="${forum_commentVO.comment_no}">
					
					 <c:if test="${forum_commentVO.comment_status==1}">	
						<input type="hidden" name="action" value="change_status_0">
					 </c:if> 
					 <c:if test="${forum_commentVO.comment_status==0}">	
						<input type="hidden" name="action" value="change_status_1">
					 </c:if> 
					
					</FORM>
				</td>
				
			</tr>

		</c:forEach>
	</table>
	<%@ include file="forum_comment_page2.file"%>
</body>
</html>