package configBean;

import java.sql.*;

public class ConfigProject {
    // Database connection details
    private String connectionURL = "jdbc:mysql://localhost:3306/CSD430";
    private String dbUser = "student1";
    private String dbPass = "pass";

    public String createTable() {
        try {
            // Explicitly load the driver to ensure the runtime finds it
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPass);
                 Statement stmt = conn.createStatement()) {
                
                String sql = "CREATE TABLE IF NOT EXISTS abram_movies_data (" +
                             "id INT AUTO_INCREMENT PRIMARY KEY, " +
                             "Title VARCHAR(100) NOT NULL, " +
                             "Year INT, " +
                             "Studio VARCHAR(100), " +
                             "Director VARCHAR(100), " +
                             "Genre VARCHAR(50))";
                
                stmt.executeUpdate(sql);
                return "Table 'abram_movies_data' created successfully!";
            }
        } catch (ClassNotFoundException e) {
            return "Error: MySQL Driver not found. Ensure the JAR is in WEB-INF/lib.";
        } catch (SQLException e) {
            return "Database Error: " + e.getMessage();
        }
    }
}