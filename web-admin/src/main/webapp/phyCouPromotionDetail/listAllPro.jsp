<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promotion.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    PhyCouProService phyCouProSvc = new PhyCouProService();
    List<PhyCouProVO> list = phyCouProSvc.getAll();
    pageContext.setAttribute("list",list);
    
%>


<html>
<head>
<title>�Ҧ�promotion��� - listAllPro.jsp</title>

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
	width: 800px;
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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ�promotion��� - listAllPro.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>project_no</th>
		<th>project_name</th>
		<th>start_date</th>
		<th>end_date</th>
		<th>prom_description</th>
		<th>prom_status</th>
		<th>update_time</th>

		
	</tr>
	<%-- <%@ include file="page1.file" %>  --%> 
	<c:forEach var="phyCouProVO" items="${list}"> 
		
		<tr>
			<td>${phyCouProVO.project_no}</td>
			<td>${phyCouProVO.project_name}</td>
			<td>${phyCouProVO.start_date}</td>
			<td>${phyCouProVO.end_date}</td>
			<td>${phyCouProVO.prom_description}</td>
			<td>${phyCouProVO.prom_status}</td> 
			<td>${phyCouProVO.update_time}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/promotion/pro.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="project_no"  value="${phyCouProVO.project_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/promotion/pro.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="project_no"  value="${phyCouProVO.project_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%-- <%@ include file="page2.file" %> --%>

</body>
</html>