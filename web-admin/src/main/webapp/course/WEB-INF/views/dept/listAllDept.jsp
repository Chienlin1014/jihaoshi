<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>

<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />

<html>
<head><title>�Ҧ����� - listAllDept.jsp</title>

<style>
  table#table-1 {
	background-color: orange;
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
<body>


<table id="table-1">
	<tr><td>
		 <h3>�Ҧ����� - ListAllDept.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/select_page"><img src="<%=request.getContextPath()%>/images/back1.gif" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�����s��</th>
		<th>�����W��</th>
		<th>������a</th>
		<th>�ק�</th>
		<th>�R��<font color=red>(���p���ջP���-�p��)</font></th>
		<th>�d�߳������u</th>
	</tr>
	
	<c:forEach var="deptVO" items="${deptSvc.all}">
		<tr>
			<td>${deptVO.deptno}</td>
			<td>${deptVO.dname}</td>
			<td>${deptVO.loc}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/getOne_For_Update_Dept" style="margin-bottom: 0px;">
			    <input type="submit" value="�ק�" disabled="disabled"> 
			    <input type="hidden" name="deptno" value="${deptVO.deptno}"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/delete_Dept" style="margin-bottom: 0px;">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="deptno" value="${deptVO.deptno}"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/listEmps_ByDeptno" style="margin-bottom: 0px;">
			    <input type="submit" value="�e�X�d��"> 
			    <input type="hidden" name="deptno" value="${deptVO.deptno}">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<%if (request.getAttribute("listEmps_ByDeptno")!=null){%>
       <jsp:include page="listEmps_ByDeptno.jsp" />
<%} %>

</body>
</html>
