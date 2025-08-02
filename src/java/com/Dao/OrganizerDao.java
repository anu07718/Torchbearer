package com.Dao;



import com.Bean.OrganizerBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrganizerDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/torchbearer"; // Update with your DB URL
    private String jdbcUsername = "root"; // Update with your DB username
    private String jdbcPassword = "ak12345"; // Update with your DB password

    // Database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Add an organizer
    public boolean registerOrganizer(OrganizerBean organizer) {
        String sql = "INSERT INTO organizers (name, email, password) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, organizer.getName());
            statement.setString(2, organizer.getEmail());
            statement.setString(3, organizer.getPassword()); // Storing password in plain text
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Validate organizer login
    public OrganizerBean loginOrganizer(String email, String password) {
        String sql = "SELECT * FROM organizers WHERE email = ? AND password = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                OrganizerBean organizer = new OrganizerBean();
                organizer.setId(resultSet.getInt("id"));
                organizer.setName(resultSet.getString("name"));
                organizer.setEmail(resultSet.getString("email"));
                organizer.setPassword(resultSet.getString("password")); // Still in plain text
                return organizer;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Invalid login
    }
}
  