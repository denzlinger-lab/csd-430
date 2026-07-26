<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Movie Record</title>
</head>
<body>
    <h1>Edit Movie Record</h1>
    
    <jsp:useBean id="myDB" class="database.DbBean" />
    
    <%
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            out.println("<p>Error: No record selected.</p>");
            out.println("<a href='addUpdateMovie.jsp'>Back to Add/Update Page</a>");
            return;
        }
        
        int id = Integer.parseInt(idStr.trim());
        Map<String, String> movie = myDB.getRecordMap(id);
        
        if (movie.isEmpty()) {
            out.println("<p>Error: Movie with ID " + id + " not found.</p>");
            out.println("<a href='addUpdateMovie.jsp'>Back to Add/Update Page</a>");
            return;
        }
    %>
    
    <form action="updateMovieResult.jsp" method="POST">
        <%-- Hidden input to pass the ID to the update processing page --%>
        <input type="hidden" name="id" value="<%= movie.get("id") %>">
        
        <table>
            <tr>
                <td>Movie ID (Key):</td>
                <td><strong><%= movie.get("id") %></strong> (Key field - Non-Updatable)</td>
            </tr>
            <tr>
                <td><label for="title">Movie Title:</label></td>
                <td><input type="text" id="title" name="title" value="<%= movie.get("Title") %>" required></td>
            </tr>
            <tr>
                <td><label for="year">Release Year:</label></td>
                <td><input type="number" id="year" name="year" min="1800" max="2100" value="<%= movie.get("Year") %>" required></td>
            </tr>
            <tr>
                <td><label for="genre">Genre:</label></td>
                <td><input type="text" id="genre" name="genre" value="<%= movie.get("Genre") %>" required></td>
            </tr>
            <tr>
                <td><label for="studio">Production Studio:</label></td>
                <td><input type="text" id="studio" name="studio" value="<%= movie.get("Studio") %>" required></td>
            </tr>
            <tr>
                <td><label for="director">Director:</label></td>
                <td><input type="text" id="director" name="director" value="<%= movie.get("Director") %>" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update Record"></td>
            </tr>
        </table>
    </form>
    
    <br/><br/>
    <a href="addUpdateMovie.jsp">Back to Add/Update Page</a>
</body>
</html>
