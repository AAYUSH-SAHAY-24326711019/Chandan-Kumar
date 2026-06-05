package com.footwear.servlet.reports;

import java.io.IOException;
import java.util.List;

import com.footwear.service.reports.ReportService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/report-columns")
public class ReportColumnsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final ReportService reportService =
            new ReportService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String tableName =
                    request.getParameter(
                            "tableName");

            List<String> columns =
                    reportService
                            .getColumns(
                                    tableName);

            request.setAttribute(
                    "tableName",
                    tableName);

            request.setAttribute(
                    "columns",
                    columns);

            request.getRequestDispatcher(
                    "/reports/report-columns.jsp")
                    .forward(
                            request,
                            response);

        } catch (Exception e) {

            throw new ServletException(e);
        }
    }
}