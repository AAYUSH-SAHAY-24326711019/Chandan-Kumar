<%@ page import="com.customer.Customer" %>

<%
Customer customer =
    (Customer)session.getAttribute("customer");

if(customer == null){
    response.sendRedirect("customerLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>

<h2>Customer Dashboard</h2>

Welcome :
<b><%= customer.getCname() %></b>

<br><br>

Customer ID :
<%= customer.getCid() %>

<br><br>

Mobile :
<%= customer.getCmobile() %>

<br><br>

<a href="LogoutServlet">Logout</a>

</body>
</html>