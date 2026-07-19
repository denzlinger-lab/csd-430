<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><title>Populate Table</title></head>
<body>
    <h1>Populate abram_movies_data</h1>
    <jsp:useBean id='myDB' class='database.DbBean' />
    
    <%
        out.print(myDB.populateTable());
    %>
    <br/><br/><a href="index.jsp">Back to Index</a>
</body>
</html>