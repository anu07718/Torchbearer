<%-- 
    Document   : submitEventProcess
    Created on : 23 Oct 2024, 11:17:53 pm
    Author     : skota
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Event - Torchbearer</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        body {
            background: linear-gradient(135deg, #2c3e50, #bdc3c7);
            display: flex;
            flex-direction: column;
            height: 100vh;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
        }
        .hero {
            background: rgba(44, 62, 80, 0.9);
            padding: 60px 30px;
            text-align: center;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            margin-bottom: 30px;
            width: 100%;
            max-width: 1000px;
        }
        .hero img {
            width: 80px;
            margin-bottom: 15px;
        }
        .hero h1 {
            font-size: 48px;
            margin-bottom: 10px;
            text-shadow: 0 0 15px rgba(0, 255, 255, 0.8);
            color: #f39c12;
        }
        .hero p {
            font-size: 20px;
            margin-top: 10px;
            opacity: 0.9;
            color: #fff;
        }
        .container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            padding: 20px;
            position: relative;
            z-index: 1;
        }
        .card {
            background: rgba(52, 152, 219, 0.8);
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 30px rgba(52, 152, 219, 1);
        }
        .card h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #000;
        }
        .card p {
            font-size: 16px;
            margin-bottom: 10px;
            color: #000;
        }
        footer {
            background: rgba(0, 0, 0, 0.8);
            text-align: center;
            padding: 10px;
            width: 100%;
            font-size: 14px;
            position: absolute;
            bottom: 0;
        }
    </style>
</head>
<body>
    <div class="hero">
        <img src="torchbearer-icon.png" alt="Torchbearer Icon"> <!-- Logo path -->
        <h1>Torchbearer</h1> <!-- Website name -->
        <p>Event submitted successfully!</p>
    </div>
    <div class="container">
        <div class="card">
            <h2>Event Details:</h2>
            <p>Event Name: <%= request.getParameter("eventName") %></p>
            <p>Event Description: <%= request.getParameter("eventDescription") %></p>
            <p>Event Date: <%= request.getParameter("eventDate") %></p>
            <p>Event Time: <%= request.getParameter("eventTime") %></p>
            <p>Event Location: <%= request.getParameter("eventLocation") %></p>
        </div>
    </div>
    <footer>
        <p> 2024 Torchbearer. All rights reserved.</p>
    </footer>
</body>
</html>