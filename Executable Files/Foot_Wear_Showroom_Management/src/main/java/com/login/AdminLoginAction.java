package com.login;


import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import com.entity.Admin;
import com.service.AdminService;

@WebServlet("/admin/login/*")
public class AdminLoginAction extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			AdminService service = new AdminService();

			Admin validUser = service.login(email, password);

			if (validUser!=null) {

				HttpSession session = request.getSession();
				session.setAttribute("admin_email", email);

				request.getRequestDispatcher("/admin_dashboard.jsp").forward(request, response);

			} else {

				response.getWriter().println("Invalid Credentials");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
