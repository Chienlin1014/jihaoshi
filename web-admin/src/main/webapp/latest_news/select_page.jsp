<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>最新消息首頁: Home</title> 

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
   <tr><td><h3>最新消息首頁: Home</h3><h4>( Latest_news )</h4></td></tr>
</table>

<p>This is the Home page for Latest_news: Home</p>

<h3>資料查詢:</h3>
	
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
  <li><a href='<%= request.getContextPath() %>/latest_news/listAllLatest_news.jsp'>List</a> all Latest_news.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="/third/Latest_newsServlet" >
        <b>輸入消息編號 (如:1):</b>
        <input type="text" name="news_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="latest_newsSvc" scope="page" class="com.latest_news.model.Latest_newsService" />
   
  <li>
     <FORM METHOD="post" ACTION="/third/Latest_newsServlet" >
       <b>選擇消息編號:</b>
       <select size="1" name="news_no">
         <c:forEach var="latest_newsVO" items="${latest_newsSvc.all}" > 
          <option value="${latest_newsVO.news_no}">${latest_newsVO.news_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="/third/Latest_newsServlet" >
       <b>選擇消息內文:</b>
       <select size="1" name="news_no">
         <c:forEach var="latest_newsVO" items="${latest_newsSvc.all}" > 
          <option value="${latest_newsVO.news_no}">${latest_newsVO.news_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>最新消息管理</h3>

<ul>
  <li><a href='InsertLatest_news.jsp'>Add</a> a new Latest_news.</li>
</ul>

</body>
</html>