<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.messages.Enquiry" %>

<html>
<head>

    <title>Customer Messages</title>

    <style>

        body{
            font-family: Arial;
            padding:20px;
            background:#f5f5f5;
        }

        table{
            width:100%;
            border-collapse:collapse;
            background:white;
        }

        th,td{
            border:1px solid #ddd;
            padding:12px;
            text-align:left;
        }

        th{
            background:black;
            color:white;
        }

        tr:nth-child(even){
            background:#f2f2f2;
        }

        .pagination{
            margin-top:20px;
        }

        .pagination a{
            padding:8px 14px;
            background:black;
            color:white;
            text-decoration:none;
            margin-right:5px;
        }

    </style>

</head>

<body>

<h2>Customer Enquiries</h2>

<table>

    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Message</th>
        <th>Date Time</th>
    </tr>

<%

List<Enquiry> messages =
        (List<Enquiry>) request.getAttribute("messages");

for(Enquiry e : messages){

%>

<tr>

    <td><%= e.getEnquiry_id() %></td>
    <td><%= e.getUser_type() %></td>
    <td><%= e.getEmail() %></td>
    <td><%= e.getMessage() %></td>
    <td><%= e.getDateTime() %></td>

</tr>

<%
}
%>

</table>

<div class="pagination">

<%

int currentPage =
        (Integer) request.getAttribute("currentPage");

int totalPages =
        (Integer) request.getAttribute("totalPages");

for(int i=1;i<=totalPages;i++){

%>

<a href="messages/?page=<%= i %>">
    <%= i %>
</a>

<%
}
%>

</div>

</body>
</html>