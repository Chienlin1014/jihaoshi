
<%--<%@ page import="com.cart.model.CartProdVO"%>--%>
<%--<%@ page import="java.util.List"%>--%>
<%--<%@ page contentType="text/html;charset=UTF-8"%>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>

<%--<html>--%>
<%--<head>--%>
<%--<title>Jihaoshi</title>--%>
<%--<link type="text/css"--%>
<%--	href="<%=request.getContextPath()%>/css/jihaoshi.css" rel="stylesheet">--%>
<%--<style>--%>
<%--#pageHead {--%>
<%--	width: 100%;--%>
<%--	height: 30%;--%>
<%--}--%>

<%--a {--%>
<%--	font-size: 20px;--%>
<%--}--%>

<%--#info {--%>
<%--	background: transparent;--%>
<%--	border: 0;--%>
<%--	font-size: 13px;--%>
<%--}--%>

<%--.drop {--%>
<%--	position: relative;--%>
<%--}--%>

<%--.submenu {--%>
<%--	position: relative;--%>
<%--	opacity: 0;--%>
<%--	width: 100%;--%>
<%--	z-index: 8;--%>
<%--	transition: opacity 0.5s ease;--%>
<%--}--%>

<%--.submenu-item {--%>
<%--	display: block;--%>
<%--	height: 0px;--%>
<%--	overflow: hidden;--%>
<%--	transition: height 0.5s ease;--%>
<%--}--%>

<%--.drop:hover .submenu {--%>
<%--	opacity: 1;--%>
<%--	border: solid 1px black;--%>
<%--}--%>

<%--.drop:hover .submenu-item {--%>
<%--	overflow: visible;--%>
<%--	height: 30px;--%>
<%--}--%>

<%--table {--%>
<%--	font-size: 20px;--%>
<%--	width: 400px;--%>
<%--	margin-top: 5px;--%>
<%--	margin-bottom: 5px;--%>
<%--	margin-left: auto;--%>
<%--	margin-right: auto;--%>
<%--}--%>

<%--table, th, td {--%>
<%--	border: 2px solid lightgray;--%>
<%--}--%>

<%--th, td {--%>
<%--	padding: 8px;--%>
<%--	text-align: center;--%>
<%--}--%>
<%--</style>--%>
<%--</head>--%>
<%--<body>--%>
<%--	<img src="<%=request.getContextPath()%>/images/JihaoshiPageHead.jpg"--%>
<%--		id="pageHead">--%>
<%--	<div class="block_N" style="margin: 0px auto;"></div>--%>
<%--	<div id="WRAPPER" class="ecsite-layout style_shopping ecsite-search">--%>
<%--		<div id="CONTENT" class="layout-wrapper">--%>
<%--			<div class="layout-center" style="text-align: center">--%>
<%--				<!--?????????????????????-->--%>
<%--				<dl class="block_W">--%>
<%--					<dd id="CategoryContainer">--%>
<%--						<ul class="treeview">--%>
<%--							<li><c:if test="${not empty errorMsgs}">--%>
<%--									<font style="color: red">?????????????????????:</font>--%>
<%--									<ul>--%>
<%--										<c:forEach var="message" items="${errorMsgs}">--%>
<%--											<li style="color: red">${message}</li>--%>
<%--										</c:forEach>--%>
<%--									</ul>--%>
<%--								</c:if></li>--%>
<%--							<li>??????:<font color=blue> ${Guest} </font><font color=blue>--%>
<%--									${member.memberAccount} </font>?????? <br> <font>????????????:--%>
<%--									${member.memberNo} </font> <br> <font>????????????:--%>
<%--									${member.memberName} </font></li>--%>
<%--							<li><c:if test="${not empty member}">--%>
<%--									<a href="<%=request.getContextPath()%>/member/MemberServlet?action=Logout">??????</a>--%>
<%--								</c:if></li>--%>
<%--							<li><c:if test="${empty member}">--%>
<%--									<a href="./member/login.jsp">??????</a>--%>
<%--								</c:if></li>--%>
<%--							<li id="cate_D" class="expanded"><H1>????????????</H1>--%>
<%--								<ul class="main">--%>
<%--									<li class="drop"><a href="#">????????????</a>--%>
<%--										<ul class="submenu">--%>
<%--											<li class="submenu-item"><button id="info">????????????</button></li>--%>
<%--											<li class="submenu-item"><a href="#">????????????</a></li>--%>
<%--											<li class="submenu-item"><a--%>
<%--												href="phyCourComment/addPhyComment.jsp">????????????????????????</a></li>--%>
<%--											<li class="submenu-item"><a--%>

<%--												href="<%=request.getContextPath()%>/phyCourseComment?action=getMember_For_Display">????????????????????????</a></li>--%>
<%--                        <li class="submenu-item"><a--%>
<%--												href="<%=request.getContextPath()%>/MemberOnlineCourseCommentServlet?action=getMember_For_Display">????????????????????????</a></li>--%>
<%--										</ul></li>--%>
<%--                    --%>
<%--									<li class="drop"><a href="#">????????????</a></li>--%>

<%--                <li class="drop">--%>
<%--                  <a href="${pageContext.request.contextPath}/latest_news/select_page.jsp">????????????</a>         --%>
<%--                </li>--%>
<%--                <li class="drop">--%>
<%--                  <a href="${ctxPath}/meal/MealProductIndex.jsp">??????????????????</a>--%>
<%--                </li>--%>
<%--                <li class="drop">--%>
<%--                  <a href="${ctxPath}/cart/MealCart.jsp">?????????????????????<c:if test="${not empty cartProds}"> (${fn:length(cartProds)})</c:if></a>--%>
<%--                </li>--%>
<%--                <li class="drop">--%>
<%--                  <a href="${pageContext.request.contextPath}/onlineCourse/ListAllOnlineCourse.jsp">????????????????????????</a>--%>
<%--                </li>--%>
<%--                <li class="drop">--%>
<%--                  <a href="${pageContext.request.contextPath}/onlineCourse/ManageCourse.jsp">????????????????????????</a>--%>
<%--                </li>--%>
<%--                 <li class="drop">--%>
<%--                  <a href="${pageContext.request.contextPath}/onlineCourseOrderServlet?action=orderlist">??????????????????????????????</a>--%>
<%--                </li>--%>
<%--                <li class="drop">--%>
<%--                	<a href="${ctxPath}/cart/OnlineCourseCart.jsp">?????????????????????<c:if test="${not empty cartCourses}"> (${fn:length(cartCourses)})</c:if></a>--%>
<%--				</li>             --%>


<%--                <li class="drop">--%>
<%--                	<c:if test="${not empty member}">--%>
<%--                		<a href="<%=request.getContextPath()%>/forum_article/forum_article_select_page.jsp">??????????????????</a>--%>
<%--                	</c:if>--%>
<%--                	<c:if test="${empty member}">--%>
<%--                		<a href="<%=request.getContextPath()%>/forum_article/listAllForum_articlevistor.jsp">??????????????????</a>--%>
<%--                	</c:if>--%>
<%--                  --%>
<%--                </li>--%>

<%--                <li class="drop">--%>
<%--                  <a href="<%=request.getContextPath()%>/faqservlet?action=getAll">FAQ???????????????</a>--%>
<%--                </li>--%>
<%--              </ul>--%>
<%--          </ul>--%>
<%--        </dd>--%>
<%--      </dl>--%>


<%--				<!--?????????????????????-->--%>
<%--				<div class="block_C s_list" id="cardWrapper">--%>
<%--					<div class="Cm">--%>
<%--						<div id="ItemContainer" class="Cm_C"></div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			</div>--%>

<%--		</div>--%>
<%--	</div>--%>
<%--	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
<%--	<script src="js/member.js"></script>--%>
<%--	<script type="text/javascript"></script>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page import="com.cart.model.CartProdVO"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.faq.model.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Oxygen:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${ctxPath}/css/styles.css">

<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery.smartmenus/1.1.0/jquery.smartmenus.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery.smartmenus/1.1.0/addons/bootstrap/jquery.smartmenus.bootstrap.min.js'></script>
<title>JiHaoShi</title>
</head>

<body>
	<!-- Navbar Start -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<!-- LOGO -->
			<a class="navbar-brand" href="${ctxPath}/index2.jsp"> <img
				src="${ctxPath}/css/LOGO.png" alt="Logo" width="80" height="90">
			</a>
			<!-- ????????????????????????????????????????????????????????????????????? -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- collapse????????????????????????????????????????????????????????????????????? -->
			<!-- nav-collapse?????????????????????????????????????????????????????? -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="${pageContext.request.contextPath}/latest_news/select_page.jsp">????????????</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">??????????????????</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="${ctxPath}/meal/mealController?action=listAll">????????????</a></li>
							<li><a class="dropdown-item"
								href="${ctxPath}/meal/RandomAssign.jsp">????????????</a></li>
							<li><a class="dropdown-item"
								href="${ctxPath}/cart/MealCart.jsp">???????????????<c:if
										test="${not empty cartProds}"> (${fn:length(cartProds)})</c:if></a>
							</li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">????????????</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/onlineCourse/ListAllOnlineCourse.jsp">??????????????????</a></li>
							<li><a class="dropdown-item"
								href="${ctxPath}/cart/OnlineCourseCart.jsp">?????????????????????<c:if
										test="${not empty cartCourses}"> (${fn:length(cartCourses)})</c:if></a></li>
							<li><a class="dropdown-item" href="">??????????????????</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="<%=request.getContextPath()%>/forum_article/forum_article_select_page.jsp">??????????????????</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle"
						href="<%=request.getContextPath()%>/faqservlet?action=getAll"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">FAQ???????????????</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="<%=request.getContextPath()%>/faqservlet?action=getAll">FAQ</a></li>
							<li><a class="dropdown-item"
								href="<%=request.getContextPath()%>/customerServiceServlet?action=getConnection">????????????</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">????????????</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="">??????????????????</a></li>
							<li class="dropdown-submenu"><a class="dropdown-item">????????????&emsp;></a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="${ctxPath}/order/orderController?action=orderList">????????????</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/onlineCourseOrderServlet?action=orderlist">??????????????????</a></li>
								</ul></li>
							<li><a class="dropdown-item">????????????&emsp;></a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/onlineCourse/ManageCourse.jsp">????????????</a></li>
									<li><a class="dropdown-item" href="">????????????</a></li>
								</ul></li>
							<li><a class="dropdown-item"
								href="${ctxPath}/mealCollect/list">????????????</a></li>
							<li><a class="dropdown-item">????????????&emsp;></a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="<%=request.getContextPath()%>/MemberOnlineCourseCommentServlet?action=getMember_For_Display">????????????</a></li>
									<li><a class="dropdown-item"
										href="<%=request.getContextPath()%>/phyCourseComment?action=getMember_For_Display">????????????</a></li>
								</ul></li>
						</ul></li> &emsp;&emsp;
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${ctxPath}/cart/MealCart.jsp">???????????????<c:if
								test="${not empty cartProds}"> (${fn:length(cartProds)})</c:if></a>
					</li> &emsp;
					<li class="nav-item">

						<a class="nav-link active" aria-current="page" href="${ctxpath}/web/latest_news/listAllLatest_news.jsp">????????????</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">??????????????????</a>
							<ul class="dropdown-menu">
								<li>
                  					<a class="dropdown-item" href="${ctxPath}/meal/mealController?action=listAll">????????????</a>
               	 				</li>
                				<li>
                 		     		<a class="dropdown-item" href="${ctxPath}/meal/RandomAssign.jsp">????????????</a>
      				            </li>
                				<li>
                  					<a class="dropdown-item" href="${ctxPath}/cart/MealCart.jsp">???????????????<c:if test="${not empty cartProds}"> (${fn:length(cartProds)})</c:if></a>
               					</li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">????????????</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/onlineCourse/ListAllOnlineCourse.jsp">??????????????????</a></li>
								<li><a class="dropdown-item" href="${ctxPath}/cart/OnlineCourseCart.jsp">?????????????????????<c:if test="${not empty cartCourses}"> (${fn:length(cartCourses)})</c:if></a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/course/SignUpCouMgn.jsp">??????????????????</a></li>
							</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/forum_article/forum_article_select_page.jsp">??????????????????</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="<%=request.getContextPath()%>/faqservlet?action=getAll" role="button" data-bs-toggle="dropdown" aria-expanded="false">FAQ???????????????</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="<%=request.getContextPath()%>/faqservlet?action=getAll">FAQ</a></li>
								<li><a class="dropdown-item" href="<%=request.getContextPath()%>/customerServiceServlet?action=getConnection">????????????</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">????????????</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="">??????????????????</a></li>	
								<li class="dropdown-submenu">
									<a class="dropdown-item">????????????&emsp;></a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="${ctxPath}/order/orderController?action=orderList">????????????</a></li>
										<li><a class="dropdown-item" href="${pageContext.request.contextPath}/onlineCourseOrderServlet?action=orderlist">??????????????????</a></li>
									</ul>
								</li>
								<li><a class="dropdown-item">????????????&emsp;></a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="${pageContext.request.contextPath}/onlineCourse/ManageCourse.jsp">????????????</a></li>
										<li><a class="dropdown-item" href="">????????????</a></li>
									</ul>
								</li>
								<li>
                  					<a class="dropdown-item" href="${ctxPath}/mealCollect/list">????????????</a>
                				</li>
                				<li><a class="dropdown-item">????????????&emsp;></a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="<%=request.getContextPath()%>/MemberOnlineCourseCommentServlet?action=getMember_For_Display">????????????</a></li>
										<li><a class="dropdown-item" href="<%=request.getContextPath()%>/phyCourseComment?action=getMember_For_Display">????????????</a></li>
									</ul>
								</li>
							</ul>
					</li>
					&emsp;&emsp;
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="${ctxPath}/cart/MealCart.jsp">???????????????<c:if test="${not empty cartProds}"> (${fn:length(cartProds)})</c:if></a>
					</li>
					&emsp;
					<li class="nav-item">
						<li><a class="nav-link active" aria-current="page" href="${ctxPath}/cart/OnlineCourseCart.jsp">?????????????????????<c:if test="${not empty cartCourses}"> (${fn:length(cartCourses)})</c:if></a></li>
					</li>
					&emsp;&emsp;
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="${ctxPath}/member/login.jsp">?????? | ??????</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar End -->

	<!-- Feature Section Start-->
	<div class="mx-auto" id="feature">
		<img class="mx-auto d-block" id="feature-img" src="./css/feature.jpg"
			alt="">
		<div id="feature-text" style="">
			<p class="name">
				Take the stress<br>out of mealtime
			</p>
			<br>
			<button id="indexbutton">
				<a href="${ctxPath}/meal/mealController?action=listAll"
					style="text-decoration: none; color: #FFE1CA;">Get Start!</a>
			</button>
		</div>
	</div>
	<!-- Feature Section End-->



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/member.js"></script>
</body>

</html>

