package com.customer;

import java.io.IOException;

import com.dao.PurchaseDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect("customerLogin.jsp");
            return;
        }

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {

            response.sendRedirect("customerLogin.jsp");
            return;
        }

        int itemId =
                Integer.parseInt(
                        request.getParameter("itemId"));
        double amountPaid =
        	    Double.parseDouble(
        	        request.getParameter("amountPaid"));

        PurchaseDAO dao =
                new PurchaseDAO();
        if(amountPaid <= 0){

            response.sendRedirect(
                "ViewItemsServlet");

            return;
        }
        boolean success =
                dao.purchaseItem(
                        customer.getCid(),
                        itemId,amountPaid);

        response.sendRedirect("ViewItemsServlet");
    }
}