<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.latest_news.model.*"%>

<%
Latest_newsVO latest_newsVO = (Latest_newsVO) request.getAttribute("latest_newsVO"); //Latest_newsServlet.java(Concroller), 存入req的latest_newsVO物件
%>
 
<html>
<head>
<title>最新消息資料</title>

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
		 <h3>最新消息資料</h3>
		 <h4><a href="<%= request.getContextPath() %>/latest_news/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>消息編號</th>
		<th>消息標題</th>
		<th>編輯時間</th>
		<th>消息內文</th>
	</tr>
	<tr>
		<td><%=latest_newsVO.getNews_no()%></td>
		<td><%=latest_newsVO.getNews_name()%></td>
		<td><%=latest_newsVO.getUpdate_date()%></td>
		<td><%=latest_newsVO.getNews_content()%></td>
		
	</tr>
</table>

</body>
</html>