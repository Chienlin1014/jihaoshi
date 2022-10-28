<%@ page import="com.meal.model.MealVO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    MealVO meal = (MealVO) request.getAttribute("meal");
%>
<html>
<head>
    <link type="text/css" href="<%=request.getContextPath()%>/css/jihaoshi.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Title</title>
</head>
<body>
<img src="<%= request.getContextPath()%>/images/JihaoshiPageHead.jpg" id="pageHead">
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
                                    <a href="<%=request.getContextPath()%>/meal/MealInsert.jsp">新增菜單</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/index.jsp">回首頁</a>
                                </li>
                            </ul>
                    </ul>
                </dd>
            </dl>
            <!--側邊欄區塊結束-->
            <div class="block_C s_list">
                <div class="Cm">
                    <div class="prod_area">
                        <div class="div_productPage">
                            <img src="data:image/png;base64,<%= meal.getShowPhoto()%>" id="productPhoto"/>
                        </div>

                        <div class="div_productPage" style="text-align: left;line-height: 35px">
                            <span class="mealDescription">
                            <label>菜單名稱：</label><span><%=meal.getMealName()%></span>
                            <br>
                            <label>內容物：</label><span><%=meal.getMealContent()%></span>
                            <br>
                            <label>熱量：</label><span id="cal"><%=meal.getMealCal()%></span>
                            <br>
                            <label>過敏源：</label><span><%=meal.getMealAllergen()%></span>
                            <br>
                            <label>價格：</label><span id="price"><%=meal.getMealPrice()%></span>
                            <br>
                            <label>食譜：</label><span><%=meal.getMealRecipe()%></span>
                            <br>
                            <label>評論人數：</label><span><%=meal.getCommentPeople()%></span>
                            <br>

                            <label>評分：</label><span><%=(meal.getCommentPeople() != 0) ? (meal.getCommentScore() / meal.getCommentPeople()) : "尚無人評分"%> </span>
                           <br>
                            <label>調整分量：</label> </p>
                                <span>
                                    <input type="radio" name="quantity" value="1" id="quantity1" class="quantity"
                                           checked>
                            <label for="quantity1">原始分量</label>
                            <input type="radio" name="quantity" value="1.2" id="quantity1.2" class="quantity">
                            <label for="quantity1.2">1.2倍</label>
                            <input type="radio" name="quantity" value="1.5" id="quantity1.5" class="quantity">
                            <label for="quantity1.5">1.5倍</label>
                                </span></p>
                                <form method="post" action="#" id="formCart">
                                <input type="text" value="<%=meal.getMealNo()%>" name="mealNo" hidden>

                            </form>
                            <form method="post" action="#" id="formCheckout">
                                <input type="text" value="<%=meal.getMealNo()%>" name="mealNo" hidden>

                            </form>
                            </span>
                            <button type="submit" form="formCart">加入購物車</button>
                            <button type="submit" form="formCheckout">直接購買</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    $(document).ready(function () {
        $('#quantity1').click(function () {
            let cal =
            <%=meal.getMealCal()%> *
            $('#quantity1').val()
            let price =
            <%=meal.getMealPrice()%> *
            $('#quantity1').val()
            $('#cal').text(cal);
            $('#price').text(price);
        });
        $('#quantity1\\.2').click(function () {
            let cal =
            <%=meal.getMealCal()%> *
            $('#quantity1\\.2').val()
            let price =
            <%=meal.getMealPrice()%> *
            $('#quantity1\\.2').val()
            $('#cal').text(cal);
            $('#price').text(price);
        });
        $('#quantity1\\.5').click(function () {
            let cal =
            <%=meal.getMealCal()%> *
            $('#quantity1\\.5').val()
            let price =
            <%=meal.getMealPrice()%> *
            $('#quantity1\\.5').val()
            $('#cal').text(cal);
            $('#price').text(price);
        });
    });
</script>
</body>
</html>