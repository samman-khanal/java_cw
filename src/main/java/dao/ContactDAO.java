package dao;

import model.ContactModel;
import utils.DBConnectionUtil;

import java.sql.*;

public class ContactDAO {

    public static int addContact(ContactModel contact) {
        String query = "INSERT INTO Contact (fullName, email, phone, address, message) values (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, contact.getFullName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getPhone());
            ps.setString(4, contact.getAddress());
            ps.setString(5, contact.getMessage());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }
        }
        catch (SQLException e) {
            System.out.println("Error adding contact." + e.getMessage());
            System.err.println("Error adding contact." + e.getMessage());
        }
    return -1;
    }
}
