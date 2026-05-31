<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>
</head>
<body>

<h2>Customer Login</h2>

<form action="CustomerLoginServlet" method="post">

    Customer ID:
    <input type="number" name="cid" required>
    <br><br>

    Mobile:
    <input type="text" name="mobile" required>
    <br><br>

    <input type="submit" value="Login">

</form>

</body>
</html>