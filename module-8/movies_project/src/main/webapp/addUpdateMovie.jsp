<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add or Update Movie</title>
</head>
<body>
    <h1>Add New Movie Record</h1>
    
    <jsp:useBean id="myDB" class="database.DbBean" />
    
    <%
        String method = request.getMethod();
        String message = "";
        
        if ("POST".equalsIgnoreCase(method) && request.getParameter("addMovieSubmit") != null) {
            String title = request.getParameter("title");
            String yearStr = request.getParameter("year");
            String studio = request.getParameter("studio");
            String director = request.getParameter("director");
            String genre = request.getParameter("genre");
            
            if (title != null && yearStr != null && studio != null && director != null && genre != null) {
                title = title.trim();
                yearStr = yearStr.trim();
                studio = studio.trim();
                director = director.trim();
                genre = genre.trim();
                
                if (title.isEmpty() || yearStr.isEmpty() || studio.isEmpty() || director.isEmpty() || genre.isEmpty()) {
                    message = "All fields are required. Please fill out the form completely.";
                } else {
                    try {
                        int year = Integer.parseInt(yearStr);
                        myDB.createRecord(title, year, studio, director, genre);
                        message = "Success! Movie '" + title + "' was successfully added to the database.";
                    } catch (NumberFormatException e) {
                        message = "Invalid input: Year must be a valid number.";
                    } catch (Exception e) {
                        message = "Database Error: " + e.getMessage();
                    }
                }
            } else {
                message = "Missing parameters. Please resubmit the form.";
            }
        }
    %>
    
    <% if (!message.isEmpty()) { %>
        <p><strong><%= message %></strong></p>
    <% } %>
    
    <form action="addUpdateMovie.jsp" method="POST">
        <table>
            <tr>
                <td><label for="title">Movie Title:</label></td>
                <td><input type="text" id="title" name="title" required></td>
            </tr>
            <tr>
                <td><label for="year">Release Year:</label></td>
                <td><input type="number" id="year" name="year" min="1800" max="2100" required></td>
            </tr>
            <tr>
                <td><label for="genre">Genre:</label></td>
                <td><input type="text" id="genre" name="genre" required></td>
            </tr>
            <tr>
                <td><label for="studio">Production Studio:</label></td>
                <td><input type="text" id="studio" name="studio" required></td>
            </tr>
            <tr>
                <td><label for="director">Director:</label></td>
                <td><input type="text" id="director" name="director" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="addMovieSubmit" value="Add Movie"></td>
            </tr>
        </table>
    </form>
    
    <h2>Update Existing Movie Record</h2>
    <p>Select a record key to edit its fields:</p>
    <%= myDB.getKeyDropdownMenu() %>
    
    <br/><br/>
    <a href="index.jsp">Back to Index</a>
</body>
</html>
