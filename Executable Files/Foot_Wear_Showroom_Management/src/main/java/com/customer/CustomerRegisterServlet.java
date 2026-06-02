package com.customer;

import java.io.IOException;

import com.dao.CustomerDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomerRegisterServlet")
public class CustomerRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String cname = request.getParameter("cname");
        String mobile = request.getParameter("mobile");

        CustomerDAO dao = new CustomerDAO();

        Customer customer =
                dao.registerCustomer(cname, mobile);

        if(customer != null) {

            HttpSession session =
                    request.getSession();

            session.setAttribute("customer", customer);

            response.sendRedirect("customerDashboard.jsp");

        } else {

            response.sendRedirect("RegisterCustomer.jsp");
        }
    }
}