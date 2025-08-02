<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Torchbearer</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
            color: #fff;
        }
        body {
            background: url('images/aboutusbg.jpg') no-repeat center center fixed; /* Background image */
            background-size: cover; /* Cover the entire viewport */
        }
        .container {
            background: rgba(13, 71, 161, 0.9); /* Blue theme */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            max-width: 800px;
            margin: 50px auto;
        }
        .title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
        }
        .tab {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .tab button {
            background: none;
            border: none;
            color: #00ffff;
            cursor: pointer;
            font-size: 18px;
            transition: border-bottom 0.3s;
        }
        .tab button.active {
            border-bottom: 2px solid #00ffff;
        }
        .section {
            display: none;
        }
        .section.active {
            display: block;
        }
        .mission {
            margin: 20px 0;
            text-align: center;
        }
        .feedback-container {
            background: rgba(13, 71, 161, 0.8); /* Blue theme */
            padding: 20px;
            border-radius: 10px;
            margin: 20px auto;
            width: 90%;
        }
        .info {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #1e88e5; /* Blue input field */
            color: #fff;
        }
        .save-button {
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
        .save-button:hover {
            background: #00a6bc;
        }
        .social-links {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .social-links a {
            margin: 0 10px;
            color: #00ffff;
            text-decoration: none;
        }
    </style>
    <script>
        function showSection(section) {
            document.querySelectorAll('.section').forEach((el) => {
                el.classList.remove('active');
            });
            document.getElementById(section).classList.add('active');

            document.querySelectorAll('.tab button').forEach((btn) => {
                btn.classList.remove('active');
            });
            document.querySelector(`button[data-target="${section}"]`).classList.add('active');
        }

        window.onload = function() {
            showSection('missionSection');
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="title">About Us</h1>
       
        <div class="tab">
            <button data-target="missionSection" onclick="showSection('missionSection')" class="active">Our Mission & Story</button>
            <button data-target="feedbackSection" onclick="showSection('feedbackSection')">Feedback</button>
        </div>

        <div id="missionSection" class="section active">
            <h2>Our Mission</h2>
            <div class="mission">
                <p>At Torchbearer, our mission is to explore and showcase the hidden gems of Maharashtra and beyond.</p>
                <p>We aim to connect travelers with unique experiences, creating unforgettable memories along the way.</p>
            </div>
            <h2>Our Story & Aspirations</h2>
            <div class="mission">
                <p>Torchbearer was born from a passion for travel and a desire to uncover the lesser-known destinations in Maharashtra.</p>
                <p>Founded recently, we have set out on a journey to not only explore these hidden gems but to also empower organizers and travelers alike.</p>
                <p>Our aspiration is to create a community where everyone can share their unique travel experiences and inspire others to explore the beauty of Maharashtra and beyond.</p>
            </div>
            <!-- Fake Social Media Links -->
            <div class="social-links">
                <a href="https://www.facebook.com/fakeTorchbearer" target="_blank">Facebook</a>
                <a href="https://www.twitter.com/fakeTorchbearer" target="_blank">Twitter</a>
                <a href="https://www.instagram.com/fakeTorchbearer" target="_blank">Instagram</a>
                <a href="https://www.linkedin.com/company/fakeTorchbearer" target="_blank">LinkedIn</a>
            </div>
        </div>

        <div id="feedbackSection" class="section">
            <div class="feedback-container">
                <h2>We Value Your Feedback!</h2>
                <form action="submitFeedback.jsp" method="post">
                    <div class="info">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" required />
                    </div>
                    <div class="info">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required />
                    </div>
                    <div class="info">
                        <label for="comments">Feedback:</label>
                        <textarea id="comments" name="comments" required></textarea>
                    </div>
                    <button type="submit" class="save-button">Submit Feedback</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
