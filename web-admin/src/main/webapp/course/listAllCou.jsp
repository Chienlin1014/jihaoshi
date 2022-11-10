<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.course.model.*"%>
<<<<<<< HEAD
=======
<%-- 此頁練習採用 EL 的寫法取值 --%>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024

<%
    PhyCouService phyCouSvc = new PhyCouService();
    List<PhyCouVO> list = phyCouSvc.getAll();
    pageContext.setAttribute("list",list);
    
%>


<html>
<head>
<<<<<<< HEAD
<title>所有課程資料</title>
=======
<title>所有course資料 - listAllCou.jsp</title>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
<<<<<<< HEAD

=======
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
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
<<<<<<< HEAD
	width: 2000px;
=======
	width: 800px;
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
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
<<<<<<< HEAD
  #info {
    width:450px;
  }
  #pageHead {
    width: 2000px;
    height: 28%;
  }
=======
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
</style>

</head>
<body bgcolor='white'>
<<<<<<< HEAD
<img src="<%= request.getContextPath()%>/images/JihaoshiPageHead.jpg" id="pageHead">

<table id="table-1">
	<tr><td>
		 <h3>所有課程資料 <a href="select_page.jsp"> ~回首頁</a></h3> 
=======

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有course資料 - listAllCou.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
	</td></tr>
</table>

<table>
	<tr>
<<<<<<< HEAD
		<th>實體課程編號</th>
		<th>實體課程名稱</th>
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
		<th>目前報名人數</th>
		<th>照片</th>	
=======
		<th>course_no</th>
		<th>course_name</th>
		<th>course_hr</th>
		<th>course_price</th>
		<th>course_teacher</th>
		<th>course_date</th>
		<th>course_location</th>
		<th>course_info</th>
		<th>course_status</th>
		<th>create_date</th>
		<th>update_time</th>
		<th>sign_up_start_day</th>
		<th>sign_up_end_day</th>
		<th>max_sign_up_people</th>
		<th>min_sign_up_people</th>
		<th>current_sign_up_people</th>
		<th>pic</th>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
		
	</tr>
	<%-- <%@ include file="page1.file" %>  --%> 
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
			<td>${phyCouVO.course_status}</td>
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
			     <input type="submit" value="刪除">
			     <input type="hidden" name="course_no"  value="${phyCouVO.course_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%-- <%@ include file="page2.file" %> --%>

</body>
</html>