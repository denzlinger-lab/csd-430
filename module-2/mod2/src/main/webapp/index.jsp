<%--
  Abram Denzlinger
  June 13, 2026
  Assignment 2.2 - Java Scriptlet - Data Display
 
  This is a web-based application built as a dynamic Java web project to 
  display a curated list of films directed by Quentin Tarantino.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Details</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Quentin Tarantino Filmography</h1>
    <p>This dataset provides a comprehensive list of feature films directed by 
       Quentin Tarantino, including their release years and primary distributors.</p>

    <%
        // Scriptlet: Java data storage
        String[][] movies = {
            {"Reservoir Dogs", "1992", "Miramax Films / Live Entertainment"},
            {"Pulp Fiction", "1994", "Miramax Films"},
            {"Jackie Brown", "1997", "Miramax Films"},
            {"Kill Bill: Volume 1", "2003", "Miramax Films"},
            {"Kill Bill: Volume 2", "2004", "Miramax Films"},
            {"Death Proof", "2007", "The Weinstein Company"},
            {"Inglourious Basterds", "2009", "The Weinstein Company / Universal Pictures"},
            {"Django Unchained", "2012", "The Weinstein Company / Sony Pictures Releasing"},
            {"The Hateful Eight", "2015", "The Weinstein Company"},
            {"Once Upon a Time... in Hollywood", "2019", "Sony Pictures Releasing"}
        };
    %>

    <table>
        <thead>
            <tr>
                <th>Movie Title</th>
                <th>Year</th>
                <th>Studio / Distributor</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Scriptlet: Iteration logic
                for (int i = 0; i < movies.length; i++) {
            %>
            <tr>
                <td><%= movies[i][0] %></td>
                <td><%= movies[i][1] %></td>
                <td><%= movies[i][2] %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>