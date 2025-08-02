<%-- 
    Document   : createEvent
    Created on : 25 Oct 2024, 7:28:31 am
    Author     : skota
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Event - Torchbearer</title>
    <style>
        body {
            background: url('images/UploadEventbg.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
        }
        .event-form {
            background: rgba(44, 62, 80, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-top: 15px;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            color: black; /* Black text for input visibility */
        }
        button {
            background: #3498db;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            width: 100%;
        }
        .hidden {
            display: none;
        }
        .status-message {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
        }
        .success {
            background-color: #2ecc71;
            color: white;
        }
        .error {
            background-color: #e74c3c;
            color: white;
        }
    </style>
</head>
<body>
    <div class="event-form">
        <h2>Create New Event</h2>
        
        <form id="eventForm" action="submitEvent" method="POST" enctype="multipart/form-data">
            <!-- Part 1 -->
            <div id="part1">
                <label for="event-name">Event Name:</label>
                <input type="text" id="event-name" name="eventName" required>

                <label for="location">Location:</label>
                <input type="text" id="location" name="location" required>
                <button type="button" id="locate-btn">Use My Location</button>

                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>

                <label for="time">Time:</label>
                <input type="time" id="time" name="time" required>

                <button type="button" id="next-btn">Next</button>
            </div>

            <!-- Part 2 -->
            <div id="part2" class="hidden">
                <label for="upload">Upload Image:</label>
                <input type="file" id="upload" name="eventImage" accept="image/*">

                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4" required></textarea>

                <label for="highlights">Highlights:</label>
                <textarea id="highlights" name="highlights" rows="2" placeholder="Important details..."></textarea>

                <button type="submit">Create Event</button>
                <button type="button" id="back-btn">Back</button>
            </div>
        </form>

        <!-- Display the event status message if set -->
        <%
            String eventStatus = (String) request.getAttribute("eventStatus");
            if (eventStatus != null) {
                if (eventStatus.equals("success")) {
        %>
            <div class="status-message success">
                Event created successfully!
            </div>
        <%
                } else if (eventStatus.equals("error")) {
        %>
            <div class="status-message error">
                Event creation failed! Please try again.
            </div>
        <%
                }
            }
        %>
    </div>

    <script>
        document.getElementById('next-btn').addEventListener('click', function() {
            document.getElementById('part1').classList.add('hidden');
            document.getElementById('part2').classList.remove('hidden');
        });

        document.getElementById('back-btn').addEventListener('click', function() {
            document.getElementById('part2').classList.add('hidden');
            document.getElementById('part1').classList.remove('hidden');
        });

        document.getElementById('locate-btn').addEventListener('click', function() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    const lat = position.coords.latitude;
                    const lon = position.coords.longitude;

                    fetch(`https://nominatim.openstreetmap.org/reverse?lat=${lat}&lon=${lon}&format=json`)
                        .then(response => response.json())
                        .then(data => {
                            document.getElementById('location').value = data.display_name || `Lat: ${lat}, Lon: ${lon}`;
                        })
                        .catch(error => {
                            console.error('Error fetching location:', error);
                            document.getElementById('location').value = `Lat: ${lat}, Lon: ${lon}`;
                        });
                }, function() {
                    alert('Unable to retrieve your location.');
                });
            } else {
                alert('Geolocation is not supported by this browser.');
            }
        });
    </script>
</body>
</html>
