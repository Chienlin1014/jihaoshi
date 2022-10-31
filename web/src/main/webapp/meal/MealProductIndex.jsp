<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Jihaoshi</title>
  <link type="text/css" href="${ctxPath}/css/jihaoshi.css" rel="stylesheet">
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
<img src="${ctxPath}/images/JihaoshiPageHead.jpg" id="pageHead">
<div class="block_N" style="margin:0px auto;">
  <!--搜尋欄開始-->
  <div class="Nm" style="display: flex; justify-content: center; align-items: center; ">
    <ul class="searchfield">
      <li><input id="keyword" type="text" class="text ac_input" placeholder="請輸入關鍵字" autocomplete="off">
      </li>
      <li><input id="btn_search" type="button" class="button" value="找菜單"></li>
    </ul>
  </div>
  <!--搜尋欄結束-->
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
                  <a href="mealController?action=listAll">產品清單</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/cart/MealCart.jsp">菜單商品購物車<c:if test="${not empty cartProds}"> (${fn:length(cartProds)})</c:if></a>
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
