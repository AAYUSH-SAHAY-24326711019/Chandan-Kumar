<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="CustomerRegisterServlet" method="post">

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


</form>
</body>
</html>