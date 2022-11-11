<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料新增 - addEmp.jsp</title>

<style>
  table#table-1 {
    width: 450px;
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


<!-- 日期輸入輔助 -->
<script src="<%=request.getContextPath()%>/cal/js/jscal2.js"></script>
<script src="<%=request.getContextPath()%>/cal/js/lang/cn.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/cal/css/jscal2.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/cal/css/border-radius.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/cal/css/steel/steel.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/error.css" />

</head>
<body bgcolor='white'>
<h4>${msg}</h4> <!-- 見GlobalExceptionHandler.java(第39行) -->
<table id="table-1">
	<tr><td>
		 <h3>員工資料新增 - addEmp.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/select_page"><img src="<%=request.getContextPath()%>/images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

	<h3>
		員工資料:<font color=red><b>*</b></font>為必填欄位
	</h3>

	<form:form action="insert" method="POST" modelAttribute="empVO">
		<form:errors path="*" cssClass="errorblock" element="div" /> <!-- 見 EmpController.java(第44-46行) -->
		<table>

			<tr>
				<td>員工姓名:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="ename" id="ename"	size="45"/></td>
				<td><form:errors path="ename" cssClass="error"/></td>
			</tr>
			<tr>
				<td>職位:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="job" id="job" size="45"/></td>
				<td><form:errors path="job" cssClass="error" /></td>
			</tr>
			<tr>
				<td>雇用日期:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="hiredate" id="f_date1" size="40" readonly="true" /> 
				     <img align="top" src="<%=request.getContextPath()%>/cal/images/btn_date_up.gif" id="f_btn1" width="25" height="20"/></td>
				<td><form:errors path="hiredate" cssClass="error"/></td>
			</tr>
			<tr>
				<td>薪水:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="sal" id="sal" size="45"/></td>
				<td><form:errors path="sal" cssClass="error" /></td>
			</tr>
			<tr>
				<td>獎金:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="comm" id="comm" size="45"/></td>
				<td><form:errors path="comm" cssClass="error"/></td>
			</tr>

			<tr>
				<td>部門:<font color=red><b>*</b></font></td>
				<td><form:select path="deptVO.deptno" id="deptVO.deptno" items="${listData}" itemValue="deptno" itemLabel="dname" /></td>
			</tr>

		</table><br>
		
		<input type="submit" value="送出新增">
	</form:form>


	<!-- 日期輸入輔助 -->
	<script type="text/javascript">
		var cal = Calendar.setup({
			onSelect: function(cal) { cal.hide() },         
	        selectionType : Calendar.SEL_MULTIPLE,
	        weekNumbers  : true,
	        selection    : Calendar.dateToInt(new Date()), 

			// ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

			//           1.以下為當天之前的日期無法選擇 (也可按需要換成其他日期)
			//           disabled : function(date) {
			//                 var somedate1 = new Date();
			//                 return   (date.getYear() <  somedate1.getYear() || 
			//                          (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
			//                          (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate()));               
			//           },

			//           2.以下為當天之後的日期無法選擇 (也可按需要換成其他日期)
			//           disabled : function(date) {
			//                 var somedate2 = new Date();
			//                 return   (date.getYear() >  somedate2.getYear() || 
			//                          (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
			//                          (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate()));               
			//           },

			//           3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
			//           disabled : function(date) {
			//                 var somedate1 = new Date("2016-04-05");
			//                 var somedate2 = new Date("2016-04-15");
			//                 return   (
			//                           (date.getYear() < somedate1.getYear() || (date.getYear() == somedate1.getYear() && date.getMonth() < somedate1.getMonth()) || (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate()))
			//                            ||
			//                           (date.getYear() > somedate2.getYear() || (date.getYear() == somedate2.getYear() && date.getMonth() > somedate2.getMonth()) || (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate()))
			//                          );               
			//           },

			showTime : true
		});

		cal.manageFields("f_btn1", "f_date1", "%Y-%m-%d");
		//cal.manageFields("f_btn1", "f_date1", "%Y-%m-%d %H:%M:%S"); //含時間戳記
	</script>

</body>
</html>
