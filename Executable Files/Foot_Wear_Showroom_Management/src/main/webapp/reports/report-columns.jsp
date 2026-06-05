<%@page import="java.util.List"%>
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Generate Report</title>

<style>

body{
    font-family:Arial;
    margin:30px;
}

.section{
    border:1px solid #ddd;
    padding:15px;
    margin-bottom:15px;
}

.column-box{
    display:inline-block;
    width:250px;
    margin-bottom:8px;
}

</style>

</head>

<body>

<%

String tableName =
(String)request.getAttribute(
        "tableName");

List<String> columns =
(List<String>)request.getAttribute(
        "columns");

%>

<h2>

Generate Report :
<%=tableName%>

</h2>

<form action="<%=request.getContextPath()%>/generate-report"
method="post">

<input type="hidden"
name="tableName"
value="<%=tableName%>">

<div class="section">

<h3>Select Columns</h3>

<%

for(String col : columns){

%>

<div class="column-box">

<label>

<input type="checkbox"
name="selectedColumns"
value="<%=col%>"
checked>

<%=col%>

</label>

</div>

<%
}
%>

</div>

<div class="section">

<h3>Orientation</h3>

<label>

<input type="radio"
name="orientation"
value="portrait">

Portrait

</label>

<br>

<label>

<input type="radio"
name="orientation"
value="landscape"
checked>

Landscape

</label>

</div>

<div class="section">

<h3>Sort Column</h3>

<select name="sortColumn">

<%
for(String col : columns){
%>

<option value="<%=col%>">
<%=col%>
</option>

<%
}
%>

</select>

<br><br>

<label>

<input type="radio"
name="sortOrder"
value="ASC"
checked>

Ascending

</label>

<br>

<label>

<input type="radio"
name="sortOrder"
value="DESC">

Descending

</label>

</div>

<div class="section">

<h3>Rows</h3>

<label>

<input type="radio"
name="rowMode"
value="all"
checked>

All Rows

</label>

<br>

<label>

<input type="radio"
name="rowMode"
value="limited">

Limited Rows

</label>

<br><br>

<input type="number"
name="rowLimit"
value="100"
min="1">

</div>

<div class="section">

<label>

<input type="checkbox"
name="showForeignKeys"
value="true"
checked>

Show FK Display Values

</label>

</div>

<button type="submit">

Generate PDF Report

</button>

</form>

</body>

</html>