<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.online_course.model.*"%>
<%
	OnlineCourseJDBCDAO course = new OnlineCourseJDBCDAO();
	List<OnlineCourseVO> list = course.getAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>線上課程瀏覽專區</title>

 <link type="text/css" href="<%=request.getContextPath()%>/css/jihaoshi.css" rel="stylesheet">
    <style>
        #pageHead { 
            width: 100%;
            height: 30%; 
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
    

<style>
.table {
	display: flex;
	width: 100%;
	justify-content: space-around;
	flex-wrap: wrap;
/* 	border: 1px solid black; */
	border-radius: 10px;
	background: #fffcec;
}

.block {
	margin: 2% auto;
 	border: 2px black solid; 
	width: 30%;
	height: auto%;
	text-align: center;
	border-radius: 10px;
	background: #fffcec;
	/*   line-height: 100px; */
}

.block:hover {
	background: #FFFAF0;
	transition: 1s;
	position: relative;
	left: 5px;
	bottom: 5px;
}

.photo {

	width: 100%;
	height: 225px;
	border-radius: 10px;
	line-height: 150px;
}

.content {
 
	width: 100%;
	height: auto;
	border-radius: 10px;
	line-height: 30px;
}

.table > h1 {
width: 100%;
	text-align: center;

}

img {
	width: 100%;
}

#search{
width: 30%;
height: 25px;

}

#find{
width: 30%;
height: 25px;

}
</style>
 

 
</head>
<body bgcolor='white'>
<img src="../images/JihaoshiPageHead.jpg" id="pageHead">


<div id="WRAPPER" class="">
    <div class="divflex">
        <div class="" style="text-align:center;background-color:#FFFAF0;widtH:13%; height:100vw; background-color:#F3E3C3;">
            <!--側邊欄區塊開始-->
                    <ul class="treeview">
                        <li id="cate_D" class="expanded"><H1>功能列表</H1>
                            <ul class="main">
                                <li>
                                    <a href="<%=request.getContextPath()%>/meal/MealInsert.jsp">新增菜單</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/index.jsp">回首頁</a>
                                </li>
                            </ul>
                      </li>
                 </ul>
          </div>   
            <!--側邊欄區塊結束-->
    <div style="display:flex;flex-direction:column;width:100%">
	<h1 style="align-self:center;margin: 2rem 0">線上課程瀏覽專區</h1>
	<input id='find' type='text'><br>
	<button id='search'>搜尋關鍵字</button>
	<div class="table" id="cardWrapper">
		
	</div>
	</div>
	<script>
	document.querySelector('#search').addEventListener('click', searchByName);
    const find = document.querySelector('#find');
	searchByName();
	  function searchByName(){
		      const cardWrapper = document.querySelector('#cardWrapper');
                const id = sessionStorage.getItem('courseNo');
				const findText = find.value;
              
				if (findText) {
					fetch('http://localhost:8081/web-admin/onlineCourse/search',{ 
					method:'post',
					headers:{
						'content-type':'application/json'
					},
					body:JSON.stringify({
						courseName:findText,
						flag:'queryPic'
					})
				}
					)
                    .then(resp => resp.json())
                    .then(xxx);				
				}else{
					 fetch('../onlineCourse/searchAll')
                    .then(resp => resp.json())
                    .then(xxx);

				}
									
					function xxx(list){
						cardWrapper.innerHTML='';
						for(onlineCourse of list){
                            cardWrapper.insertAdjacentHTML('beforeend', `
						<div class="block" onclick="showDetail(\${onlineCourse.courseNo})">
							<div class="photo">
								<img style="border-radius:10px" src="data:image/png;base64, \${onlineCourse.onlineCoursePhotoBaseStr64}">
							</div>
							<div class="content">
								<div style="text-align:left;margin-left:10px">課程編號 : \${onlineCourse.courseNo}</div>
								<div style="text-align:left;margin-left:10px">課程名稱 : \${onlineCourse.courseName}</div>
								<div style="text-align:right;margin-right:20px">課程價格 : $\${onlineCourse.coursePrice}</div>
                              
							</div>
						</div>
					`)}

					}
	  }
			// coursePhoto

			function showDetail(courseNo) {
				sessionStorage.setItem('courseNo', courseNo);
				location = 'OnlineCourseDetail.html';
			}
	</script>
</body>
</html>