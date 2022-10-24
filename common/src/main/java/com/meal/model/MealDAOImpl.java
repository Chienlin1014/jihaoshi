package com.meal.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MealDAOImpl implements MealDAO {
    public static DataSource ds=null;
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
    public static final String LAUNCH_SQL = "UPDATE MEAL_PRODUCT SET LAUNCH = ? WHERE MEAL_NO = ? ;";
    public static final String FINDBYLAST_SQL="SELECT * FROM MEAL_PRODUCT WHERE MEAL_NO=(SELECT MAX(MEAL_NO) FROM MEAL_PRODUCT);";
    public static final String FINDBY_MEALNO = "SELECT * FROM MEAL_PRODUCT WHERE MEAL_NO=? ;";
    @Override
    public void insert(MealVO meal) {
        try( Connection conn = ds.getConnection();
             PreparedStatement ps= conn.prepareStatement(INSERT_SQL,Statement.RETURN_GENERATED_KEYS);) {
            ps.setString(1,meal.getMealName());
            ps.setString(2, meal.getMealContent());
            ps.setInt(3, meal.getMealCal());
            ps.setString(4, meal.getMealAllergen());
            ps.setInt(5, meal.getMealPrice());
            ps.setBinaryStream(6, meal.getMealPhoto());
            ps.setString(7,meal.getMealRecipe());
            ps.setInt(8,meal.getLaunch());
            ps.executeUpdate();
            var generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                meal.setMealNo(generatedKeys.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public MealVO findByLastUpdate() {
        try( Connection conn = ds.getConnection();
             PreparedStatement ps= conn.prepareStatement(FINDBYLAST_SQL);) {
            ResultSet rs = ps.executeQuery();
            MealVO meal =null;
            if (rs.next()) {
                meal=new MealVO
                        (rs.getInt(1), rs.getString(2),rs.getString(3),
                                rs.getInt(4),rs.getString(5),rs.getInt(6),
                                rs.getBinaryStream(7),rs.getInt(8),rs.getString(9),
                                rs.getInt(10),rs.getInt(11),rs.getInt(12),
                                rs.getDate(13));
                return meal;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public MealVO findByMealNo(Integer mealNo) {
        try( Connection conn = ds.getConnection();
             PreparedStatement ps= conn.prepareStatement(FINDBY_MEALNO);) {
            ps.setInt(1,mealNo);
            ResultSet rs = ps.executeQuery();
            MealVO meal =null;
            if (rs.next()) {
                meal=new MealVO
                        (rs.getInt(1), rs.getString(2),rs.getString(3),
                                rs.getInt(4),rs.getString(5),rs.getInt(6),
                                rs.getBinaryStream(7),rs.getInt(8),rs.getString(9),
                                rs.getInt(10),rs.getInt(11),rs.getInt(12),
                                rs.getDate(13));
                return meal;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(MealVO meal) {
        try( Connection conn = ds.getConnection();
             PreparedStatement ps= conn.prepareStatement(UPDATE_SQL);) {
            ps.setString(1,meal.getMealName());
            ps.setString(2, meal.getMealContent());
            ps.setInt(3, meal.getMealCal());
            ps.setString(4, meal.getMealAllergen());
            ps.setInt(5, meal.getMealPrice());
            ps.setBinaryStream(6, meal.getMealPhoto());
            ps.setString(7,meal.getMealRecipe());
            ps.setInt(8,meal.getLaunch());
            ps.setInt(9,meal.getMealNo());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Integer launchOn(Integer mealNo) {
        try( Connection conn = ds.getConnection();
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
        try( Connection conn = ds.getConnection();

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
