package com.meal.model;

import static com.common.DBConstants.PASSWORD;
import static com.common.DBConstants.URL;
import static com.common.DBConstants.USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MealDAOImpl implements MealDAO {


    private static final String GET_ALL_SQL = "select * from meal_product";
    public static final String INSERT_SQL = "insert into meal_product (meal_name, meal_content, meal_cal, meal_allergen, meal_price, meal_photo, meal_recipe, launch) values (?,?,?,?,?,?,?,?);";
    public static final String UPDATE_SQL = "update meal_product set ";
    public static final String LAUNCH_SQL = "update meal_product set launch = ? where meal_no = ? ;";

    @Override
    public void insert(MealVO meal) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try( Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

             PreparedStatement ps= conn.prepareStatement(INSERT_SQL);) {
            ps.setString(1,meal.getMealName());
            ps.setString(2, meal.getMealContent());
            ps.setInt(3, meal.getMealCal());
            ps.setString(4, meal.getMealAllergen());
            ps.setInt(5, meal.getMealPrice());
            ps.setBinaryStream(6, meal.getMealPhoto());
            ps.setString(7,meal.getMealRecipe());
            ps.setInt(8,meal.getLaunch());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Integer update(MealVO meal) {
        int rowCount=0;

        return null;
    }

    @Override
    public Integer launchOn(Integer mealNo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try( Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

             PreparedStatement ps= conn.prepareStatement(LAUNCH_SQL);) {
            ps.setInt(1, 1);
            ps.setInt(2,mealNo);
            ps.executeUpdate();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
    public Integer launchOff(Integer mealNo){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try( Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

             PreparedStatement ps= conn.prepareStatement(LAUNCH_SQL);) {
            ps.setInt(1, 0);
            ps.setInt(2,mealNo);
            ps.executeUpdate();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
    @Override
    public MealVO findBymealName(String mealName) {
        return null;
    }

    @Override
    public MealVO findWithoutAllergen(String mealAllergen) {
        return null;
    }

    @Override
    public List<MealVO> getAll() {
        List<MealVO> meal = new ArrayList<>();

        return null;
    }
}
