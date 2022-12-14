<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Jihaoshi</title>
    <link type="text/css" href="../css/jihaoshi.css" rel="stylesheet">
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
<img src="../images/JihaoshiPageHead.jpg" id="pageHead">
<div class="block_N" style="margin:0px auto;">
    <!--搜尋欄開始-->

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
                                    <a href="${ctxPath}/meal/mealController?action=listAll" >菜單商品列表</a>
                                </li>
                                <li>
                                    <a href="${ctxPath}/meal/MealInsert.jsp">新增菜單商品</a>
                                </li>
                                <li>
                                    <a href="${ctxPath}/nutrient/insert" >新增營養特色</a>
                                </li>
                                <li>
                                    <a href="${ctxPath}">回首頁</a>
                                </li>
                            </ul>
                    </ul>
                </dd>
            </dl>
            <!--側邊欄區塊結束-->
            <div class="block_C s_list">
                <div class="Cm">
                    <div id="ItemContainer" class="Cm_C">
                        <div class="Nm" style="display: flex; justify-content: center; align-items: center; ">
                            <form method="post" action="${ctxPath}/meal/mealController" enctype="application/x-www-form-urlencoded" id="searceKeyword">
                                <ul class="searchfield">
                                    <li>
                                        <input id="keyword" type="text" class="text ac_input" name="nameKeyword" placeholder="請輸入關鍵字" >
                                        <input name="action" value="nameKeywordSearch" hidden>
                                    </li>
                                    <li>
                                        <button type="submit" form="searceKeyword" >找菜單</button>
                                    </li>
                                </ul>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
