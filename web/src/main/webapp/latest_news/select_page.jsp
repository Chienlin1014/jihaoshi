<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.latest_news.model.*"%>

<html>
<head>

<title>Jihaoshi</title>
<title>最新消息首頁: Home</title> 

    <style>
        a {
            font-size: 20px;
        }
        div.divflex{
        display:flex;
        width:100%;
        margin:0;
        height:100vh-30%;
        }
        body{
        height: 100vh;
        background-color:#FFFAF0;
        }
        div.formdiv{
        style="width:80%%;
        background: #FFFAF0;
        }
    </style>

</head>



<body>
<%@ include file="../navbar.file" %>

<div class="block_N" style="margin:0px auto;"></div>
<div id="WRAPPER" class="ecsite-layout style_shopping ecsite-search"></div>
  <div id="CONTENT" class="layout-wrapper"></div>
    <div class="layout-center" style="text-align:center"></div>
   
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
  
<!--   <li> -->
<!--     <FORM METHOD="post" ACTION="/web-admin/Latest_newsServlet" > -->
<!--         <b>輸入消息編號 (如:1):</b> -->
<!--         <input type="text" name="news_no"> -->
<!--         <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--         <input type="submit" value="送出"> -->
<!--     </FORM> -->
<!--   </li> -->

  <jsp:useBean id="latest_newsSvc" scope="page" class="com.latest_news.model.Latest_newsService" />
   
  <li>
     <FORM METHOD="post" ACTION="/web/Latest_newsServlet" >
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
     <FORM METHOD="post" ACTION="/web/Latest_newsServlet" >
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




</body>
</html>