<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.promotion.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  PhyCouProVO phyCouProVO = (PhyCouProVO) request.getAttribute("phyCouProVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>Promotion ��� - listOnePro.jsp</title>

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
</style>

</head>
<body bgcolor='white'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>Promotion ��� - ListOnePro.jsp</h3>
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
	<tr>
		<td>${phyCouProVO.project_no}</td>
		<td>${phyCouProVO.project_name}</td>
		<td>${phyCouProVO.start_date}</td>
		<td>${phyCouProVO.end_date}</td>
		<td>${phyCouProVO.prom_description}</td>
		<td>${phyCouProVO.prom_status}</td> 
		<td>${phyCouProVO.update_time}</td>
	</tr>
</table>

</body>
</html>