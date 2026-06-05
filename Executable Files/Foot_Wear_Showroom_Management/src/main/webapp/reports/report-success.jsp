<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Report Generated</title>

<style>

body{
    font-family:Arial;
    margin:30px;
}

.success{
    color:green;
    font-size:20px;
    font-weight:bold;
}

.box{
    border:1px solid #ccc;
    padding:20px;
    margin-top:15px;
}

</style>

</head>

<body>

<div class="success">

Report Generated Successfully

</div>

<div class="box">

<p>

<b>Total Records :</b>

${totalRecords}

</p>

<p>

<b>Saved Location :</b>

</p>

<p>

${pdfPath}

</p>

</div>

<br>

<a href="${pageContext.request.contextPath}/reports">

Generate Another Report

</a>

</body>

</html>