/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

/**
 *
 * @author skota
 */

import com.Bean.TeateryBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeateryDao {
    private Connection connection;

    public TeateryDao(Connection connection) {
        this.connection = connection;
    }

    public TeateryBean getEateryById(int eateryId) throws SQLException {
        String query = "SELECT * FROM eateries WHERE eatery_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, eateryId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                TeateryBean eatery = new TeateryBean();
                eatery.setEateryId(rs.getInt("eatery_id"));
                eatery.setName(rs.getString("name"));
                eatery.setFamousDish(rs.getString("famous_dish"));
                eatery.setSpecialty(rs.getString("specialty"));
                eatery.setTimings(rs.getString("timings"));
                eatery.setSpecialOffer(rs.getString("special_offer"));
                eatery.setLocationUrl(rs.getString("location_url"));
                // Add comments and liked status handling if needed
                return eatery;
            }
        }
        return null;
    }

    public List<TeateryBean> getAllEateries() throws SQLException {
        List<TeateryBean> eateries = new ArrayList<>();
        String query = "SELECT * FROM eateries";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                TeateryBean eatery = new TeateryBean();
                eatery.setEateryId(rs.getInt("eatery_id"));
                eatery.setName(rs.getString("name"));
                eatery.setFamousDish(rs.getString("famous_dish"));
                eatery.setSpecialty(rs.getString("specialty"));
                eatery.setTimings(rs.getString("timings"));
                eatery.setSpecialOffer(rs.getString("special_offer"));
                eatery.setLocationUrl(rs.getString("location_url"));
                eateries.add(eatery);
            }
        }
        return eateries;
    }

    public void addComment(int eateryId, String comment) throws SQLException {
        String query = "INSERT INTO eatery_comments (eatery_id, comment) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, eateryId);
            stmt.setString(2, comment);
            stmt.executeUpdate();
        }
    }

    // Other methods for reservation, liking, and canceling
}
