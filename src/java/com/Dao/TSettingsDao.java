package com.Dao;

import com.Bean.TSettingsBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TSettingsDao {
    // Database connection details
    private final String jdbcURL = "jdbc:mysql://localhost:3306/torchbearer";
    private final String jdbcUsername = "root";
   private final String jdbcPassword = "ak12345";

    // Establish a database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Method to save traveller info
    public boolean saveTravellerInfo(TSettingsBean traveller) {
        String insertQuery = "INSERT INTO travellers (username, email, phone, location) VALUES (?, ?, ?, ?)";
        
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
            
            // Set parameters
            preparedStatement.setString(1, traveller.getUsername());
            preparedStatement.setString(2, traveller.getEmail());
            preparedStatement.setString(3, traveller.getPhone());
            preparedStatement.setString(4, traveller.getLocation());
            
            // Execute update
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
