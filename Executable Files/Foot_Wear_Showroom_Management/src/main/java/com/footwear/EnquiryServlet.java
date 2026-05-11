package com.footwear;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/EnquiryServlet")
public class EnquiryServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
		
		String userType = request.getParameter("user_type");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        
        try {

            Class.forName("org.postgresql.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/footwearshowroom",
                    "postgres",
                    "root"
            );
            
            String query =
                    "INSERT INTO customer_enquiries " +
                    "(user_type, contact, email, message) " +
                    "VALUES (?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, userType);
            ps.setString(2, contact);
            ps.setString(3, email);
            ps.setString(4, message);

            ps.executeUpdate();

            con.close();
            
            response.getWriter().println(
                    "Enquiry Submitted Successfully"
            );
        } catch (Exception e) {

            e.printStackTrace();

        }
	}

}
