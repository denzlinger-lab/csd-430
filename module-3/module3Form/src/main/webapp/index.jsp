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
    <title>Stadium Survey</title>
</head>
<body>
    <h2>MLB Stadium Experience Survey</h2>
    <p>Please complete this form to provide your feedback on your stadium experiences.</p>

    <form action="results.jsp" method="POST">
        <label>Survey Date:</label><br>
        <input type="date" name="surveyDate" required><br><br>

        <label>Your Name:</label><br>
        <input type="text" name="userName" required><br><br>

        <label>Age:</label><br>
        <input type="number" name="userAge" required><br><br>

        <label>Email Address:</label><br>
        <input type="email" name="userEmail" required><br><br>

        <label># of stadiums visited:</label><br>
        <select name="stadiumCount">
            <option value="0">0</option>
            <option value="1-5">Between 1 and 5</option>
            <option value="6-10">Between 6 and 10</option>
            <option value="more than 10">More than 10</option>
        </select><br><br>

        <label>Favorite Stadium:</label><br>
        <input type="text" name="favoriteStadium" required><br><br>

        <label>What makes it your favorite?:</label><br>
        <textarea name="reason" rows="4" cols="30" required></textarea><br><br>

        <input type="submit" value="Submit Survey">
    </form>
</body>
</html>