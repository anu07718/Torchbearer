<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile and Settings - Torchbearer</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
            color: #fff;
        }
        body {
            background: url('images/profilebg.jpg') no-repeat center center fixed; /* Background image */
            background-size: cover;
            position: relative;
        }
        .container {
            position: relative;
            z-index: 1;
            background: rgba(44, 62, 80, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 600px;
            margin: 50px auto; /* Centering the container */
        }
        .title {
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
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
        .info {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #34495e;
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
        }
        .save-button:hover {
            background: #00a6bc;
        }
        .logout-button {
            background: #ff4757;
            border: none;
            padding: 15px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            transition: background 0.3s;
        }
        .logout-button:hover {
            background: #ff6b81;
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
            showSection('profileInfo');
        }

        function confirmLogout() {
            if (confirm("Are you sure you want to logout?")) {
                window.location.href = 'logout.jsp'; // Redirect to logout page
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="title">Profile and Settings</h1>
       
        <div class="tab">
            <button data-target="profileInfo" onclick="showSection('profileInfo')" class="active">Profile</button>
            <button data-target="changePassword" onclick="showSection('changePassword')">Change Password</button>
        </div>

        <div id="profileInfo" class="section active">
            <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
                <div class="info">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="CurrentUsername" required />
                </div>
                <div class="info">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="CurrentEmail@example.com" required />
                </div>
                <div class="info">
                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" value="CurrentPhoneNumber" />
                </div>
                <button type="submit" class="save-button">Save Profile</button>
            </form>
        </div>

        <div id="changePassword" class="section">
            <form action="updatePassword.jsp" method="post">
                <div class="info">
                    <label for="currentPassword">Current Password:</label>
                    <input type="password" id="currentPassword" name="currentPassword" required />
                </div>
                <div class="info">
                    <label for="newPassword">New Password:</label>
                    <input type="password" id="newPassword" name="newPassword" required />
                </div>
                <div class="info">
                    <label for="confirmNewPassword">Confirm New Password:</label>
                    <input type="password" id="confirmNewPassword" name="confirmNewPassword" required />
                </div>
                <button type="submit" class="save-button">Change Password</button>
            </form>
        </div>

        <button class="logout-button" onclick="confirmLogout()">Logout</button>
    </div>
</body>
</html>
