<%@ page import="com.meal.model.MealDAO" %>
<%@ page import="com.meal.model.MealDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.meal.model.MealVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  MealDAO dao=new MealDAOImpl();
  List<MealVO> meals=dao.getAll();
  request.setAttribute("meals",meals);
%>
<html>
<head>
    <title>Title</title>
  <style>
    #pageHead{
      width: 100%;
      height: 30%;
    }
  </style>
</head>
<body>
<img src="../images/JihaoshiPageHead.jpg" id="pageHead">


</body>
</html>
