<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>
<link rel="stylesheet" href="css_files/generic_styles.css">
</head>
<!-- 
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

</body>-->
<body>

<div class="card">

    <h1>Customer Login</h1>

    <p class="subtitle">
        Login using your Customer ID and Mobile Number
    </p>

    <form action="CustomerLoginServlet" method="post">

        <div class="form-group">
            <input
                type="number"
                name="cid"
                placeholder="Enter Customer ID"
                required>
        </div>

        <div class="form-group">
            <input
                type="text"
                name="mobile"
                placeholder="Enter Mobile Number"
                required>
        </div>

        <button class="btn" type="submit">
            Login
        </button>

    </form>

</div>

</body>
</html>