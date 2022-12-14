<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="com.course.model.*"%>

<%
  PhyCouVO phyCouVO = (PhyCouVO) request.getAttribute("phyCouVO");
  HttpSession pCousession = request.getSession();
  pCousession.setAttribute("phyCouVO", phyCouVO);  
  /* pCousession.setAttribute("member_no", 1);  */

%>

<html>
<head>

<title>報名確認</title>

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

  #pageHead {
    width: 600px;
    height: 24%;
  }

</style>

</head>
<body bgcolor='white'>
<img src="<%= request.getContextPath()%>/images/JihaoshiPageHead.jpg" id="pageHead">
<table id="table-1">
	<tr><td>
		 <h2>請確認報名資訊</h2>
		 <h3> <a href="<%=request.getContextPath()%>/course/ListAllCourse.jsp">回課程瀏覽</a></h3>
	</td></tr>
</table>

<table>
	    <tr><th>課程編號</th><td><%=phyCouVO.getCourse_no()%></td></tr>
		<tr><th>課程名稱</th><td><%=phyCouVO.getCourse_name()%></td></tr>
		<tr><th>課程時數</th><td><%=phyCouVO.getCourse_hr()%></td></tr>
		<tr><th>促銷價格</th><td><%=phyCouVO.getCourse_price()%></td></tr>
		<tr><th>援課老師</th><td><%=phyCouVO.getCourse_teacher()%></td></tr>
		<tr><th>上課日期</th><td><%=phyCouVO.getCourse_date()%></td></tr>
		<tr><th>上課教室</th><td><%=phyCouVO.getCourse_location()%></td></tr>
		<tr><td>		
			   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pCouCheckout/PCoucheckoutController" style="margin-bottom: 0px;">
			     <input type="submit" value="確認報名">
			     <input type="hidden" name="course_no"  value=<%=phyCouVO.getCourse_no() %>>
			     <input type="hidden" name="dPrice"  value=<%=phyCouVO.getCourse_price()%>>
			     <input type="hidden" name="action"	value="checkout"></FORM>
			</td></tr>
</table>

</body>
</html>