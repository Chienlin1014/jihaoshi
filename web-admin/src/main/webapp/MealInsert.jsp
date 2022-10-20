<%@ page import="com.meal.model.MealVO" %><%--
  Created by IntelliJ IDEA.
  User: CHIENLIN
  Date: 2022/10/20
  Time: 下午 08:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    MealVO meal = (MealVO) request.getAttribute("MealVO");
%>

<html>
<head>
    <title>新增菜單商品</title>
</head>
<body>
<form method="post" action="mealController" enctype="multipart/form-data" id="form1">
    <div>
        <input type="text" name="action" value="insert" hidden>
        <label>輸入菜單名稱：</label><input type="text" name="mealName"><br><br>
        <label>輸入食材內容：</label><input type="text" name="mealContent"><br><br>
        <label>輸入熱量：</label><input type="text" name="mealCal"><br><br>
        <label>輸入可能過敏源：</label><input type="text" name="mealAllergen"><br><br>
        <label>輸入售價：</label><input type="text" name="maelPrice"><br><br>
        <label>輸入食譜：</label><textarea name="mealRecipe"></textarea><br><br>
        <label>上傳照片：</label><input type="file" name="mealPhoto" ><br><br>
        <label>是否上架：</label><input type="radio" name="launch" value="1" id="launchYes">
        <label for="launchYes">是</label>
        <input type="radio" name="launch" value="0" id="launchNo"><label for="launchNo">否</label>
        <br>
        <button type="submit" form="form1">送出資料</button>
        <button type="reset" form="form1">清除資料</button>
    </div>
</form>
</body>
</html>
