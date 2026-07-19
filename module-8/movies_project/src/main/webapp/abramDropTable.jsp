<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><title>Drop Table</title></head>
<body>
    <h1>Drop abram_movies_data Table</h1>
    <jsp:useBean id='myDB' class='database.DbBean' />
    
    <%
        out.print(myDB.dropTable());
    %>
    <br/><br/><a href="index.jsp">Back to Index</a>
</body>
</html>