package com.meal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meal.model.MealService;
import com.meal.model.MealVO;

@WebServlet("/meal/mealController")
@MultipartConfig(fileSizeThreshold = 0, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MealController extends HttpServlet {
    MealService mealSV=new MealService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<MealVO> meals = (ArrayList<MealVO>) session.getAttribute("shppingCart");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if ("listAll".equals(action)) {

            List<MealVO> meals=mealSV.getAll();
            if (meals != null) {
                req.setAttribute("lastAllMeal", meals);
                RequestDispatcher productPage = req.getRequestDispatcher("/meal/ListMealProduct.jsp");
                productPage.forward(req, res);
            }
        }

        if ("findByprod".equals(action)) {
            Integer mealNo = Integer.valueOf(req.getParameter("mealNo"));
            MealVO meal = mealSV.findByMealNo(mealNo);
            if (meal != null) {
                req.setAttribute("meal", meal);
                RequestDispatcher productPage = req.getRequestDispatcher("/meal/ProductPage.jsp");
                productPage.forward(req, res);
            }
        }
        if ("cartAdd".equals(action)) {

            Integer mealNo = Integer.valueOf(req.getParameter("mealNo"));
            Double quantity = Double.valueOf(req.getParameter("quantity"));
            Integer amount = Integer.valueOf(req.getParameter("amount"));
            MealVO meal = mealSV.findByMealNo(mealNo,quantity);
            meal.setQuantity(quantity);
            meal.setAmount(amount);
            if(meal.)
            meals.add(meal);

        }
    }
}
