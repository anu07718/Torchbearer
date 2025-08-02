<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Torchbearer - Login / Signup</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
            color: #fff;
        }
        body {
            width: 100vw;
            height: 100vh;
            background: #081b29;
            display: grid;
            justify-content: center;
            align-content: center;
        }
        ::-webkit-input-placeholder {
            color: #eee;
        }
        .wrapper {
            position: relative;
            width: 1000px;
            max-width: 90%;
            border: 3px solid #00ffff;
            box-shadow: 0 0 50px 0 #00a6bc;
            padding: 40px;
            border-radius: 15px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            overflow: hidden;
        }
        .form {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .title {
            font-size: 35px;
            margin-bottom: 20px;
        }
        .inp {
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
            margin-bottom: 15px;
            width: 100%;
        }
        .input {
            border: none;
            outline: none;
            background: none;
            width: 100%;
            padding-right: 10px;
            font-size: 17px;
            color: #0ef;
        }
        .submit {
            border: none;
            outline: none;
            width: 100%;
            padding: 15px 0;
            font-size: 20px;
            border-radius: 40px;
            letter-spacing: 1px;
            cursor: pointer;
            background: linear-gradient(45deg, #0ef, #c800ff);
            margin-top: 20px;
        }
        .footer {
            margin-top: 30px;
            font-size: 14px;
        }
        .link {
            color: #0ef;
            text-decoration: none;
        }
        .banner {
            position: absolute;
            top: 0;
            right: 0;
            width: 450px;
            height: 390px;
            background: linear-gradient(to right, #0ef, #c800ff);
            clip-path: polygon(0 0, 100% 0, 100% 100%, 60% 100%);
            padding-right: 70px;
            text-align: right;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-end;
            z-index: -1;
        }
        .wel_text {
            font-size: 40px;
            margin-top: -50px;
            line-height: 50px;
        }
        .para {
            margin-top: 10px;
            font-size: 18px;
            line-height: 24px;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Login Form -->
        <div class="form" id="loginForm">
            <h1 class="title">Login</h1>
            <form action="" method="post">
                <div class="inp">
                    <input type="text" class="input" name="username" placeholder="Username" required>
                </div>
                <div class="inp">
                    <input type="password" class="input" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="submit">Login</button>
            </form>
            <p class="footer">Don't have an account? <a href="javascript:void(0);" class="link" onclick="showSignup()">Signup</a></p>  
        </div>

        <!-- Signup Form -->
        <div class="form" id="signupForm" style="display:none;">
            <h1 class="title">Signup</h1>
            <form method="post">
                <div class="inp">
                    <input type="text" class="input" name="signupUsername" placeholder="Username" required>
                </div>
                <div class="inp">
                    <input type="email" class="input" name="signupEmail" placeholder="Email" required>
                </div>
                <div class="inp">
                    <input type="password" class="input" name="signupPassword" placeholder="Password" required>
                </div>
                <button type="submit" class="submit">Signup</button>
            </form>
            <p class="footer">Already have an account? <a href="javascript:void(0);" class="link" onclick="showLogin()">Login</a></p>  
        </div>

        <div class="banner">
            <h1 class="wel_text">Torchbearer</h1>
            <p class="para">Exploring hidden gems</p>
        </div>
    </div>

    <%
        // Database connection setup
        String jdbcUrl = "jdbc:mysql://localhost:3306/torchbearer";
        String jdbcUsername = "root";
        String jdbcPassword = "ak12345";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String signupUsername = request.getParameter("signupUsername");
        String signupEmail = request.getParameter("signupEmail");
        String signupPassword = request.getParameter("signupPassword");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Create a connection to the database
            conn = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

            // Handle Login
            if (username != null && password != null) {
                String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    // If login is successful, redirect to Role.jsp
                    response.sendRedirect("Role.jsp");
                } else {
                    out.println("<script>alert('Invalid username or password.');</script>");
                }
            }

            // Handle Signup
            if (signupUsername != null && signupEmail != null && signupPassword != null) {
                String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, signupUsername);
                pstmt.setString(2, signupEmail);
                pstmt.setString(3, signupPassword);
                
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Signup successful!');</script>");
                } else {
                    out.println("<script>alert('Signup failed.');</script>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('Database error: " + e.getMessage() + "');</script>");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<script>alert('JDBC Driver not found.');</script>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Unexpected error: " + e.getMessage() + "');</script>");
        } finally {
            // Clean up resources
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>

    <script>
        function showSignup() {
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("signupForm").style.display = "flex";
        }

        function showLogin() {
            document.getElementById("signupForm").style.display = "none";
            document.getElementById("loginForm").style.display = "flex";
        }
    </script>
</body>
</html>
