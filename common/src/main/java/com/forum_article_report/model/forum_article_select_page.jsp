<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.forum_article.model.*"%>


<%
	Forum_articleService forum_articleSvc = new Forum_articleService();
    List<Forum_articleVO> list = forum_articleSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>論壇文章首頁: Home</title>


  <style>
	
		
        .evenarticle {
            background-color: white;
            width: 75%;
            height: 40px;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            display: flex;
            align-items: center;
            padding: 0 10px;
        }

        .title {
            width: 75%;
            height: 30px;
            background-color: #33b5e5;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            display: flex;
            align-items: center;
            padding: 0 10px;
        }

        .ptime {
            width: 80px;
            font-size: 10px;
            color: rgb(105, 105, 105);
            text-align: center;
        }

        .author {
            width: 80px;
            text-align: center;
        }

        .atitle {
            width: 620px;
            text-align: center;
/*             font-weight: 700; */
        }
        
        .atitle_but {
        	font-weight: 700;
        }

        
        .btn-outline-dark, .btn-outline-success {
            position: relative;
            left: 777px;
            bottom: 10px;
        }
        
        .atitle_but{
        	background: none;
        	outline: none;
        	border: none;
        }
        
        .titlesty{
        	color: white;
        	font-weight: 700;
        	font-size: 16px;
        }
        
        #logo {
			width: 100px;
			height: 40px;
		}
		
		.evenarticle:nth-child(even) {
			background-color: rgb(240, 240, 240);
		}
		
		.evenarticle:hover {
			background-color: rgb(255, 252, 224);
		}
		
		.form {
			display: flex;
			
		}
		
		form{
			width: 600px;
			display: inline;
			text-align: center
		}
		
</style>


</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>論壇文章首頁: Home</h3><h4>( Forum_article )</h4></td></tr>
</table>



<p>This is the Home page for Forum_article: Home</p>
<div class="container">
 <div class="title"> 
            
            <div class="author titlesty">會員編號</div>
            <div class="ptime titlesty">發文時間</div>
            <div class="atitle titlesty">文章標題</div>
        </div>
<!--         參考 -->
 
	<c:forEach var="forum_articleVO" items="${list}">
		<div class="evenarticle">
<%--             <div class="atitle">${forum_articleVO.article_name}</div> --%>
            <div class="author">${forum_articleVO.member_no}</div>
            <div class="ptime">${forum_articleVO.article_time}</div>
			
			 <form method="post" action="/web/Forum_articleServlet"> 
           			<input type="hidden" name="article_no" value="${forum_articleVO.article_no}">
					<input type="hidden" name="action" value="getOne_For_Display">
					<input class="atitle_but" type="submit" value="${forum_articleVO.article_name}">
			</form>       
        </div>
	</c:forEach>
</div>
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
  <li><a href='<%= request.getContextPath() %>/forum_article/listAllForum_article.jsp'>List</a> all Forum_article.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="/web-admin/Forum_articleServlet" >
        <b>輸入論壇文章編號 (如:1):</b>
        <input type="text" name="article_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

<%--   <jsp:useBean id="forum_articleSvc" scope="page" class="com.forum_article.model.Forum_articleService" /> --%>
   
  
  <li>
     <FORM METHOD="post" ACTION="/web/Forum_articleServlet" >
       <b>選擇文章標題:</b>
       <select size="1" name="article_no">
         <c:forEach var="forum_articleVO" items="${forum_articleSvc.all}" > 
          <option value="${forum_articleVO.article_no}">${forum_articleVO.article_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>論壇文章管理</h3>

<ul>
  <li><a href='<%= request.getContextPath() %>/forum_article/InsertForum_article.jsp'>Add</a> a new Forum_article.</li>
</ul>

</body>
</html>