<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Tarantino Filmography</title></head>
<body>
    <h1>Quentin Tarantino Filmography</h1>
    <p>This table displays a list of films directed by Quentin Tarantino, including production studios and genres.</p>

    <jsp:useBean id="catalog" class="movieList.MovieCatalogBean" scope="request" />

    <table border="1">
        <tr>
            <th>Title</th><th>Year</th><th>Studio</th><th>Director</th><th>Genre</th>
        </tr>

        <%-- Java Scriptlet for iteration --%>
        <% for (movieList.Movie m : catalog.getMovieList()) { %>
            <tr>
                <td><%= m.getTitle() %></td>
                <td><%= m.getYear() %></td>
                <td><%= m.getStudio() %></td>
                <td><%= m.getDirector() %></td>
                <td><%= m.getGenre() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>