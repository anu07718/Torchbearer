<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout - Torchbearer</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
            color: #fff;
        }
        body {
            background: url('your-background-image.jpg') no-repeat center center fixed;
            background-size: cover;
            background-color: #0d47a1;
            position: relative;
            font-family: 'Arial', sans-serif;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
        }
        .container {
            position: relative;
            z-index: 1;
            background: rgba(13, 71, 161, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
        }
        .title {
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
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
    <div class="overlay"></div>
    <div class="container">
        <h1 class="title">Logout</h1>
        <p class="message">You have been logged out successfully!</p>
        <!-- Redirects to traveller.jsp after logout -->
        <button class="button" onclick="window.location.href='traveller.jsp'">Back to Traveller Home</button>
    </div>
</body>
</html>
