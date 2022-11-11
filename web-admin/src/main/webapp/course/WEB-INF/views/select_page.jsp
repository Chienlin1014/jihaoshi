<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head><title>IBM Emp: Home</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/error.css" />
<style>
  table#table-1 {
	width: 520px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: blue;
    display: block;
    margin-bottom: 1px;
  }
</style>

</head>
<body bgcolor='white'>
	<table id="table-1">
		<tr><td><h3>IBM Emp: Home</h3>	<h4>( Spring5MVC-Spring5ORM-Hibernate5 MVC )</h4></td></tr></table>

    <p>This is the Home page for IBM Emp: Home</p>

    <h3>資料查詢:</h3>
    <%-- 錯誤表列 --%>
    <div class="errorblock">${errorMessage}</div> <!-- 見 GlobalExceptionHandler.java(第73行) 或  EmpnoController(第44行) -->
    <ul>
      <li><a href='<%=request.getContextPath()%>/emp/listAllEmp'>List</a> all Emps.  <br><br></li>
  
      <li>
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/getOne_For_Display" >
           <b>輸入員工編號 (如7001):</b>
             <input type="text" name="empno">
             <input type="submit" value="送出">
             <input type="hidden" name="requestURL" value="select_page"> <!-- 見 GlobalExceptionHandler.java(第71-73行) -->
         </FORM>
      </li>

      <jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />
   
      <li>
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/getOne_For_Display" >
           <b>選擇員工編號:</b>
           <select size="1" name="empno">
             <c:forEach var="empVO" items="${empSvc.all}" > 
               <option value="${empVO.empno}">${empVO.empno}
             </c:forEach>   
           </select>
           <input type="submit" value="送出">
           <input type="hidden" name="requestURL" value="select_page"> <!-- 見 GlobalExceptionHandler.java(第71-73行) -->
        </FORM>
      </li>
  
      <li>
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/getOne_For_Display" >
           <b>選擇員工姓名:</b>
           <select size="1" name="empno">
             <c:forEach var="empVO" items="${empSvc.all}" > 
               <option value="${empVO.empno}">${empVO.ename}
             </c:forEach>   
           </select>
           <input type="submit" value="送出">
           <input type="hidden" name="requestURL" value="select_page"> <!-- 見GlobalExceptionHandler.java(第71-73行) -->
         </FORM>
      </li>
      
      <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
      
      <li>
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/listEmps_ByDeptno" >
           <b><font color=orange>選擇部門:</font></b>
           <select size="1" name="deptno">
             <c:forEach var="deptVO" items="${deptSvc.all}" > 
               <option value="${deptVO.deptno}">${deptVO.dname}
             </c:forEach>   
           </select>
           <input type="submit" value="送出">
           <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
         </FORM>
      </li>
    </ul>


    <h3>員工管理</h3>
    <ul>
        <li><a href='<%=request.getContextPath()%>/emp/addEmp'>Add</a> a new Emp.</li>
    </ul>

	
	<h3><font color=orange>部門管理</font></h3>
    <ul>
        <li><a href='<%=request.getContextPath()%>/dept/listAllDept'>List</a> all Depts. </li>
    </ul>
    
    
    <h3><font color=red>Spring MVC 上傳測試</font></h3>
    <ul>
        <li><a href='<%=request.getContextPath()%>/upload/upload_Test'>Upload</a> Upload Test. </li>
    </ul>


</body>

</html>
