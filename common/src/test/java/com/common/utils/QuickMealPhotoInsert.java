package com.common.utils;

import static com.common.DBConstants.PASSWORD;
import static com.common.DBConstants.URL;
import static com.common.DBConstants.USER;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class QuickMealPhotoInsert {
    public static void main(String[] args) throws IOException {
        String INSERT_PHOTO = "UPDATE MEAL_PRODUCT SET MEAL_PHOTO = ? WHERE MEAL_NO = ? ;";
        for (int i = 1; i<=13 ; i++) {
            File file = new File("C:/mealimages/"+i+".jpg");
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
            try (Connection conn= DriverManager.getConnection(URL,USER,PASSWORD);
                 PreparedStatement ps= conn.prepareStatement(INSERT_PHOTO)) {
                ps.setBinaryStream(1,bis);
                ps.setInt(2,i);
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
