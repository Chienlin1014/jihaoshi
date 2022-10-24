package com.meal.controller;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/meal/ShowMealPhoto")
public class ShowMealPhoto extends HttpServlet {
    public static DataSource ds=null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jihaoshi");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("image/*");

        ServletOutputStream out = res.getOutputStream();

        String GET_POHOTO_BY_MEALNO="select meal_photo from meal_product where meal_no= ?";
        try (Connection conn = ds.getConnection();
        PreparedStatement ps= conn.prepareStatement(GET_POHOTO_BY_MEALNO);) {
            ps.setInt(1,Integer.valueOf(req.getParameter("mealNo")));
            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("meal_photo"));
                byte[] buf = new byte[4 * 1024];
                int len;
                while ((len = in.read(buf)) != -1) {
                    out.write(buf,0,len);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
