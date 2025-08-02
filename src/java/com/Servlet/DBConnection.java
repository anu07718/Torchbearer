/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Servlet;

/**
 *
 * @author BHOOMI
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;

public class DBConnection {

    private static Connection conn = null;

    // Method to get a connection to the database
    public static Connection getConnection() throws SQLException {
        if (conn == null) {
            try {
                // Load database properties from db.properties file
                Properties props = new Properties();
                InputStream inputStream = DBConnection.class.getClassLoader().getResourceAsStream("db.properties");
                props.load(inputStream);

                // Get properties from the file
                String dbUrl = props.getProperty("jdbc:mysql://localhost:3306/torchbearer");
                String dbUsername = props.getProperty("root");
                String dbPassword = props.getProperty("ak12345");
                String driverClass = props.getProperty("db.driverClass");

                // Load JDBC driver
                Class.forName(driverClass);

                // Establish the connection
                conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
            } catch (Exception e) {
                e.printStackTrace();
                throw new SQLException("Failed to connect to the database", e);
            }
        }
        return conn;
    }

    // Method to close the connection (Optional)
    public static void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
