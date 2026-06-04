package com.footwearshowroom.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.dao.LogisticsDAO;
import com.footwearshowroom.dto.ContractStatusDTO;
import com.footwearshowroom.dto.LogisticCompanyDTO;
import com.footwearshowroom.dto.PaginationResponse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/logistics")
public class LogisticsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private LogisticsDAO dao = new LogisticsDAO();
    private Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {

            request.getRequestDispatcher(
                    "/WEB-INF/views/ManageLogistics.jsp")
                    .forward(request, response);
            return;
        }

        switch (action) {

        case "statuses":
            loadStatuses(response);
            break;

        case "list":
            loadLogistics(request, response);
            break;

        case "getById":
            getById(request, response);
            break;

        default:
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {

        case "add":
            addLogistic(request, response);
            break;

        case "update":
            updateLogistic(request, response);
            break;

        case "delete":
            deleteLogistic(request, response);
            break;

        default:
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void loadStatuses(HttpServletResponse response)
            throws IOException {

        List<ContractStatusDTO> list =
                dao.getAllStatuses();

        response.setContentType("application/json");

        response.getWriter()
                .write(gson.toJson(list));
    }

    private void loadLogistics(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int page = Integer.parseInt(
                request.getParameter("page"));

        String search =
                request.getParameter("search");

        if (search == null)
            search = "";

        int limit = 10;
        int offset = (page - 1) * limit;

        List<LogisticCompanyDTO> list =
                dao.getLogistics(
                        offset,
                        limit,
                        search);

        int total =
                dao.getTotalCount(search);

        PaginationResponse result =
                new PaginationResponse();

        result.setData(list);
        result.setTotal(total);

        response.setContentType("application/json");

        response.getWriter()
                .write(gson.toJson(result));
    }

    private void getById(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(
                request.getParameter("id"));

        LogisticCompanyDTO dto =
                dao.getById(id);

        response.setContentType("application/json");

        response.getWriter()
                .write(gson.toJson(dto));
    }

    private void addLogistic(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        LogisticCompanyDTO dto =
                new LogisticCompanyDTO();

        dto.setLogisticCompany(
                request.getParameter(
                        "logisticCompany"));

        dto.setContractStart(
                request.getParameter(
                        "contractStart"));

        dto.setContractEndDate(
                request.getParameter(
                        "contractEndDate"));

        dto.setStatusId(
                Integer.parseInt(
                        request.getParameter(
                                "statusId")));

        boolean success =
                dao.addLogistic(dto);

        writeResult(response, success);
    }

    private void updateLogistic(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        LogisticCompanyDTO dto =
                new LogisticCompanyDTO();

        dto.setId(
                Integer.parseInt(
                        request.getParameter("id")));

        dto.setLogisticCompany(
                request.getParameter(
                        "logisticCompany"));

        dto.setContractStart(
                request.getParameter(
                        "contractStart"));

        dto.setContractEndDate(
                request.getParameter(
                        "contractEndDate"));

        dto.setStatusId(
                Integer.parseInt(
                        request.getParameter(
                                "statusId")));

        boolean success =
                dao.updateLogistic(dto);

        writeResult(response, success);
    }

    private void deleteLogistic(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(
                request.getParameter("id"));

        boolean success =
                dao.deleteLogistic(id);

        writeResult(response, success);
    }

    private void writeResult(
            HttpServletResponse response,
            boolean success)
            throws IOException {

        response.setContentType("text/plain");

        PrintWriter out =
                response.getWriter();

        out.print(success ? "success" : "fail");
    }
}