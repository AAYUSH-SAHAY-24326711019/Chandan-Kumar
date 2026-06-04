package com.customer;

import java.io.IOException;

import com.dao.CustomerDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int cid = Integer.parseInt(request.getParameter("cid"));
        String mobile = request.getParameter("mobile");

        CustomerDAO dao = new CustomerDAO();

        Customer customer = dao.login(cid, mobile);

        if(customer != null) {

            HttpSession session = request.getSession();

            session.setAttribute("customer", customer);

//            response.sendRedirect("customerDashboard.jsp");
            response.sendRedirect("ViewItemsServlet");

        } else {

            response.sendRedirect("customerLogin.jsp");
        }
    }
}