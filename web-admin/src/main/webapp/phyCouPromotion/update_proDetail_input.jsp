<%@page import="com.phyCouPromotion.model.PhyCouPromotionVO"%>
<%@page import="com.phyCouPromotionDetail.model.PhyCouPromotionDetailVO"%>
<%@page import="java.util.Set"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.course.model.PhyCouVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%

  PhyCouPromotionVO phyCouPromotionVO = (PhyCouPromotionVO) request.getAttribute("phyCouPromotionVO");
  Set<PhyCouPromotionDetailVO> set = (Set) request.getAttribute("set");
  System.out.println("=======================================================");
  System.out.println(phyCouPromotionVO);
  System.out.println(set);
  System.out.println("=======================================================");
  if ( set != null ) {
	  StringBuilder sb = new StringBuilder();
	  Integer prom_price = null;
	
	  int i = set.size();
	  for ( PhyCouPromotionDetailVO cos : set) {
		  if ( i-- != 1) {
		      sb.append(String.valueOf(cos.getPhyCouVO().getCourse_no())+",");
		  } else {
		      sb.append(String.valueOf(cos.getPhyCouVO().getCourse_no()));
		      prom_price = cos.getProm_price();
			 
		  }
	  } 
	  String proCous = sb.toString();
	  pageContext.setAttribute("proCous",proCous);
	  pageContext.setAttribute("prom_price",prom_price);
	  
  } else {
 	  String proCous = (String) request.getAttribute("tep_proCous");
 	  Integer prom_price = (Integer) request.getAttribute("prom_price");
	  java.sql.Date update_time = (java.sql.Date) request.getAttribute("update_time");
	  pageContext.setAttribute("proCous",proCous);
	  pageContext.setAttribute("prom_price",prom_price);
	  pageContext.setAttribute("update_time",update_time);
 	  System.out.println(proCous);
      
  }
  
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>實體課程促銷資料修改 - update_cou_input.jsp</title>

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
		 <h3>實體課程促銷資料修改</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>實體課程促銷資料修改:</h3>

<%-- 錯誤表列 --%>
<%-- <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if> --%>


<FORM METHOD="post" ACTION="promotion" name="form1">
<table>
	<tr>
		<td>促銷專案編號:<font color=red><b>*</b></font></td>
		<td>${param.project_no}</td>
	</tr>
	<tr>
		<td>促銷專案名稱:</td>
		<td><input type="TEXT" name="project_name" size="45" 
		    value="${param.project_name}"/></td><td>${errorMsgs.project_name}</td>
	</tr>
	<tr>
		<td>開始日期:</td>
		<td><input type="TEXT" name="start_date" size="45" 
		    value="${param.start_date}"/></td><td>${errorMsgs.start_date}</td>
	</tr>
	<tr>
		<td>結束日期:</td>
		<td><input type="text" name="end_date" size="45" 
		    value="${param.end_date}"/></td><td>${errorMsgs.end_date}</td>
	</tr>
	<tr>
		<td>促銷活動敘述:</td>
		<td><input type="TEXT" name="prom_description" size="45" 
		value="${param.prom_description}"/></td><td>${errorMsgs.prom_description}</td>
	</tr>
	<tr>
		<td>專案狀態碼:</td>
		<td><input type="TEXT" name="prom_status" size="45" 
		value="${param.prom_status}"/></td><td>${errorMsgs.prom_status}</td>
	</tr>
	<tr>
		<td>編輯時間:</td>
		<td>${param.update_time}</td>
	</tr>
	<tr>
		<td>促銷課程代碼:</td>
		<td><input type="TEXT" name="proCous" size="45" 
		value="${proCous}"/></td><td>${errorMsgs.proCous}</td>
	</tr>
	<tr>
		<td>促銷折扣:</td>
		<td><input type="TEXT" name="prom_price" size="45" 
		value="${prom_price}"/></td><td>${errorMsgs.prom_price}</td>
	</tr>
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="project_no" value="${param.project_no}">
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