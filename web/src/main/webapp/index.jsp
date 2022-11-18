<%@ page contentType="text/html;charset=UTF-8"%>
<%
session.getAttribute("account");
%>

<html>
<head>
<title>Jihaoshi</title>
<link type="text/css"
	href="<%=request.getContextPath()%>/css/jihaoshi.css" rel="stylesheet">
<style>
#pageHead {
	width: 100%;
	height: 30%;
}

a {
	font-size: 20px;
}

#info {
	background: transparent;
	border: 0;
	font-size: 13px;
}

.drop {
	position: relative;
}

.submenu {
	position: relative;
	opacity: 0;
	width: 100%;
	z-index: 8;
	transition: opacity 0.5s ease;
}

.submenu-item {
	display: block;
	height: 0px;
	overflow: hidden;
	transition: height 0.5s ease;
}

.drop:hover .submenu {
	opacity: 1;
	border: solid 1px black;
}

.drop:hover .submenu-item {
	overflow: visible;
	height: 30px;
}
table {
		width: 1050px;
		margin-top: 5px;
		margin-bottom: 5px;
	}
	
	table, th, td {
		border: 1px solid #CCCCFF;
	}
	
	th, td {
		padding: 8px;
		text-align: center;
	}
</style>
</head>
<body>
	<img src="<%=request.getContextPath()%>/images/JihaoshiPageHead.jpg"
		id="pageHead">
	<div class="block_N" style="margin: 0px auto;"></div>
	<div id="WRAPPER" class="ecsite-layout style_shopping ecsite-search">
		<div id="CONTENT" class="layout-wrapper">
			<div class="layout-center" style="text-align: center">
				<!--側邊欄區塊開始-->
				<dl class="block_W">
					<dd id="CategoryContainer">
						<ul class="treeview">
							<li>歡迎:<font color=red> ${MemberAcc} </font>您好 <br> <font>會員編號:
									${MemberNo} </font> <br> <font>會員姓名: ${MemberName} </font></li>
							<li id="logout"><a
								href="<%=request.getContextPath()%>/member/MemberServlet?action=Logout">登出</a></li>
							<li><a href="<%=request.getContextPath()%>/member/login.jsp">登入</a></li>
							<li id="cate_D" class="expanded"><H1>功能列表</H1>
								<ul class="main">
									<li class="drop"><a href="#">會員專區</a>
										<ul class="submenu">
											<li class="submenu-item"><button id="info">個人資料</button></li>
											<li class="submenu-item"><a href="#">訂單查詢</a></li>
											<li class="submenu-item"><a
												href="phyCourComment/addPhyComment.jsp">新增實體課程評價</a></li>
											<li class="submenu-item"><a
												href="phyCourComment/listAllMemberComments.jsp">我的實體課程評價</a></li>
										</ul></li>
									<li class="drop"><a href="#">網站簡介</a></li>
									<li class="drop"><a href="#">最新消息</a></li>
									<li class="drop"><a
										href="<%=request.getContextPath()%>/meal/MealProductIndex.jsp">好食產品專區</a>	
									</li>
									<li class="drop"><a
										href="<%=request.getContextPath()%>/meal/MealCart.jsp">菜單商品購物車</a>
									</li>
									<li class="drop"><a href="#">線上課程購物車</a></li>
									<li class="drop"><a href="#">最新消息</a></li>
									<li class="drop"><a href="#">康健新知論壇</a></li>
									<li class="drop"><a href="#">FAQ及客服專區</a></li>
								</ul>
						</ul>
					</dd>
				</dl>

				<!--側邊欄區塊結束-->
				<div class="block_C s_list" id="cardWrapper">
					<div class="Cm">
						<div id="ItemContainer" class="Cm_C">

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="js/member.js"></script>
	<script type="text/javascript"></script>
</body>
</html>
