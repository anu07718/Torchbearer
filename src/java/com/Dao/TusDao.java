/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

/**
 *
 * @author skota
 */
import com.Bean.TusBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TusDao {
    private Connection connection;

    // Constructor
    public TusDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/torchbearer", "root", "ak12345");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error connecting to database: " + e.getMessage());
        }
    }

    // Method to add feedback
    public void addFeedback(TusBean tus) {
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO feedback (name, email, feedback) VALUES (?, ?, ?)");
            statement.setString(1, tus.getName());
            statement.setString(2, tus.getEmail());
            statement.setString(3, tus.getFeedback());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error adding feedback: " + e.getMessage());
        }
    }

    // Method to get feedback
    public List<TusBean> getFeedback() {
        List<TusBean> feedbackList = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM feedback");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                TusBean tus = new TusBean();
                tus.setId(resultSet.getInt("id"));
                tus.setName(resultSet.getString("name"));
                tus.setEmail(resultSet.getString("email"));
                tus.setFeedback(resultSet.getString("feedback"));
                feedbackList.add(tus);
            }
        } catch (SQLException e) {
            System.out.println("Error getting feedback: " + e.getMessage());
        }
        return feedbackList;
    }
}