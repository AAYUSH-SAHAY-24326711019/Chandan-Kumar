package com.messages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/messages/*")
public class ViewMessagesServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    int page = 1;
	    int recordsPerPage = 20;

	    if (request.getParameter("page") != null) {
	        page = Integer.parseInt(request.getParameter("page"));
	    }

	    int start = (page - 1) * recordsPerPage;

	    List<Enquiry> enquiryList = new ArrayList<>();

	    try {

	        Class.forName("org.postgresql.Driver");

	        Connection con = DriverManager.getConnection(
	                "jdbc:postgresql://localhost:5432/footwearshowroom",
	                "postgres",
	                "root"
	        );

	        String sql = """
	            SELECT *
	            FROM customer_enquiries
	            ORDER BY date_time DESC
	            LIMIT ? OFFSET ?
	        """;

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, recordsPerPage);
	        ps.setInt(2, start);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {

	            Enquiry e = new Enquiry();

	            e.setEnquiry_id(rs.getInt("enquiry_id"));
	            e.setUser_type(rs.getString("user_type"));
	            e.setEmail(rs.getString("email"));
	            e.setContact(rs.getString("contact"));
	            e.setMessage(rs.getString("message"));
	            e.setDateTime(rs.getTimestamp("date_time").toString());

	            enquiryList.add(e);
	        }

	        // total records

	        Statement st = con.createStatement();

	        ResultSet totalRs = st.executeQuery(
	                "SELECT COUNT(*) FROM customer_enquiries"
	        );

	        int totalRecords = 0;

	        if (totalRs.next()) {
	            totalRecords = totalRs.getInt(1);
	        }

	        int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

	        request.setAttribute("messages", enquiryList);
	        request.setAttribute("currentPage", page);
	        request.setAttribute("totalPages", totalPages);

	        RequestDispatcher rd =
	                request.getRequestDispatcher("/messages.jsp");

	        rd.forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
