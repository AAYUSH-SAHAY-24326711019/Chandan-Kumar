<%@ page import="com.customer.Customer"%>
<%@ page import="java.util.List"%>
<%@ page import="com.customer.Item"%>
<%@ page import="com.customer.Customer"%>

<%
Customer customer = (Customer) session.getAttribute("customer");

if (customer == null) {
	response.sendRedirect("customerLogin.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="customer_dsb.css">
<script src="customer_dsb.js" defer></script>
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
			Welcome, <span class="welcome-name"> <%=customer.getCname()%>
			</span>
		</div>

		<div class="info-box">

			<div class="info-row">
				<span class="label">Customer ID</span> <span class="value"> <%=customer.getCid()%>
				</span>
			</div>

			<div class="info-row">
				<span class="label">Mobile Number</span> <span class="value">
					<%=customer.getCmobile()%>
				</span>
			</div>

		</div>

		<a class="logout-btn" href="LogoutServlet"> Logout </a>

	</div>
	<%
	List<Item> items = (List<Item>) request.getAttribute("items");
	%>

	<div class="products-section">

		<h2>Available Footwear</h2>

		<div class="product-grid">

			<%
			if (items != null) {

				for (Item item : items) {
			%>

			<div class="product-card">

				<%
				String imageName = item.getImageUrl().replace("item_listing_images/", "");
				%>

				<img src="ImageServlet?file=<%=imageName%>"
					alt="<%=item.getItemName()%>" class="product-image">

				<h3><%=item.getItemName()%></h3>

				<p>
					Size :
					<%=item.getItemSize()%></p>

				<p>
					Price : ₹<%=item.getPrice()%></p>

				<p>
					Stock :
					<%=item.getQuantity()%></p>

				<form action="PurchaseServlet" method="post">

					<input type="hidden" name="itemId" value="<%=item.getId()%>">

					Price : ₹<%=item.getPrice()%>

					<br>
					<br> Amount Paid <input type="number" name="amountPaid"
						step="0.01" min="0" required> <br>
					<br>

					<button type="submit" class="view-btn">Confirm Purchase</button>

				</form>

			</div>

			<%
			}
			}
			%>

		</div>

	</div>
	<%
	List<Item> purchasedItems = (List<Item>) request.getAttribute("purchasedItems");
	%>

	<div class="products-section">

		<h2>My Purchased Shoes</h2>

		<div class="product-grid">

			<%
			if (purchasedItems != null) {

				for (Item item : purchasedItems) {

					String imageName = item.getImageUrl().replace("item_listing_images/", "");
			%>

			<div class="product-card">

				<img src="ImageServlet?file=<%=imageName%>" class="product-image">

				<h3>
					<%=item.getItemName()%>
				</h3>

				<p>
					Price : ₹<%=item.getPrice()%>
				</p>

				<p>
					Paid : ₹<%=item.getAmountPaid()%>
				</p>

				<p>
					Purchased :
					<%=item.getPurchaseDate()%>
				</p>

			</div>

			<%
			}
			}
			%>

		</div>

	</div>
</body>
</html>