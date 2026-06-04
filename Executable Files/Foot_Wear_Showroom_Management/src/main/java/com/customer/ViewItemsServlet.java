package com.customer;


import java.io.IOException;
import java.util.List;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.dao.*;

@WebServlet("/ViewItemsServlet")
public class ViewItemsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        ItemDAO dao = new ItemDAO();

        List<Item> items = dao.getAllItems();
        Customer customer =
        	    (Customer)request.getSession()
        	                     .getAttribute("customer");

        	List<Item> purchasedItems =
        	    dao.getPurchasedItems(
        	        customer.getCid());
        	request.setAttribute(
        		    "purchasedItems",
        		    purchasedItems);

        request.setAttribute("items", items);

        request.getRequestDispatcher("customerDashboard.jsp")
               .forward(request, response);
    }
}