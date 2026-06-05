package com.footwear.servlet.reports;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.footwear.dto.reports.ReportRequestDTO;
import com.footwear.service.reports.ReportService;
import com.footwear.utility.reports.PdfGeneratorUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/generate-report")
public class GeneratePdfReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final ReportService reportService =
            new ReportService();

    private final PdfGeneratorUtil pdfUtil =
            new PdfGeneratorUtil();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            ReportRequestDTO dto =
                    new ReportRequestDTO();

            dto.setTableName(
                    request.getParameter(
                            "tableName"));

            String[] cols =
                    request.getParameterValues(
                            "selectedColumns");

            dto.setSelectedColumns(
                    Arrays.asList(cols));

            dto.setOrientation(
                    request.getParameter(
                            "orientation"));

            dto.setSortColumn(
                    request.getParameter(
                            "sortColumn"));

            dto.setSortOrder(
                    request.getParameter(
                            "sortOrder"));

            dto.setShowForeignKeys(
                    request.getParameter(
                            "showForeignKeys")
                            != null);

            String rowMode =
                    request.getParameter(
                            "rowMode");

            if ("all".equals(rowMode)) {

                dto.setAllRows(true);

            } else {

                dto.setAllRows(false);

                dto.setRowLimit(
                        Integer.parseInt(
                                request.getParameter(
                                        "rowLimit")));
            }

            List<Map<String, Object>> reportData =
                    reportService.getReportData(
                            dto);

            String generatedPdfPath =
                    pdfUtil.generatePdf(
                            dto.getTableName(),
                            dto.getOrientation(),
                            reportData);

            request.setAttribute(
                    "pdfPath",
                    generatedPdfPath);

            request.setAttribute(
                    "totalRecords",
                    reportData.size());

            request.getRequestDispatcher(
                    "/reports/report-success.jsp")
                    .forward(
                            request,
                            response);

        } catch (Exception e) {

            throw new ServletException(e);
        }
    }
}