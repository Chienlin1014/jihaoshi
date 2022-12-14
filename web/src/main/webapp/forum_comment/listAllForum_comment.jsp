<%@ page import="com.forum_comment.model.Forum_commentVO"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.forum_comment.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// Forum_commentVO forum_commentVO = (Forum_commentVO) request.getAttribute("forum_commentVO"); //Forum_commentServlet.java(Concroller), 存入req的Forum_commentVO物件
Forum_commentService forum_commentSvc = new Forum_commentService();
List<Forum_commentVO> list = forum_commentSvc.getAll(5);
pageContext.setAttribute("list", list);
%>

<html>
<head> 
<title>論壇留言資料</title> 

<style>
table#table-1 {
	border: 2px solid black;
	text-align: center;
}

table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 95%;
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}
.button {
	border-radius:1rem; 
 	border: 1px solid #ccc;
}
#content {
	display:flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;"
}
#head {
	display:flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;"
}       
</style>

</head>
<body bgcolor='white'>
<%@ include file="../navbar.file" %>
<br>
<div id="head">
	<table id="table-1">
		<tr>
			<td>
				<h3>論壇留言資料</h3>
				<button class="button">
					<a href="<%=request.getContextPath()%>/forum_comment/forum_comment_select_page.jsp" style="text-decoration: none;color:#333;">回首頁</a>
				</button>
			</td>
		</tr>
	</table>
</div>
	<div id="content">
	<table>
		<tr>
			<th>論壇文章留言編號</th>
			<th>論壇文章編號</th>
			<th>會員編號</th>
			<th>編輯時間</th>
			<th>留言內容</th>
			<th>留言狀態</th>			
		</tr>
		<div style="margin: 0px auto;">
		<%@ include file="forum_comment_page1.file"%>
		</div>
		<c:forEach var="forum_commentVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${forum_commentVO.comment_no}</td>
				<td>${forum_commentVO.article_no}</td>
				<td>${forum_commentVO.member_no}</td>
				<td>${forum_commentVO.comment_time}</td>
				<td>${forum_commentVO.comment_content}</td>
				<td>${forum_commentVO.comment_status}</td>
				<td>
					<FORM METHOD="post" ACTION="/web/Forum_commentServlet"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="comment_no" value="${forum_commentVO.comment_no}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
<!-- 				<td> -->
<!-- 					<FORM METHOD="post" ACTION="/web/Forum_articleServlet" -->
<!-- 						style="margin-bottom: 0px;"> -->
<!-- 						<input type="submit" value="刪除"> <input type="hidden" -->
<%-- 							name="article_no" value="${forum_articleVO.article_no}"> --%>
<!-- 						<input type="hidden" name="action" value="delete"> -->
<!-- 					</FORM> -->
<!-- 				</td> -->
			</tr>
		</c:forEach>
	</table>
	</div>
	<br>
	<%@ include file="forum_comment_page2.file"%>
</body>
</html>