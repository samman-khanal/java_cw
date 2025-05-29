package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtil {

    // Defining the variables for database connection.
    private static final String URL = "jdbc:mysql://localhost:3306/event_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    // Method to establish a database connection.
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        }
        catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver failed to load.", e);
        }
        catch (SQLException e) {
            throw new RuntimeException("Failed to connect to the MySQL database.", e);
        }
    }

    // Main method for debugging purpose.
    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("Database connection is successful.");
            }
            else {
                System.out.println("Database connection is failed.");
            }
        }
        catch (Exception e) {
            System.out.println("Error connecting to the database: " + e);
        }
    }
}
