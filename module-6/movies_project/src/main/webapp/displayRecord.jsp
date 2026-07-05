<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><title>View Movie Record</title></head>
<body>
    <h1>Record Details</h1>
    
    <jsp:useBean id='myDB' class='database.DbBean' />
    
    <%
        // Retrieve the ID from the form submission
        String idParam = request.getParameter("id");
        int id = Integer.parseInt(idParam);
        
        // Output the specific record
        out.print(myDB.getRecordById(id));
    %>
    
    <br /><br /><a href="selectRecord.jsp">Back to Selection</a>
</body>
</html>