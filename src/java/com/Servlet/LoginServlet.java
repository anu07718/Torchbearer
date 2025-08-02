package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    // JDBC URL, username and password of MySQL server
    private static final String DB_URL = "jdbc:mysql://localhost:3306/torchbearer";
    private static final String USER = "root"; // MySQL username
    private static final String PASS = "ak12345"; // MySQL password

    // JDBC variables for opening and managing connection
    private Connection connection;

    @Override
    public void init() throws ServletException {
        // Initialize database connection
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database connection problem", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            if (rs.next()) {
                out.println("<h3>Login successful!</h3>");
            } else {
                out.println("<h3>Invalid credentials!</h3>");
            }
        } catch (SQLException e) {
            throw new ServletException("Error while logging in", e);
        }
    }

    @Override
    public void destroy() {
        // Close database connection
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
