<%@ page import="com.forum_comment.model.Forum_commentVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.forum_comment.model.*"%>

<%
Forum_commentVO forum_commentVO = (Forum_commentVO) request.getAttribute("forum_commentVO"); //Forum_commentServlet.java(Concroller), 存入req的forum_commentVO物件
%>
 
<html>
<head>
<title>論壇留言資料</title> 

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
	width: 600px;
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


<table id="table-1">
	<tr><td>
		 <h3>論壇留言資料</h3>
		 <h4><a href="<%= request.getContextPath() %>/forum_comment/forum_comment_select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
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
	<tr>
		<td><%=forum_commentVO.getComment_no()%></td>
		<td><%=forum_commentVO.getArticle_no()%></td>
		<td><%=forum_commentVO.getMember_no()%></td>
		<td><%=forum_commentVO.getComment_time()%></td>
		<td><%=forum_commentVO.getComment_content()%></td>
		<td><%=forum_commentVO.getComment_status()%></td>
		
	</tr>
</table>

</body>
</html>