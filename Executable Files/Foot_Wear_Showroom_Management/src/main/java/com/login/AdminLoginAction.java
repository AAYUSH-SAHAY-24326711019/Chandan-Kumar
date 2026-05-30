package com.login;

import com.footwear.utility.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/login/*")
public class AdminLoginAction  extends HttpServlet{
	
	
    
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

        	Connection con =
        			DbConnection.getConnection();

            String sql =
                    "SELECT * FROM admin_team " +
                    "WHERE admin_email=? AND admin_pass=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	
            	HttpSession session = request.getSession();
            	session.setAttribute("admin_email", email);

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
