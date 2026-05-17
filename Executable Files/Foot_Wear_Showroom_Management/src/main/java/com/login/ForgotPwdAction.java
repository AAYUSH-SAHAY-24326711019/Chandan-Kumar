package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fpwd/action/*")
public class ForgotPwdAction extends HttpServlet {

    private static final String DB_URL =
            "jdbc:postgresql://localhost:5432/footwearshowroom";

    private static final String DB_USER = "postgres";

    private static final String DB_PASSWORD = "root";

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

            Class.forName("org.postgresql.Driver");

            Connection con =
                    DriverManager.getConnection(
                            DB_URL,
                            DB_USER,
                            DB_PASSWORD
                    );

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


