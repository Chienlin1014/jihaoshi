<%@page import="com.course.model.PhyCouVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>JiHaoJa Physical Course : Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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
<<<<<<< HEAD
  #pageHead {
    width: 450px;
    height: 19%;
  }
=======
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
</style>

</head>
<body bgcolor='white'>
<<<<<<< HEAD
<img src="<%= request.getContextPath()%>/images/JihaoshiPageHead.jpg" id="pageHead">

<table id="table-1">
   <tr><td><h3>JiHaoJa 實體課程</h3></td></tr>
</table>

=======

<table id="table-1">
   <tr><td><h3>JiHaoJa Physical Course : Home</h3></td></tr>
</table>

<p>This is the Home page for JiHaoJa Physical Course: Home</p>

>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
<h3>課程資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
<<<<<<< HEAD
  <li><a href='listAllCou.jsp'>列出</a> 所有實體課程  <br><br></li>
=======
  <li><a href='listAllCou.jsp'>List</a> all Courses.  <br><br></li>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
  
  
  <li>
    <FORM METHOD="post" ACTION="cou.do" >
<<<<<<< HEAD
        <b>輸入實體課程編號(如3):</b>
=======
        <b>輸入 course_no (如3):</b>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
        <input type="text" name="course_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="phyCouSvc" scope="page" class="com.course.model.PhyCouService" />
   
  <li>
     <FORM METHOD="post" ACTION="cou.do" >
<<<<<<< HEAD
       <b>選擇實體課程編號:</b>
=======
       <b>選擇 course_no:</b>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
       <select size="1" name="course_no">
         <c:forEach var="phyCouVO" items="${phyCouSvc.all}" > 
          <option value="${phyCouVO.course_no}">${phyCouVO.course_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="cou.do" >
<<<<<<< HEAD
       <b>選擇實體課程名稱:</b>
=======
       <b>選擇 course_name:</b>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
       <select size="1" name="course_no">
         <c:forEach var="phyCouVO" items="${phyCouSvc.all}" > 
          <option value="${phyCouVO.course_no}">${phyCouVO.course_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>

<%-- 萬用複合查詢-以下欄位-可隨意增減 --%>
<<<<<<< HEAD
<%-- <ul>  
=======
<ul>  
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
  <li>   
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/course/cou.do" name="form1">
        <b><font color=blue>萬用複合查詢:</font></b> <br>
        <b>input course no:</b>
        <input type="text" name="course_no" value="1"><br>
           
       <b>input course name:</b>
       <input type="text" name="course_name" value="三杯雞"><br>
       
       <b>input course location:</b>
	   <input name="course_location"  value="A001" type="text">
		        
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="listCous_ByCompositeQuery">
     </FORM>
  </li>
<<<<<<< HEAD
</ul> --%>
=======
</ul>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024

<h3>課程管理</h3>

<ul>
<<<<<<< HEAD
  <li><a href='addCou.jsp'>新增</a>  一個實體課程</li>
=======
  <li><a href='addCou.jsp'>Add</a> a new Course.</li>
>>>>>>> 19583f5f10b33792ca0852b8b32e65436605f024
</ul>

</body>
</html>