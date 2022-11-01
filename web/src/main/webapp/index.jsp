<%@ page import="com.cart.model.CartProdVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
  session.getAttribute("account");
  List<CartProdVO> cartProds = (List<CartProdVO>) session.getAttribute("cartProds");
%>

<html>
<head>
  <title>Jihaoshi</title>
  <link type="text/css" href="<%=request.getContextPath()%>/css/jihaoshi.css" rel="stylesheet">
  <style>
    #pageHead {
      width: 100%;
      height: 30%;
    }

    a {
      font-size: 20px;
    }
  </style>
</head>
<body>
<img src="<%=request.getContextPath()%>/images/JihaoshiPageHead.jpg" id="pageHead">
<div class="block_N" style="margin:0px auto;">
</div>
<div id="WRAPPER" class="ecsite-layout style_shopping ecsite-search">
  <div id="CONTENT" class="layout-wrapper">
    <div class="layout-center" style="text-align:center">
      <!--側邊欄區塊開始-->
      <dl class="block_W">
        <dd id="CategoryContainer">
          <ul class="treeview">
            <li id="cate_D" class="expanded"><H1>功能列表</H1>
              <ul class="main">
                <li>
                  <a href="#">會員專區</a>
                </li>
                <li>
                  <a href="#">網站簡介</a>
                </li>
                <li>
                  <a href="#">最新消息</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/meal/MealProductIndex.jsp">好食產品專區</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/meal/MealCart.jsp">菜單商品購物車<%= (cartProds==null)?"":(" ("+cartProds.size()+")")%></a>
                </li>
                <li>
                  <a href="#">線上課程購物車</a>
                </li>
                <li>
                  <a href="#">最新消息</a>
                </li>
                <li>
                  <a href="#">康健新知論壇</a>
                </li>
                <li>
                  <a href="#">FAQ及客服專區</a>
                </li>
              </ul>
          </ul>
        </dd>
      </dl>
      <!--側邊欄區塊結束-->
      <div class="block_C s_list">
        <div class="Cm">
          <div id="ItemContainer" class="Cm_C">
            <dl class="col3f" id="DRAA0A-A900BUT82">

            </dl>

          </div>
        </div>
      </div>
    </div>

  </div>
</div>
</body>
</html>
