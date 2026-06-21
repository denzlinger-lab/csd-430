<%--
  Abram Denzlinger
  June 21, 2026
  Module 3.2 Assignment
  File: results.jsp
  Description: Displays the survey form to the user.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Survey Results</title>
    <style>
        table { border-collapse: collapse; width: 70%; margin-top: 20px; }
        th, td { border: 1px solid #333; padding: 10px; text-align: left; }
        th { background-color: #f4f4f4; }
    </style>
</head>
<body>
    <h2>Submission Received</h2>
    <p>Thank you for participating. Below is a summary of the data provided.</p>

    <%
        // Scriptlet: Retrieve all form fields using request.getParameter
        String surveyDate = request.getParameter("surveyDate");
        String name = request.getParameter("userName");
        String age = request.getParameter("userAge");
        String email = request.getParameter("userEmail");
        String count = request.getParameter("stadiumCount");
        String favStadium = request.getParameter("favoriteStadium");
        String reason = request.getParameter("reason");
    %>

    <table>
        <tr>
            <th>Field Description</th>
            <th>User Provided Data</th>
        </tr>
        <tr>
            <td>Survey Date</td>
            <td><%= surveyDate %></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><%= name %></td>
        </tr>
        <tr>
            <td>Age</td>
            <td><%= age %></td>
        </tr>
        <tr>
            <td>Email Address</td>
            <td><%= email %></td>
        </tr>
        <tr>
            <td>Number of Stadiums Visited</td>
            <td><%= count %></td>
        </tr>
        <tr>
            <td>Favorite Stadium</td>
            <td><%= favStadium %></td>
        </tr>
        <tr>
            <td>Reason for Preference</td>
            <td><%= reason %></td>
        </tr>
    </table>

    <br>
    <a href="index.jsp">Back to Form</a>
</body>
</html>