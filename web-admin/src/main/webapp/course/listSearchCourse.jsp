<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.course.model.*"%>
<%
	List<PhyCouVO> list = (List)request.getAttribute("searchResult");
    pageContext.setAttribute("list",list);
%>

<html>
<head>
    <title>Title</title>
    <%-- <link type="text/css" href="${ctxPath}/css/jihaoshi.css" rel="stylesheet"> --%>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
	#container { width:100%; display:flex; flex-direction:column; flex_wrap:wrap;}
	header { width:100%;  height: 170px; text-align: center;}
	nav { width:100%; height:40px; text-align: center; display: inline;  }
	article { width:100%; height:420px;}
		#pageHead {
		    width: 100%;
		    height: 100%;
  		}
  		#searchBar { width:100%; height:50px; justify-content: center; align-items: center;}
  		 table {
			width: 100%;
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
		  #info {
		    width:360px;
		  }
  		
	</style>
</head>
<body>
<div id="container">
 <header>
<img src="../images/JihaoshiPageHead.jpg" id="pageHead">
</header>
	<h2 style="margin: 10px auto">所有實體課程開課資料</h2>
<nav>
<a href="${ctxPath}/course/select_page.jsp" style="text-decoration: none; color: blue; font-weight: 700">回課程管理頁 </a>
<a href="${ctxPath}/index.jsp" style="margin: auto 30px;text-decoration: none; color: blue; font-weight: 700"> 回首頁 </a>
	<form method="post" action="${ctxPath}/course/cou.do" enctype="application/x-www-form-urlencoded"
				id="searceKeyword" style="display:inline-block;">	
						<input type="text" name="nameKeyword" id="keyword"  class="text ac_input"  placeholder="請輸入關鍵字">
						<input type="submit" value="搜尋課程">
						<input type="hidden" name="action" value="nameKeywordSearch">                    
	</form>

</nav>


<article>
<table>
							<tr>
								<th>課程編號</th>
								<th>課程名稱</th>
								<th>上課時數</th>
								<th>課程費用</th>
								<th>授課教師</th>
								<th>開課日期</th>
								<th>上課教室</th>
								<th id="info">課程簡介</th>
								<th>課程狀態</th>		
								<th>上架日期</th>		
								<th>編輯時間</th>		
								<th>報名開始日期</th>
								<th>報名結束日期</th>
								<th>人數上限</th>
								<th>人數下限</th>
								<th>報名人數</th>
								<th>照片</th>									
							</tr>
							<c:forEach var="phyCouVO" items="${list}"> 
								
								<tr>
									<td>${phyCouVO.course_no}</td>
									<td>${phyCouVO.course_name}</td>
									<td>${phyCouVO.course_hr}</td>
									<td>${phyCouVO.course_price}</td>
									<td>${phyCouVO.course_teacher}</td>
									<td>${phyCouVO.course_date}</td> 
									<td>${phyCouVO.course_location}</td>
									<td>${phyCouVO.course_info}</td>
									<td><c:if test="${phyCouVO.course_status==0}">
											待上架
										</c:if>
										<c:if test="${phyCouVO.course_status==1}">
											上架中
										</c:if>
										<c:if test="${phyCouVO.course_status==2}">
											已下架
										</c:if>
									</td>
									<td>${phyCouVO.create_date}</td>
									<td>${phyCouVO.update_time}</td>
									<td>${phyCouVO.sign_up_start_day}</td>
									<td>${phyCouVO.sign_up_end_day}</td>
									<td>${phyCouVO.max_sign_up_people}</td>
									<td>${phyCouVO.min_sign_up_people}</td>
									<td>${phyCouVO.current_sign_up_people}</td>
									<td><img src="<%=request.getContextPath()%>/course/DBGifReader?course_no=${phyCouVO.course_no}" width="100px"></td>
									<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/course/cou.do" style="margin-bottom: 0px;">
										<input type="submit" value="修改">
										<input type="hidden" name="course_no"  value="${phyCouVO.course_no}">
										<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
									</td>
									<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/course/cou.do" style="margin-bottom: 0px;">
										<input type="submit" value="上/下架">
										<input type="hidden" name="course_no"  value="${phyCouVO.course_no}">
										<input type="hidden" name="course_status"  value="${phyCouVO.course_status}">
										<input type="hidden" name="action" value="changeStatus"></FORM>
									</td>
								</tr>
							</c:forEach>
						</table>
</article>
</div>
</body>
</html>
