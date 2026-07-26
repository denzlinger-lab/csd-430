<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Result</title>
</head>
<body>
    <h1>Update Movie Record Result</h1>
    
    <jsp:useBean id="myDB" class="database.DbBean" />
    
    <%
        String idStr = request.getParameter("id");
        String title = request.getParameter("title");
        String yearStr = request.getParameter("year");
        String studio = request.getParameter("studio");
        String director = request.getParameter("director");
        String genre = request.getParameter("genre");
        
        if (idStr != null && title != null && yearStr != null && studio != null && director != null && genre != null) {
            try {
                int id = Integer.parseInt(idStr.trim());
                int year = Integer.parseInt(yearStr.trim());
                
                boolean success = myDB.updateRecord(id, title.trim(), year, studio.trim(), director.trim(), genre.trim());
                if (success) {
                    out.print("<h3>Record updated successfully:</h3>");
                    out.print(myDB.getRecordWithTypesHtml(id));
                } else {
                    out.print("<p><strong>Error: Could not update the record.</strong></p>");
                }
            } catch (NumberFormatException e) {
                out.print("<p><strong>Error: Invalid year or key format.</strong></p>");
            } catch (Exception e) {
                out.print("<p><strong>Error: " + e.getMessage() + "</strong></p>");
            }
        } else {
            out.print("<p><strong>Error: Missing parameter data.</strong></p>");
        }
    %>
    
    <br/><br/>
    <a href="addUpdateMovie.jsp">Back to Add/Update Page</a> | 
    <a href="index.jsp">Back to Index</a>
</body>
</html>
