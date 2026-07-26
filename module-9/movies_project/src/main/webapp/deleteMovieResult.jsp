<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Movie - Confirmation</title>
</head>
<body>
    <h1>Delete Movie Records</h1>
    
    <jsp:useBean id="myDB" class="database.DbBean" />
    
    <%
        String idStr = request.getParameter("id");
        String deleteMessage = "";
        
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                deleteMessage = myDB.delete(id);
            } catch (NumberFormatException e) {
                deleteMessage = "Error: Invalid Movie ID format.";
            }
        }
    %>
    
    <% if (!deleteMessage.isEmpty()) { %>
        <p><strong><%= deleteMessage %></strong></p>
    <% } %>
    
    <h3>Remaining Movies:</h3>
    <%= myDB.readAll() %>
    
    <br/>
    <%= myDB.getDeleteDropdownMenu("deleteMovieResult.jsp") %>
    
    <br/><br/>
    <a href="index.jsp">Back to Index</a>
</body>
</html>
