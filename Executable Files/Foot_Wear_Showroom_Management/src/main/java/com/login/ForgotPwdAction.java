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
import com.service.ForgotPasswordService;

@WebServlet("/fpwd/action/*")
public class ForgotPwdAction extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");

		int adminId = Integer.parseInt(request.getParameter("admin_id"));

		String newPassword = request.getParameter("new_pwd");

		try {
			ForgotPasswordService service =
			        new ForgotPasswordService();

			boolean success =
			        service.resetPassword(
			                email,
			                adminId,
			                newPassword);

			if (success) {

			    response.sendRedirect(
			            request.getContextPath()
			            + "/admin/");

			} else {

			    response.getWriter().println(
			            "Invalid Email or Admin ID");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
