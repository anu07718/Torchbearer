<%-- 
    Document   : submitFeedback
    Created on : 13 Oct 2024, 10:07:42 pm
    Author     : skota
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Feedback - Torchbearer</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
            color: #fff;
        }
        body {
            background: linear-gradient(135deg, #2c3e50, #bdc3c7);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
        }
        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .container {
            background: rgba(44, 62, 80, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            max-width: 600px;
            margin: 50px auto;
        }
        .title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
        }
        .message {
            font-size: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .button {
            background: #00ffff;
            border: none;
            padding: 15px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
            margin-top: 10px;
        }
        .button:hover {
            background: #00a6bc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Submit Feedback</h1>
        <p class="message">Thank you for submitting your feedback! We appreciate your input and will use it to improve our services.</p>
        <button class="button" onclick="window.location.href='aboutUs.jsp'">Back to About Us</button>
    </div>
</body>
</html>