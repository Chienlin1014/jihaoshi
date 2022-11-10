<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="com.course.model.*"%>
<<<<<<< HEAD


<%
  PhyCouVO phyCouVO = (PhyCouVO) request.getAttribute("phyCouVO"); 
%>

<html>
<head>
<title>課程資料</title>
=======
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  PhyCouVO phyCouVO = (PhyCouVO) request.getAttribute("phyCouVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
--<%= phyCouVO==null %>--${phyCouVO.course_no}--

<html>
<head>
<title>Course 資料 - listOneCou.jsp</title>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024

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
<<<<<<< HEAD
	width: 1700px;
=======
	width: 600px;
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
    width:400px;
  }
  #pageHead {
    width: 1700px;
    height: 23%;
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
		 <h3>課程資料</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
=======

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>course 資料 - ListOneCou.jsp</h3>
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
	<tr>
		<td><%=phyCouVO.getCourse_no()%></td>
		<td><%=phyCouVO.getCourse_name()%></td>
		<td><%=phyCouVO.getCourse_hr()%></td>
		<td><%=phyCouVO.getCourse_price()%></td>
		<td><%=phyCouVO.getCourse_teacher()%></td>
		<td><%=phyCouVO.getCourse_date()%></td>
		<td><%=phyCouVO.getCourse_location()%></td>
		<td><%=phyCouVO.getCourse_info()%></td>
		<td><%=phyCouVO.getCourse_status()%></td>
		<td><%=phyCouVO.getCreate_date()%></td>
		<td><%=phyCouVO.getUpdate_time()%></td>
		<td><%=phyCouVO.getSign_up_start_day()%></td>
		<td><%=phyCouVO.getSign_up_end_day()%></td>
		<td><%=phyCouVO.getMax_sign_up_people()%></td>
		<td><%=phyCouVO.getMin_sign_up_people()%></td>
		<td><%=phyCouVO.getCurrent_sign_up_people()%></td>
<<<<<<< HEAD
		<td><img src="<%=request.getContextPath()%>/course/DBGifReader?course_no=<%=phyCouVO.getCourse_no()%>" width="150px"></td>
=======
		<td><img src="http://localhost:8081/myproject/course/DBGifReader?course_no=<%=phyCouVO.getCourse_no()%>"></td>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
		  
</table>

</body>
</html>