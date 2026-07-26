<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Movie Records</title>
</head>
<body>
    <h1>Delete Movie Records</h1>
    
    <jsp:useBean id="myDB" class="database.DbBean" />
    
    <h3>Current Movies:</h3>
    <%= myDB.readAll() %>
    
    <br/>
    <%= myDB.getDeleteDropdownMenu("deleteMovieResult.jsp") %>
    
    <br/><br/>
    <a href="index.jsp">Back to Index</a>
</body>
</html>
