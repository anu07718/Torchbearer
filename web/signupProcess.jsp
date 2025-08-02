<%-- 
    Document   : signupProcess
    Created on : 16 Oct 2024, 11:37:23 am
    Author     : BHOOMI
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    String username = request.getParameter("travelerUsername");
    String email = request.getParameter("travelerEmail");
    String password = request.getParameter("travelerPassword");
    String userType = "traveler"; // Default to traveler

    // Check if userType is 'organizer'
    if (request.getParameter("organizerUsername") != null) {
        username = request.getParameter("organizerUsername");
        email = request.getParameter("organizerEmail");
        password = request.getParameter("organizerPassword");
        userType = "organizer";
    }

    String dbURL = "jdbc:mysql://localhost:3306/torchbearer";
    String dbUser = "root";
    String dbPass = "lab306b";

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Check if the username or email already exists
        ps = conn.prepareStatement("SELECT COUNT(*) FROM users WHERE username = ? OR email = ?");
        ps.setString(1, username);
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next() && rs.getInt(1) > 0) {
            out.println("<h1>Username or email already exists. Please try again.</h1>");
        } else {
            // Insert new user into the database
            ps = conn.prepareStatement("INSERT INTO users (username, email, password, user_type) VALUES (?, ?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password); // Store plain text password
            ps.setString(4, userType);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<h1>Signup successful! You can now <a href='index.jsp'>login</a>.</h1>");
            } else {
                out.println("<h1>Signup failed. Please try again.</h1>");
            }
        }
    } catch (SQLException e) {
        out.println("<h1>An error occurred: " + e.getMessage() + "</h1>");
        // Consider logging the exception here
    } catch (Exception e) {
        out.println("<h1>An unexpected error occurred.</h1>");
        // Consider logging the exception here
    } finally {
        if (ps != null) try { ps.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
