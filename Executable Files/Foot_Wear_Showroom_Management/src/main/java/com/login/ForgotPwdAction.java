package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import com.footwear.utility.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fpwd/action/*")
public class ForgotPwdAction extends HttpServlet {

    

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        int adminId =
                Integer.parseInt(request.getParameter("admin_id"));

        String newPassword =
                request.getParameter("new_pwd");

        try {

        	Connection con =
        			DbConnection.getConnection();

            String sql =
                    "UPDATE admin_team " +
                    "SET admin_pass=? " +
                    "WHERE admin_email=? AND admin_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.setInt(3, adminId);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            if (rows > 0) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/"
                );

            } else {

                response.getWriter().println(
                        "Invalid Email or Admin ID"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}


