<%@ page import="com.meal.model.MealVO"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
MealVO meal = (MealVO) request.getAttribute("meal");
%>
<html>
<head>
<title>修改菜單商品</title>
<style>
.class2{
diplay: none;
}
#content {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.button {
	border-radius: 1rem;
	border: 1px solid #ccc;
}

#form {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}
</style>
</head>
<body>
	<%@ include file="../navbar.file"%>
	<br>
	<div id="content">
		<!--商品欄開始-->
		<br>
		<div style="margin: 0px auto; text-align: center;">
			<c:if test="${not empty errMsgs}">
				<font style="color: red">請修正以下錯誤</font>
				<br>
				<c:forEach var="message" items="${errMsgs}">
					<span style="color: red">${message}</span>
					<br>
				</c:forEach>
				<br>
			</c:if>
		</div>
		<form method="post" action="mealController" enctype="multipart/form-data" id="form1">
		<div id="form">
			<input type="hidden" name="action" value="update"> 
			<input type="hidden" value="<%=request.getParameter("mealNo")%>" name="mealNo">
			<div>
			<label>菜單編號：</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=request.getParameter("mealNo")%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
			</div>
			<br><br>
			<div style="margin: 0px auto;">
			<label>菜單名稱：</label> 
			<input type="text" name="mealName" value="<%=meal.getMealName()%>">
			</div>
			<br>
			<br>
			<div style="margin: 0px auto;"> 
			<label>食材內容：</label> 
			<input type="text" name="mealContent" value="<%=meal.getMealContent()%>">
			</div>
			<br>
			<br>
			<div style="margin: 0px auto;"> 
			<label>菜單熱量：</label> 
			<input type="text" name="mealCal" value="<%=meal.getMealCal()%>"> 
			</div>
			<br>
			<br> 
			<div style="margin: 0px auto;">
			<label>過敏物質：</label> 
			<input type="text" name="mealAllergen" value="<%=meal.getMealAllergen()%>">
			</div>
			<br>
			<br>
			<div style="margin: 0px auto;"> 
			<label>輸入售價：</label> 
			<input type="text" name="maelPrice" value="<%=meal.getMealPrice()%>">
			</div>
			<br>
			<br>
			<div style="margin: 0px auto;"> 
			<label>輸入食譜：</label>
			<textarea name="mealRecipe"><%=meal.getMealRecipe()%></textarea>
			</div>
			<br>
			<br>
			<div style="margin: 0px auto;"> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label>上傳照片：</label>
			<input type="file" name="mealPhoto" accept="image/*">
			</div>
			<br>
			<br>
			<div style="margin: 0px auto;"> 
			<label>是否上架：</label> 
			<input type="radio" name="launch" value="1" id="launchYes" checked> 
			<label for="launchYes">是</label>
			<input type="radio" name="launch" value="0" id="launchNo"> 
			<label for="launchNo">否</label>
			</div> 
			<br>
			<div style="margin: 0px auto;">
			<button type="submit" form="form1" class="button">送出資料</button>
			<button type="reset" form="form1" class="button">清除資料</button>
			</div>
		</div>
		</form>
	</div>

</body>
</html>
