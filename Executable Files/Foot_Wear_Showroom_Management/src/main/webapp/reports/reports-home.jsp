<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>

<style>

body{
    font-family: Arial;
    margin:30px;
}

table{
    border-collapse:collapse;
    width:100%;
}

th,td{
    border:1px solid #ccc;
    padding:10px;
}

a{
    text-decoration:none;
}

</style>

</head>
<body>

<h2>Available Reports</h2>

<%
List<String> tables =
(List<String>)request.getAttribute("tableList");
%>

<table>

<tr>
    <th>Table Name</th>
    <th>Action</th>
</tr>

<%
if(tables!=null){

for(String table : tables){
%>

<tr>

<td>
<%=table%>
</td>

<td>

<a href="<%=request.getContextPath()%>/report-columns?tableName=<%=table%>">

Open

</a>

</td>

</tr>

<%
}
}
%>

</table>

</body>
</html>