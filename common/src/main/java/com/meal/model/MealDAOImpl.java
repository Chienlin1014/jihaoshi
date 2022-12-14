package com.meal.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MealDAOImpl implements MealDAO {
    public static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jihaoshi");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }


    private static final String GET_ALL_SQL = "SELECT * FROM MEAL_PRODUCT";
    public static final String INSERT_SQL = "INSERT INTO MEAL_PRODUCT (MEAL_NAME, MEAL_CONTENT, MEAL_CAL, MEAL_ALLERGEN, MEAL_PRICE, MEAL_PHOTO, MEAL_RECIPE, LAUNCH) VALUES (?,?,?,?,?,?,?,?);";
    public static final String UPDATE_SQL = "UPDATE MEAL_PRODUCT SET MEAL_NAME=?, MEAL_CONTENT=?, MEAL_CAL=?, MEAL_ALLERGEN=?, MEAL_PRICE=?, MEAL_PHOTO=?, MEAL_RECIPE=?, LAUNCH=? WHERE MEAL_NO=? ;";
    public static final String UPDATE_WITHOUT_PHOTO_SQL = "UPDATE MEAL_PRODUCT SET MEAL_NAME=?, MEAL_CONTENT=?, MEAL_CAL=?, MEAL_ALLERGEN=?, MEAL_PRICE=?,  MEAL_RECIPE=?, LAUNCH=? WHERE MEAL_NO=? ;";

    public static final String LAUNCH_SQL = "UPDATE MEAL_PRODUCT SET LAUNCH = ? WHERE MEAL_NO = ? ;";
    public static final String FINDBY_MEALNO = "SELECT * FROM MEAL_PRODUCT WHERE MEAL_NO=? ;";
    public static final String GET_ALL_LAUNCH = "SELECT * FROM MEAL_PRODUCT WHERE LAUNCH=1;";
    public static final String FIND_BY_NAME_KEYWORD = "SELECT * FROM MEAL_PRODUCT WHERE MEAL_NAME LIKE ? ;";

    @Override
    public MealVO insert(MealVO meal) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS);) {
            conn.setAutoCommit(false);
            ps.setString(1, meal.getMealName());
            ps.setString(2, meal.getMealContent());
            ps.setInt(3, meal.getMealCal());
            ps.setString(4, meal.getMealAllergen());
            ps.setInt(5, meal.getMealPrice());
            ps.setBytes(6, meal.getMealPhoto());
            ps.setString(7, meal.getMealRecipe());
            ps.setInt(8, meal.getLaunch());
            ps.executeUpdate();
            conn.commit();
            var generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                meal.setMealNo(generatedKeys.getInt(1));
            }
            return findByMealNo(meal.getMealNo());
        } catch (SQLException e) {

            e.printStackTrace();

        }
        return null;
    }

    @Override
    public MealVO findByMealNo(Integer mealNo) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(FINDBY_MEALNO);) {
            ps.setInt(1, mealNo);
            ResultSet rs = ps.executeQuery();
            MealVO meal = null;
            if (rs.next()) {
                meal = parseMealVO(rs);
                return meal;
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public MealVO findByMealNo(Integer mealNo, Connection conn) {
        try {
            PreparedStatement ps = conn.prepareStatement(FINDBY_MEALNO);
            ps.setInt(1, mealNo);
            ResultSet rs = ps.executeQuery();
            MealVO meal = null;
            if (rs.next()) {
                meal = parseMealVO(rs);
                return meal;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private MealVO parseMealVO(ResultSet rs) throws SQLException {
        MealVO meal = new MealVO
                (rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getBytes(7), rs.getInt(8), rs.getString(9),
                        rs.getInt(10), rs.getInt(11), rs.getInt(12),
                        rs.getTimestamp(13));
        return meal;
    }

    @Override
    public void update(MealVO meal) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_SQL);) {
            ps.setString(1, meal.getMealName());
            ps.setString(2, meal.getMealContent());
            ps.setInt(3, meal.getMealCal());
            ps.setString(4, meal.getMealAllergen());
            ps.setInt(5, meal.getMealPrice());
            ps.setBytes(6, meal.getMealPhoto());
            ps.setString(7, meal.getMealRecipe());
            ps.setInt(8, meal.getLaunch());
            ps.setInt(9, meal.getMealNo());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateWithoutPhoto(MealVO meal) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_WITHOUT_PHOTO_SQL);) {
            ps.setString(1, meal.getMealName());
            ps.setString(2, meal.getMealContent());
            ps.setInt(3, meal.getMealCal());
            ps.setString(4, meal.getMealAllergen());
            ps.setInt(5, meal.getMealPrice());
            ps.setString(6, meal.getMealRecipe());
            ps.setInt(7, meal.getLaunch());
            ps.setInt(8, meal.getMealNo());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean launchSwitch(Integer mealNo, Integer launch) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(LAUNCH_SQL);) {
            ps.setInt(1, launch);
            ps.setInt(2, mealNo);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public List<MealVO> findByNameKeyword(String nameKeyword) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(FIND_BY_NAME_KEYWORD)) {
            ps.setString(1, "%"+nameKeyword+"%");
            ResultSet rs = ps.executeQuery();
            List<MealVO> meals = new ArrayList<>();
            while (rs.next()) {
                MealVO meal = parseMealVO(rs);
                meals.add(meal);
            }
            return meals;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public MealVO findWithoutAllergen(String mealAllergen) {
        return null;
    }

    @Override
    public List<MealVO> getAll() {
        return getAll(GET_ALL_SQL);
    }

    @Override
    public List<MealVO> getAllLaunch() {
        return getAll(GET_ALL_LAUNCH);
    }

    private List<MealVO> getAll(String sql) {
        List<MealVO> meals = new ArrayList<>();
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MealVO meal = parseMealVO(rs);
                meals.add(meal);
            }
            return meals;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
