/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

/**
 *
 * @author skota
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.Servlet.DatabaseConnection;

public class CommentDao {
    public boolean saveComment(String eventId, String comment) {
        String query = "INSERT INTO comments (event_id, comment_text) VALUES (?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, eventId);
            preparedStatement.setString(2, comment);
            int result = preparedStatement.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
