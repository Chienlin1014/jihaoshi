<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>JiHaoJa  Promotion of Physical Course: Home</title>

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
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>JiHaoJa Promotion of Physical Course : Home</h3></td></tr>
</table>

<p>This is the Home page for JiHaoJa Promotion Physical Course: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllPro.jsp'>List</a> all Promotion  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="pro.do" >
        <b>��J promotion_no (�p3):</b>
        <input type="text" name="project_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="phyCouProSvc" scope="page" class="com.promotion.model.PhyCouProService" />
   
  <li>
     <FORM METHOD="post" ACTION="pro.do" >
       <b>��� promotion_no:</b>
       <select size="1" name="project_no">
         <c:forEach var="phyCouProVO" items="${phyCouProSvc.all}" > 
          <option value="${phyCouProVO.project_no}">${phyCouProVO.project_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="pro.do" >
       <b>��� promotion_name:</b>
       <select size="1" name="project_no">
         <c:forEach var="phyCouProVO" items="${phyCouProSvc.all}" > 
          <option value="${phyCouProVO.project_no}">${phyCouProVO.project_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�P�P�޲z</h3>

<ul>
  <li><a href='addPro.jsp'>Add</a> a new Course.</li>
</ul>


</body>
</html>