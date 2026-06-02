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
<title>Customer Dashboard</title>
<link rel="stylesheet" href="css_files/generic_styles.css">
</head>
<body>
<!-- 
<h2>Customer Dashboard</h2>

Welcome :
<b><%--= customer.getCname() --%></b>

<br><br>

Customer ID :
<%--= customer.getCid() --%>

<br><br>

Mobile :
<%--= customer.getCmobile() --%>

<br><br>

<a href="LogoutServlet">Logout</a>
 -->
 
 <div class="card">

    <h2>Customer Dashboard</h2>

    <div class="welcome">
        Welcome,
        <span class="welcome-name">
            <%= customer.getCname() %>
        </span>
    </div>

    <div class="info-box">

        <div class="info-row">
            <span class="label">Customer ID</span>
            <span class="value">
                <%= customer.getCid() %>
            </span>
        </div>

        <div class="info-row">
            <span class="label">Mobile Number</span>
            <span class="value">
                <%= customer.getCmobile() %>
            </span>
        </div>

    </div>

    <a class="logout-btn" href="LogoutServlet">
        Logout
    </a>

</div>
</body>
</html>