/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

/**
 *
 * @author skota
 */



import com.Bean.EventBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDao {
    private Connection connection;

    public EventDao(Connection connection) {
        this.connection = connection;
    }

    // Fetch all events
    public List<EventBean> getAllEvents() throws SQLException {
        List<EventBean> events = new ArrayList<>();
        String query = "SELECT * FROM events";
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(query);

        while (rs.next()) {
            EventBean event = new EventBean();
            event.setId(rs.getInt("id"));
            event.setTitle(rs.getString("title"));
            event.setDate(rs.getString("date"));
            event.setTime(rs.getString("time"));
            event.setHighlights(rs.getString("highlights"));
            event.setAvailability(rs.getString("availability"));
            event.setLocation(rs.getString("location"));
            events.add(event);
        }
        return events;
    }

    // Book an event by updating the availability status
    public boolean bookEvent(int eventId) throws SQLException {
        String query = "UPDATE events SET availability = 'Booked' WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, eventId);
        return ps.executeUpdate() > 0;
    }

    // Like an event
    public boolean likeEvent(int eventId) throws SQLException {
        String query = "UPDATE events SET likes = likes + 1 WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, eventId);
        return ps.executeUpdate() > 0;
    }

    // Add a comment to an event
    public boolean addComment(int eventId, String comment) throws SQLException {
        String query = "INSERT INTO comments(event_id, comment_text) VALUES (?, ?)";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, eventId);
        ps.setString(2, comment);
        return ps.executeUpdate() > 0;
    }
}
