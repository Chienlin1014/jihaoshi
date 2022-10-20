package com.meal.controller;

import com.meal.model.MealDAO;
import com.meal.model.MealDAOImpl;
import com.meal.model.MealVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/mealController")
@MultipartConfig(fileSizeThreshold = 0, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MealController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");
        String action = req.getParameter("action");
        String mealName = req.getParameter("mealName").trim();
        String mealContent = req.getParameter("mealContent").trim();
        Integer mealCal = Integer.valueOf(req.getParameter("mealCal").trim());
        String mealAllergen = req.getParameter("mealAllergen").trim();
        Integer mealPrice = Integer.valueOf(req.getParameter("maelPrice").trim());
        InputStream mealPhoto = req.getPart("mealPhoto").getInputStream();
        String mealRecipe = req.getParameter("mealRecipe").trim();
        Integer launch = Integer.valueOf(req.getParameter("launch"));

        if("insert".equals(action)) {
            List<String> errMsgs= new ArrayList<>();
            req.setAttribute("errMsgs",errMsgs);
            if (mealName == null || mealName.length() == 0) {
                errMsgs.add("菜單名稱不得空白");
            }
            if (mealContent==null || mealContent.length()==0){
                errMsgs.add("菜單內容不得空白");
            }
            if(mealCal<=0 || mealCal==null){
                errMsgs.add("熱量不得小於零或空白");
            }
            if (mealAllergen == null || mealAllergen.length() == 0) {
                errMsgs.add("若無過敏源，請填寫\"無\"");
            }
            if (mealPrice <= 0 || mealPrice == null) {
                errMsgs.add("價格不得小於零或空白");
            }
            if (mealRecipe == null || mealContent.trim().length()==0) {
                errMsgs.add("食譜不得空白");
            }
            MealVO meal = new MealVO(mealName, mealContent, mealCal, mealAllergen, mealPrice, mealPhoto, mealRecipe, launch);

            if(!errMsgs.isEmpty()){
                req.setAttribute("MealVO", meal);
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/emp/MealInsert.jsp");
                failureView.forward(req, res);
                return; //程式中斷
            }
            MealDAO dao = new MealDAOImpl();
            dao.insert(meal);
        }

//        InputStream in = req.getPart("mealPhoto").getInputStream();

    }
}
