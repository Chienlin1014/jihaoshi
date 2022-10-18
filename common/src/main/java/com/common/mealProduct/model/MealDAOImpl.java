package com.common.mealProduct.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class MealDAOImpl implements MealDAO {
//    private static DataSource ds = null;
//    static {
//        try {
//            Context ctx = new InitialContext();
//            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jihaoshi");
//        } catch (NamingException e) {
//            e.printStackTrace();
//        }
//    }

    private static final String GET_ALL_SQL = "select * from meal_product";
    public static final String INSERT_SQL = "insert into jihaoshi.meal_product (meal_name, meal_content, meal_cal, meal_allergen, meal_price, meal_photo, meal_recipe) values (?,?,?,?,?,?,?);";
    @Override
    public void insert(MealVO meal) {
//        Connection conn=null;
//        PreparedStatement ps=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try( Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jihaoshi?serverTimezone=Asia/Taipei", "root", "1234");

             PreparedStatement ps= conn.prepareStatement(INSERT_SQL);) {
//            conn= ds.getConnection();

            ps.setString(1,meal.getMealName());
            ps.setString(2, meal.getMealContent());
            ps.setInt(3, meal.getMealCal());
            ps.setString(4, meal.getMealAllergen());
            ps.setInt(5, meal.getMealPrice());
            ps.setBinaryStream(6, meal.getMealPhoto());
            ps.setString(7,meal.getMealRecipe());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Integer update(MealVO meal) {
        return null;
    }

    @Override
    public Integer launch(Boolean launch) {
        return null;
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
        return null;
    }
}
