package dao;

import model.UserModel;
import org.mindrot.jbcrypt.BCrypt;
import utils.DBConnectionUtil;
import utils.HashPasswordUtil;

import java.sql.*;

public class UserDAO {

    // Method to create a new user.
    public static int addUser(UserModel user) {

        // Hashing the password before storing.
        String password = user.getPassword();
        String hashedPassword = HashPasswordUtil.hashPassword(password);
        user.setPassword(hashedPassword);

        String query = "INSERT INTO Users (fullName, username, email, password, role) VALUES (?,?,?,?,?)";
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getRole());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    user.setId(rs.getInt(1));
                }
            }
        }
        catch (SQLException e) {
            System.out.println("Error adding user: " + e.getMessage());
            System.err.println("Error adding user: " + e.getMessage());
        }
        return -1;
    }

    // Method to check if email already exists.
    public static boolean checkEmailExists(String email) {
        String query = "SELECT * FROM Users WHERE email = ?";
        try (Connection connection = DBConnectionUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        }
        catch (SQLException e) {
            System.out.println("Error checking email: " + e.getMessage());
            System.err.println("Error checking email: " + e.getMessage());
        }
        return false;
    }

    // Method to delete user.
    public static boolean deleteUser(int id) {
        String query = "DELETE FROM Users WHERE id = ?";
        try (Connection connection = DBConnectionUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        }
        catch (SQLException e) {
            System.out.println("Error deleting user: " + e.getMessage());
            System.err.println("Error deleting user: " + e.getMessage());
        }
        return false;
    }

    // Method to get user by email.
    public static UserModel getUserByEmail(String email) {
        String query = "SELECT * FROM Users WHERE email = ?";
        try (Connection connection = DBConnectionUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                UserModel user = new UserModel();
            }
        }
        catch (SQLException e) {
            System.out.println("Error finding user by email: " + e.getMessage());
            System.err.println("Error finding user by email: " + e.getMessage());
        }
        return null;
    }

    // Method to get user by ID.
    public static UserModel getUserById(int id) {
        String query = "SELECT * FROM Users WHERE id = ?";
        try (Connection connection = DBConnectionUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserModel user = new UserModel();
            }
        }
        catch (SQLException e) {
            System.out.println("Error finding user by ID: " + e.getMessage());
            System.err.println("Error finding user by ID: " + e.getMessage());
        }
        return null;
    }

    // Method for authenticating the user.
    public static UserModel validateUser(String email, String username, String password) {
        String query = "SELECT * FROM Users WHERE email = ? AND username = ? AND password = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, username);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("password");

                // Checking if the password matches hashed password or not.
                if (HashPasswordUtil.checkPassword(password, hashedPassword)) {
                    UserModel user = new UserModel();
                    user.setId(rs.getInt("id"));
                    user.setFullName(rs.getString("fullName"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getString("role"));
                    user.setPassword(null);
                    return user;
                }
            }
        }
        catch (SQLException e) {
            System.out.println("Error validating user: " + e.getMessage());
            System.err.println("Error validating user: " + e.getMessage());
        }
        // Return null if authentication fails.
        return null;
    }
}
