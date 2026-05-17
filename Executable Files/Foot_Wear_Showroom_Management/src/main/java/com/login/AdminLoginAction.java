package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/login/*")
public class AdminLoginAction  extends HttpServlet{
	
	private static final String DB_URL =
            "jdbc:postgresql://localhost:5432/footwearshowroom";

    private static final String DB_USER = "postgres";

    private static final String DB_PASSWORD = "root";
    
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            Class.forName("org.postgresql.Driver");

            Connection con = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql =
                    "SELECT * FROM admin_team " +
                    "WHERE admin_email=? AND admin_pass=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                request.getRequestDispatcher(
                        "/admin_dashboard.jsp"
                ).forward(request, response);

            } else {

                response.getWriter().println(
                        "Invalid Credentials"
                );
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

}
