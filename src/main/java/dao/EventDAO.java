package dao;

import model.EventModel;
import utils.DBConnectionUtil;

import java.sql.*;
import java.util.List;

public class EventDAO {

    // Method to create a new event.
    public static int addEvent(EventModel event) {
        String query = "INSERT INTO Events (name, description, location, date, time, category) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, event.getName());
            ps.setString(2, event.getDescription());
            ps.setString(3, event.getLocation());
            ps.setString(4, event.getDate());
            ps.setString(5, event.getTime());
            ps.setString(6, event.getCategory());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    event.setId(rs.getInt(1));
                }
            }
        }
        catch (SQLException e) {
            System.out.println("Error adding event: " + e.getMessage());
            System.err.println("Error adding event: " + e.getMessage());
        }
        return -1;
    }

    // Method to delete event
    public static boolean deleteEvent(int id) {
        String query = "DELETE FROM Events WHERE id = ?";
        try (Connection connection = DBConnectionUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        }
        catch (SQLException e) {
            System.out.println("Error deleting event: " + e.getMessage());
            System.err.println("Error deleting event: " + e.getMessage());
        }
        return false;
    }

    // Method to get event by ID.
    public static EventModel getEventById(int id) {
        String query = "SELECT * FROM Events WHERE id = ?";
        try (Connection connection = DBConnectionUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                EventModel event = new EventModel();
            }
        }
        catch (SQLException e) {
            System.out.println("Error getting event by ID: " + e.getMessage());
            System.err.println("Error getting event by ID: " + e.getMessage());
        }
        return null;
    }

    // Method to list all the events.
    public static List<EventModel> listEvents() {
        List<EventModel> events = new java.util.ArrayList<>();
        String query = "SELECT * FROM Events";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EventModel event = mapEvent(rs);
                events.add(event);
            }
        }
        catch (SQLException e) {
            System.out.println("Error listing events: " + e.getMessage());
            System.err.println("Error listing events: " + e.getMessage());
        }
        return events;
    }

    // Method to map ResultSet to event.
    private static EventModel mapEvent(ResultSet rs) throws SQLException {
        EventModel event = new EventModel();
        event.setId(rs.getInt("id"));
        event.setName(rs.getString("name"));
        event.setDescription(rs.getString("description"));
        event.setLocation(rs.getString("location"));
        event.setDate(rs.getString("date"));
        event.setTime(rs.getString("time"));
        event.setCategory(rs.getString("category"));

        return event;
    }
}
