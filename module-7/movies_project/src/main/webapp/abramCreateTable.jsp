<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><title>Create Table</title></head>
<body>
    <h1>Create abram_movies_data Table</h1>
    <jsp:useBean id='setupDB' class='configBean.ConfigProject' />
    
    <%
        try {
            out.print(setupDB.createTable());
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    %>
    <br/><br/><a href="index.jsp">Back to Index</a>
</body>
</html>