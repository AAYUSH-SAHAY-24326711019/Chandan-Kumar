package com.footwear.servlet.reports;

import java.io.IOException;
import java.util.List;

import com.footwear.service.reports.ReportService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reports")
public class ReportsHomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final ReportService reportService =
            new ReportService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<String> tables =
                    reportService.getAllTables();

            request.setAttribute(
                    "tableList",
                    tables);

            request.getRequestDispatcher(
                    "/reports/reports-home.jsp")
                    .forward(
                            request,
                            response);

        } catch (Exception e) {

            throw new ServletException(e);
        }
    }
}