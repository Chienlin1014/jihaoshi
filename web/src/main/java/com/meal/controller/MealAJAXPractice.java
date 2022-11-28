package com.meal.controller;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.meal.model.MealService;
import com.meal.model.MealVO;

@WebServlet("/meal/MealAJAXPractice")
public class MealAJAXPractice extends HttpServlet {

    private MealService mealSV;

    public MealAJAXPractice() {
        this.mealSV = new MealService();
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    doPost(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");

        MealVO meal = mealSV.findByMealNo(1);

        meal.setShowPhoto("data:image/png;base64,"+ Base64.getEncoder().encodeToString(meal.getMealPhoto()));
        byte[] b=new byte[1];
        meal.setMealPhoto(b);
        Gson gson=new Gson();
//        gson.toJson(meal);
        res.getWriter().println(gson.toJson(meal));
        System.out.println("HI");
        System.out.println(gson.toJson(meal));
    }
}
