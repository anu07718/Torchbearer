<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Organizer Dashboard - Torchbearer</title>
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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            justify-content: center;
            align-items: center;
            overflow-y: auto;
            position: relative;
            padding-top: 20px;
            padding-bottom: 40px;
        }
        .hero {
            background: rgba(44, 62, 80, 0.9);
            padding: 40px 30px;
            text-align: center; /* Center aligns all text inside the hero */
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            margin-bottom: 30px;
            width: 100%;
            max-width: 1000px;
            display: flex;
            flex-direction: column; /* Stacks items vertically */
            align-items: center; /* Centers items horizontally */
        }
        .hero img {
            width: 50px; /* Reduced icon size */
            margin-bottom: 10px;
        }
        .hero h1 {
            font-size: 36px; /* Adjusted font size */
            text-shadow: 0 0 15px rgba(0, 255, 255, 0.8);
            color: #f39c12;
            margin: 0;
        }
        .hero p {
            font-size: 18px;
            margin-top: 5px;
            opacity: 0.9;
        }
        .container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            position: relative;
            z-index: 1;
        }
        .card {
            background: rgba(52, 152, 219, 0.8);
            border-radius: 15px;
            width: 350px;
            height: auto;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            padding: 15px;
            position: relative;
            overflow: hidden;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 30px rgba(52, 152, 219, 1);
        }
        .card img {
            width: 60%;
            height: auto;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        .card h3 {
            margin: 10px 0;
            font-size: 24px;
            color: #fff;
        }
        .card p {
            margin-bottom: 15px;
            font-size: 16px;
            color: #ecf0f1;
        }
        .card a {
            display: inline-block;
            padding: 10px 15px;
            background: #fff;
            color: #3498db;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s, color 0.3s;
            font-weight: bold;
            margin-top: 10px;
        }
        .card a:hover {
            background: #3498db;
            color: #fff;
        }
        footer {
            background: rgba(0, 0, 0, 0.8);
            text-align: center;
            padding: 10px;
            width: 100%;
            font-size: 14px;
            position: relative;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="hero">
        <img src="images/icon.png" alt="Torchbearer Icon"> <!-- Centered icon -->
        <h1>Torchbearer</h1> <!-- Centered title -->
        <p>Welcome, Organizer!</p>
        <p>Your dashboard for managing events efficiently.</p>
    </div>
    <div class="container">
        <div class="card">
            <img src="images/Upload Event.jpg" alt="Upload Event">
            <h3>Upload Event</h3>
            <p>Submit your upcoming events for approval.</p>
            <a href="Uploadevent.jsp">Upload Now</a>
        </div>
        <div class="card">
            <img src="images/settings.jpg" alt="Profile and Settings">
            <h3>Profile & Settings</h3>
            <p>Manage your profile and adjust settings.</p>
            <a href="profilesetting.jsp">Profile & Settings</a>
        </div>
        <div class="card">
            <img src="images/Aboutus.jpg" alt="About Us">
            <h3>About Us</h3>
            <p>Learn more about Torchbearer and our mission to support organizers like you!</p>
            <a href="Aboutus.jsp">Read More</a>
        </div>
    </div>
</body>
</html>
