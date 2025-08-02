<%-- 
    Document   : Role
    Created on : 18 Oct 2024, 8:22:59 pm
    Author     : BHOOMI
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Torchbearer - Role Selection</title>
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
        .wrapper {
            position: relative;
            width: 1000px;
            max-width: 90%;
            border: 3px solid #00ffff;
            box-shadow: 0 0 50px 0 #00a6bc;
            padding: 40px;
            border-radius: 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .title {
            font-size: 35px;
            margin-bottom: 20px;
        }
        .role-button {
            margin: 15px 10px;
            padding: 15px 25px;
            font-size: 18px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            background: linear-gradient(45deg, #0ef, #c800ff);
            color: #fff;
            text-decoration: none;
            transition: background 0.3s, transform 0.2s;
        }
        .role-button:hover {
            background: linear-gradient(45deg, #c800ff, #0ef);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <h1 class="title">Are You a Traveller or Organizer?</h1>
        <a href="traveller.jsp" class="role-button">Traveller</a>
        <a href="organizer.jsp" class="role-button">Organizer</a>
    </div>
</body>
</html>
