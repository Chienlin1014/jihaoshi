<%@page import="javax.naming.Context"%>
<%@page import="com.course.model.PhyCouVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%

  PhyCouVO phyCouVO = (PhyCouVO) request.getAttribute("phyCouVO");
  
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>course 資料修改 - update_cou_input.jsp</title>

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

	width: 480px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
  #pageHead {
    width: 480px;
    height: 20%;
  }
</style>

</head>
<body bgcolor='white'>
<img src="<%= request.getContextPath()%>/images/JihaoshiPageHead.jpg" id="pageHead">

<table id="table-1">
	<tr><td>
		 <h3>課程資料修改</h3>
		 <h4><a href="select_page.jsp">>回課程管理首頁</a></h4>
	</td></tr>
</table>

<h3>課程修改:</h3>

<%-- 錯誤表列 --%>
<%-- <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if> --%>


<FORM METHOD="post" ACTION="cou.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>實體課程編號:<font color=red><b>*</b></font></td>
		<td>${param.course_no}</td>
	</tr>
	<tr>
		<td>實體課程名稱:</td>
		<td><input type="TEXT" name="course_name" size="45" 
		    value="${param.course_name}"/></td><td>${errorMsgs.name}</td>
	</tr>
	<tr>
		<td>上課時數:</td>
		<td><input type="TEXT" name="course_hr" size="45" 
		    value="${param.course_hr}"/></td><td>${errorMsgs.hr}</td>
	</tr>
	<tr>
		<td>課程費用:</td>
		<td><input type="text" name="course_price" size="45" 
		    value="${param.course_price}"/></td><td>${errorMsgs.price}</td>
	</tr>
	<tr>
		<td>授課教師:</td>
		<td><input type="TEXT" name="course_teacher" size="45" 
		value="${param.course_teacher}"/></td><td>${errorMsgs.teacher}</td>
	</tr>
	<tr>
		<td>開課時間:</td>
		<td><input type="TEXT" name="course_date" size="45" 
		value="${param.course_date}"/></td><td>${errorMsgs.coursedate}</td>
	</tr>
	<tr>
		<td>上課教室:</td>
		<td><input type="TEXT" name="course_location" size="45" 
		value="${param.course_location}"/></td><td>${errorMsgs.location}</td>
	</tr>
	<tr>
		<td>課程簡介:</td>
		<td><input type="TEXT" name="course_info" size="45" 
		value="${param.course_info}"/></td><td>${errorMsgs.info}</td>
	</tr>
		<tr>
		<td>狀態:</td>
		<td><input type="TEXT" name="course_status" size="45" 
		value="${param.course_status}"/></td><td>${errorMsgs.status}</td>
	</tr>
		<tr>
		<td>上架日期:</td>
		<td>${param.create_date}</td>
	</tr>
		<tr>
		<td>編輯時間:</td>
		<td>${param.update_time}</td>
	</tr>
		<tr>
		<td>報名開始日期:</td>
		<td><input type="TEXT" id="f_date1" name="sign_up_start_day" size="45" 
		value="${param.sign_up_start_day}"/></td><td>${errorMsgs.start}</td>
	</tr>
		<tr>
		<td>報名結束日期:</td>
		<td><input type="TEXT" name="sign_up_end_day" size="45" 
		value="${param.sign_up_end_day}"/></td><td>${errorMsgs.end}</td>
	</tr>
		<tr>
		<td>人數上限:</td>
		<td><input type="TEXT" name="max_sign_up_people" size="45" 
		value="${param.max_sign_up_people}"/></td><td>${errorMsgs.max}</td>
	</tr>
	<tr>
		<td>人數下限:</td>
		<td><input type="TEXT" name="min_sign_up_people" size="45" 
		value="${param.min_sign_up_people}"/></td><td>${errorMsgs.min}</td>
	</tr>
	<tr>
		<td>目前報名人數:</td>
		<td><input type="TEXT" name="current_sign_up_people" size="45" 
		value="${param.current_sign_up_people}"/></td><td>${errorMsgs.current}</td>
	</tr>
	<tr>
		<td>照片:</td>
		<td><img src="<%=request.getContextPath()%>/course/DBGifReader?course_no=${param.course_no}" width="340px"><br><input type="file" name="pic" size="45" ></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="course_no" value="${param.course_no}">
<input type="hidden" name="create_date" value="${param.create_date}">
<input type="hidden" name="update_time" value="${param.update_time}">
<input type="submit" value="送出修改">
</FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 60,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '${param.sign_up_start_day}', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>