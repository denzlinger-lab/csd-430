package database;

import java.sql.*;

public class DbBean {
    private String connectionURL = "jdbc:mysql://localhost:3306/CSD430";
    private String dbUser = "student1";
    private String dbPass = "pass";

    // Helper method to establish a connection
    private Connection getConnection() throws SQLException {
        try {
            // Force the driver to load
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // If this prints, your JAR is still not seen by the runtime
            throw new SQLException("MySQL Driver not found in classpath!", e);
        }
        return DriverManager.getConnection(connectionURL, dbUser, dbPass);
    }

    // CREATE: Adds a new movie record
    public void createRecord(String title, int year, String studio, String director, String genre) {
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO abram_movies_data (Title, Year, Studio, Director, Genre) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setInt(2, year);
            pstmt.setString(3, studio);
            pstmt.setString(4, director);
            pstmt.setString(5, genre);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // READ: Fetches all records and returns an HTML table string
    public String readAll() {
        StringBuilder sb = new StringBuilder("<table border='1'><thead><tr><th>ID</th><th>Title</th><th>Year</th><th>Studio</th><th>Director</th><th>Genre</th></tr></thead><tbody>");
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM abram_movies_data")) {
            
            while (rs.next()) {
                sb.append("<tr><td>").append(rs.getInt("id")).append("</td>")
                  .append("<td>").append(rs.getString("Title")).append("</td>")
                  .append("<td>").append(rs.getInt("Year")).append("</td>")
                  .append("<td>").append(rs.getString("Studio")).append("</td>")
                  .append("<td>").append(rs.getString("Director")).append("</td>")
                  .append("<td>").append(rs.getString("Genre")).append("</td></tr>");
            }
        } catch (SQLException e) {
            return "Error: " + e.getMessage();
        }
        sb.append("</tbody></table>");
        return sb.toString();
    }

    // DELETE: Removes a record by ID
    public String delete(int id) {
        try (Connection conn = getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM abram_movies_data WHERE id = ?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            return "Record " + id + " deleted successfully.";
        } catch (SQLException e) {
            return "Error: " + e.getMessage();
        }
    }
    
    // POPULATE: enters records into the table
    public String populateTable() {
        String[][] movies = {
            {"Reservoir Dogs", "1992", "Miramax", "Quentin Tarantino", "Crime"},
            {"Pulp Fiction", "1994", "Miramax", "Quentin Tarantino", "Crime"},
            {"Jackie Brown", "1997", "Miramax Films", "Quentin Tarantino", "Crime"},
            {"Kill Bill: Volume 1", "2003", "Miramax Films", "Quentin Tarantino", "Crime"},
            {"Kill Bill: Volume 2", "2004", "Miramax Films", "Quentin Tarantino", "Crime"},
            {"Death Proof", "2007", "The Weinstein Company", "Quentin Tarantino", "Crime"},
            {"Inglourious Basterds", "2009", "The Weinstein Company / Universal Pictures", "Quentin Tarantino", "Crime"},
            {"Django Unchained", "2012", "The Weinstein Company / Sony Pictures Releasing", "Quentin Tarantino", "Crime"},
            {"The Hateful Eight", "2015", "The Weinstein Company", "Quentin Tarantino", "Crime"},
            {"Once Upon a Time... in Hollywood", "2019", "Sony Pictures Releasing", "Quentin Tarantino", "Crime"}
        };

        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO abram_movies_data (Title, Year, Studio, Director, Genre) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
            for (String[] movie : movies) {
                pstmt.setString(1, movie[0]);
                pstmt.setInt(2, Integer.parseInt(movie[1]));
                pstmt.setString(3, movie[2]);
                pstmt.setString(4, movie[3]);
                pstmt.setString(5, movie[4]);
                pstmt.executeUpdate();
            }
            return "Table populated with 10 records successfully.";
        } catch (SQLException e) {
            return "Error: " + e.getMessage();
        }
    }
    
    // DROP: removes table from the database
    public String dropTable() {
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement()) {
            stmt.executeUpdate("DROP TABLE IF EXISTS abram_movies_data");
            return "Table dropped successfully.";
        } catch (SQLException e) { return "Error: " + e.getMessage(); }
    }
    
 // Generates the HTML dropdown menu for the selection form
    public String getDropdownMenu() {
        StringBuilder sb = new StringBuilder("<form action='displayRecord.jsp' method='POST'>");
        sb.append("<label for='id'>Select a Movie ID: </label>");
        sb.append("<select name='id'>");
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT id, Title FROM abram_movies_data")) {
            
            while (rs.next()) {
                sb.append("<option value='").append(rs.getInt("id")).append("'>")
                  .append(rs.getInt("id")).append(" - ").append(rs.getString("Title"))
                  .append("</option>");
            }
        } catch (SQLException e) { return "Error: " + e.getMessage(); }
        
        sb.append("</select>");
        sb.append("<input type='submit' value='View Record'>");
        sb.append("</form>");
        return sb.toString();
    }

    // Fetches a single record based on the ID for the display table
    public String getRecordById(int id) {
        StringBuilder sb = new StringBuilder("<table border='1'><thead><tr><th>ID</th><th>Title</th><th>Year</th><th>Studio</th><th>Director</th><th>Genre</th></tr></thead><tbody>");
        try (Connection conn = getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM abram_movies_data WHERE id = ?");
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                sb.append("<tr><td>").append(rs.getInt("id")).append("</td>")
                  .append("<td>").append(rs.getString("Title")).append("</td>")
                  .append("<td>").append(rs.getInt("Year")).append("</td>")
                  .append("<td>").append(rs.getString("Studio")).append("</td>")
                  .append("<td>").append(rs.getString("Director")).append("</td>")
                  .append("<td>").append(rs.getString("Genre")).append("</td></tr>");
            } else {
                sb.append("<tr><td colspan='6'>No record found.</td></tr>");
            }
        } catch (SQLException e) { return "Error: " + e.getMessage(); }
        sb.append("</tbody></table>");
        return sb.toString();
    }
}