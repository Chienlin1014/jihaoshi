<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.onlinecoursecomment.model.*"%>
<%
  OnlineCourseCommentVO onlineCourseCommentVO = (OnlineCourseCommentVO) request.getAttribute("onlineCourseCommentVO"); //FAQServlet.java (Concroller) 存入req的VO物件 (包括幫忙取出的faqVO, 也包括輸入資料錯誤時的faqVO物件)
%>
<html>
<head>
<title>線上課程評論</title>
<link type="text/css"
	href="<%=request.getContextPath()%>/css/jihaoshi.css" rel="stylesheet">
<style>
#pageHead {
	width: 100%;
	height: 30%;
}

a {
	font-size: 20px;
}

table {
	width: 1050px;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 8px;
	text-align: center;
}
</style>
</head>
<body>
	<img src="<%=request.getContextPath()%>/images/JihaoshiPageHead.jpg"
		id="pageHead">
	<div class="block_N" style="margin: 0px auto;">
		<!--搜尋欄開始-->
		<div class="Nm"
			style="display: flex; justify-content: center; align-items: center;">
			<ul class="searchfield">
				<li><input id="keyword" type="text" class="text ac_input"
					placeholder="請輸入關鍵字" autocomplete="off"></li>
				<li><input id="btn_search" type="button" class="button"
					value="找菜單"></li>
			</ul>
		</div>
		<!--搜尋欄結束-->
	</div>
	<div id="WRAPPER" class="ecsite-layout style_shopping ecsite-search">
		<div id="CONTENT" class="layout-wrapper">
			<div class="layout-center" style="text-align: center">
				<!--側邊欄區塊開始-->
				<dl class="block_W">
					<dd id="CategoryContainer">
						<ul class="treeview">
							<li id="cate_D" class="expanded"><H1>功能列表</H1>
								<ul class="main">
									<li><a href="<%=request.getContextPath()%>/index.jsp">回首頁</a>
									</li>
								</ul>
							</li>
						</ul>
					</dd>
				</dl>
				<!--側邊欄區塊結束-->
				<div class="block_C s_list">
					<div class="Cm">
						<div id="ItemContainer" class="Cm_C">
							<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color:red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color:red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OnlineCourseCommentServlet" name="updateOnlineCourseComment">
			<div>
				<label>線上課程評論編號：<%=onlineCourseCommentVO.getCommentNo()%></label><br><br>
				<label>會員編號_帳號：<%=onlineCourseCommentVO.getMemberNo()%>_${onlineCourseCommentVO.memberVO.memberAccount}</label><br><br>
				<label>線上課程編號_名稱：<%=onlineCourseCommentVO.getCourseNo()%>_${onlineCourseCommentVO.onlineCourseVO.courseName}</label><br><br>
				<label>線上課程評論內容：</label><br><br>
				<textarea name="commentContent"><%=onlineCourseCommentVO.getCommentContent()%></textarea><br><br> 
	            <label>評分：</label><br><br>
				<input type="range" min="0" max="10" value="<%=onlineCourseCommentVO.getCommentScore()%>" name="commentScore" 
				onchange="document.getElementById('show').innerHTML=value">
				<span id="show"><%=onlineCourseCommentVO.getCommentScore()%></span>
	            <br><br> 
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="memberNo" value="<%=onlineCourseCommentVO.getMemberNo()%>">
				<input type="hidden" name="courseNo" value="<%=onlineCourseCommentVO.getCourseNo()%>">
				<input type="hidden" name="commentNo" value="<%=onlineCourseCommentVO.getCommentNo()%>">
			<input type="submit" value="送出修改">
			</div>
		</FORM>
							<dl class="col3f" id="DRAA0A-A900BUT82">
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>
