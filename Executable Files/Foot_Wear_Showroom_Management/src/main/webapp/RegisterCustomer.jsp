<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css_files/generic_styles.css">
</head>
<body>

<!--<form action="CustomerRegisterServlet" method="post">

     <input
        type="text"
        name="mobile"
        maxlength="14"
        placeholder="Enter Mobile Number"
        required>
        <br>
    <input
        type="text"
        name="cname"
        maxlength="14"
        placeholder="Enter Your Name"
        required>

    <button type="submit">
        Continue
    </button> 


</form>-->

<div class="card">

    <h1>Customer Registration</h1>
    <p class="subtitle">
        Enter your details to continue
    </p>

    <form action="CustomerRegisterServlet" method="post">

        <div class="form-group">
            <input
                type="text"
                name="mobile"
                maxlength="14"
                placeholder="Enter Mobile Number"
                required>
        </div>

        <div class="form-group">
            <input
                type="text"
                name="cname"
                maxlength="40"
                placeholder="Enter Your Name"
                required>
        </div>

        <button class="btn" type="submit">
            Continue
        </button>

    </form>

</div>
</body>
</html>