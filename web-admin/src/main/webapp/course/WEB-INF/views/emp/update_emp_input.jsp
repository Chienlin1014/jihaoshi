<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料修改 - update_emp_input.jsp</title>

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

<table id="table-1">
	<tr><td>
		 <h3>員工資料修改 - update_emp_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/select_page"><img src="<%=request.getContextPath()%>/images/back1.gif" border="0">回首頁</a></h4>
	</td></tr>
</table>

    <h3>資料修改:</h3>


	<form:form action="update" method="POST" modelAttribute="empVO">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<table>
            <tr>
		        <td>員工編號:<font color=red><b>*</b></font></td>
		        <td><form:input type="text" path="empno" id="empno"	size="45" value="${empVO.empno}" cssStyle="border:0px ; font-weight: bold;"/></td>
	        </tr>
			<tr>
				<td>員工姓名:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="ename" id="ename"	size="45" value="${empVO.ename}"/></td>
				<td><form:errors path="ename" cssClass="error"/></td>
			</tr>
			<tr>
				<td>職位:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="job" id="job" size="45" value="${empVO.job}"/></td>
				<td><form:errors path="job" cssClass="error" /></td>
			</tr>
			<tr>
				<td>雇用日期:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="hiredate" id="f_date1" size="40" readonly="true" value="${empVO.hiredate}"/> 
				     <img align="top" src="<%=request.getContextPath()%>/cal/images/btn_date_up.gif" id="f_btn1" width="25" height="20"/></td>
				<td><form:errors path="hiredate" cssClass="error"/></td>
			</tr>
			<tr>
				<td>薪水:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="sal" id="sal" size="45" value="${empVO.sal}"/></td>
				<td><form:errors path="sal" cssClass="error" /></td>
			</tr>
			<tr>
				<td>獎金:<font color=red><b>*</b></font></td>
				<td><form:input type="text" path="comm" id="comm" size="45" value="${empVO.comm}"/></td>
				<td><form:errors path="comm" cssClass="error"/></td>
			</tr>

			<tr>
				<td>部門:<font color=red><b>*</b></font></td>
				<td><form:select path="deptVO.deptno" id="deptVO.deptno" items="${listData}" itemValue="deptno" itemLabel="dname" /></td>
			</tr>

		</table><br>
		<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
        <input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">  <!--只用於:istAllEmp.jsp-->
		<input type="submit" value="送出修改">
	</form:form>

    <br>送出修改的來源網頁路徑:<br><b>
    <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
    <font color=blue>request.getParameter("whichPage"): </font> <%= request.getParameter("whichPage")%> (此範例目前只用於:istAllEmp.jsp))</b>

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
