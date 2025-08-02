<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eateries - Torchbearer</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Body and Basic Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #0a1128;
            color: #ffffff;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        header {
            background-color: #0d47a1;
            padding: 20px;
            text-align: center;
        }

        h1 {
            color: #ffffff;
            margin: 0;
            font-size: 36px;
        }

        .eateries-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px;
            padding: 20px;
            background-color: #1e3a8a;
            border-radius: 10px;
            max-height: 70vh; /* Limit height for scrolling */
            overflow-y: auto; /* Enable vertical scrolling */
        }

        .eatery-card {
            background-color: #0d47a1;
            border-radius: 10px;
            padding: 15px;
            margin: 15px;
            width: calc(45% - 30px);
            box-shadow: 0 4px 10px rgba(0, 255, 255, 0.3), 0 0 20px rgba(0, 255, 255, 0.5);
            transition: transform 0.2s, box-shadow 0.2s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .eatery-card:hover {
            transform: scale(1.03);
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.8);
        }

        .eatery-img {
            width: 100%;
            height: 150px;
            border-radius: 10px;
            object-fit: cover;
        }

        .eatery-name {
            font-size: 24px;
            margin: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .eatery-details {
            margin: 10px 0;
        }

        .special-offer {
            color: #ffeb3b;
            font-weight: bold;
            margin: 5px 0;
        }

        .location-map {
            margin: 15px 0;
            border: 1px solid #ffffff;
            border-radius: 10px;
            overflow: hidden;
        }

        iframe {
            width: 100%;
            height: 100px;
            border: none;
        }

        .reserve-btn, .cancel-btn {
            background-color: #ffeb3b;
            color: #0d47a1;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s;
        }

        .reserve-btn:hover, .cancel-btn:hover {
            background-color: #fdd835;
        }

        footer {
            background-color: #0d47a1;
            color: white;
            padding: 20px;
            text-align: center;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.7);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #1e3a8a;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 400px;
            border-radius: 10px;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #ffffff;
            text-decoration: none;
            cursor: pointer;
        }

        .error {
            color: red;
            margin: 10px 0;
        }

        /* Comment Input Styles */
        .comment-section {
            display: flex;
            margin-top: 10px;
        }

        .comment-input {
            flex-grow: 1;
            padding: 5px;
            border: none;
            border-radius: 5px;
            margin-right: 5px;
        }

        .comment-btn {
            background-color: #ffeb3b;
            color: #0d47a1;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding: 5px 10px;
        }

        .comment-btn:hover {
            background-color: #fdd835;
        }

        .comments-list {
            margin-top: 10px;
            width: 100%;
            list-style-type: none;
            padding: 0;
        }

        .comment-item {
            background-color: #2a2d34;
            margin: 5px 0;
            padding: 10px;
            border-radius: 5px;
        }

        .like-btn {
            background-color: transparent;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #ffeb3b;
            transition: color 0.3s;
        }

        .liked {
            color: pink;
        }
    </style>
</head>
<body>

<header>
    <h1>Eateries in Mumbai</h1>
</header>

<div class="eateries-section">
    <!-- Eatery 1 -->
    <div class="eatery-card">
        <img src="images/Spice Route.jpg" alt="Trishna" class="eatery-img">
        <div class="eatery-name">
            Trishna
            <button class="like-btn" onclick="likeEvent('Trishna', this)">❤️</button>
        </div>
        <div class="eatery-details">Famous Dish: Coastal Cuisine</div>
        <div class="eatery-details">Speciality: Seafood Delights</div>
        <div class="eatery-details">Timings: 12:00 PM - 12:00 AM</div>
        <div class="special-offer">Special Offer: 10% off on seafood dishes!</div>
        <div class="location-map">
            <iframe src="https://www.google.com/maps/embed?pb=..."></iframe>
        </div>
        <button class="reserve-btn" onclick="openModal('Trishna')">Reserve a Table</button>
        <button class="cancel-btn" onclick="cancelReservation('Trishna')">Cancel Reservation</button>
        <div class="comment-section">
            <input type="text" class="comment-input" placeholder="Leave a comment...">
            <button class="comment-btn" onclick="postComment('Trishna')">Post</button>
        </div>
        <ul class="comments-list" id="comments-Trishna"></ul>
    </div>

    <!-- Eatery 2 -->
    <div class="eatery-card">
        <img src="images/sagarratna.jpg" alt="Sagar Ratna" class="eatery-img">
        <div class="eatery-name">
            Sagar Ratna
            <button class="like-btn" onclick="likeEvent('Sagar Ratna', this)">❤️</button>
        </div>
        <div class="eatery-details">Famous Dish: Dosa</div>
        <div class="eatery-details">Speciality: South Indian Dishes</div>
        <div class="eatery-details">Timings: 7:00 AM - 11:00 PM</div>
        <div class="special-offer">Special Offer: Free chutney with every dosa!</div>
        <div class="location-map">
            <iframe src="https://www.google.com/maps/embed?pb=..."></iframe>
        </div>
        <button class="reserve-btn" onclick="openModal('Sagar Ratna')">Reserve a Table</button>
        <button class="cancel-btn" onclick="cancelReservation('Sagar Ratna')">Cancel Reservation</button>
        <div class="comment-section">
            <input type="text" class="comment-input" placeholder="Leave a comment...">
            <button class="comment-btn" onclick="postComment('Sagar Ratna')">Post</button>
        </div>
        <ul class="comments-list" id="comments-Sagar Ratna"></ul>
    </div>

    <!-- Eatery 3 -->
    <div class="eatery-card">
        <img src="images/cheesecake.jpg" alt="Cheesecake Factory" class="eatery-img">
        <div class="eatery-name">
            Cheesecake Factory
            <button class="like-btn" onclick="likeEvent('Cheesecake Factory', this)">❤️</button>
        </div>
        <div class="eatery-details">Famous Dish: Cheesecake</div>
        <div class="eatery-details">Speciality: Desserts</div>
        <div class="eatery-details">Timings: 11:00 AM - 11:00 PM</div>
        <div class="special-offer">Special Offer: 20% off on all cheesecakes!</div>
        <div class="location-map">
            <iframe src="https://www.google.com/maps/embed?pb=..."></iframe>
        </div>
        <button class="reserve-btn" onclick="openModal('Cheesecake Factory')">Reserve a Table</button>
        <button class="cancel-btn" onclick="cancelReservation('Cheesecake Factory')">Cancel Reservation</button>
        <div class="comment-section">
            <input type="text" class="comment-input" placeholder="Leave a comment...">
            <button class="comment-btn" onclick="postComment('Cheesecake Factory')">Post</button>
        </div>
        <ul class="comments-list" id="comments-Cheesecake Factory"></ul>
    </div>

    <!-- Eatery 4 -->
    <div class="eatery-card">
        <img src="images/burgerjoint.jpg" alt="Burger Joint" class="eatery-img">
        <div class="eatery-name">
            Burger Joint
            <button class="like-btn" onclick="likeEvent('Burger Joint', this)">❤️</button>
        </div>
        <div class="eatery-details">Famous Dish: Burgers</div>
        <div class="eatery-details">Speciality: Gourmet Burgers</div>
        <div class="eatery-details">Timings: 10:00 AM - 12:00 AM</div>
        <div class="special-offer">Special Offer: Buy one get one free on all burgers!</div>
        <div class="location-map">
            <iframe src="https://www.google.com/maps/embed?pb=..."></iframe>
        </div>
        <button class="reserve-btn" onclick="openModal('Burger Joint')">Reserve a Table</button>
        <button class="cancel-btn" onclick="cancelReservation('Burger Joint')">Cancel Reservation</button>
        <div class="comment-section">
            <input type="text" class="comment-input" placeholder="Leave a comment...">
            <button class="comment-btn" onclick="postComment('Burger Joint')">Post</button>
        </div>
        <ul class="comments-list" id="comments-Burger Joint"></ul>
    </div>
</div>

<!-- Modal for Reservation -->
<div id="reservationModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Reserve a Table</h2>
        <div id="reservationError" class="error"></div>
        <input type="date" id="dateInput" placeholder="Date">
        <input type="time" id="timeInput" placeholder="Time">
        <input type="number" id="peopleInput" placeholder="Number of People" min="1">
        <button onclick="confirmReservation()">Confirm Reservation</button>
    </div>
</div>

<footer>
    <p>&copy; 2024 Torchbearer. All rights reserved.</p>
</footer>

<script>
    let currentEatery = '';

    function openModal(eatery) {
        currentEatery = eatery; // Store the current eatery
        document.getElementById('reservationModal').style.display = "block";
    }

    function closeModal() {
        document.getElementById('reservationModal').style.display = "none";
        document.getElementById('dateInput').value = '';
        document.getElementById('timeInput').value = '';
        document.getElementById('peopleInput').value = '';
        document.getElementById('reservationError').innerText = '';
    }

    function confirmReservation() {
        const date = document.getElementById('dateInput').value;
        const time = document.getElementById('timeInput').value;
        const people = document.getElementById('peopleInput').value;
        if (date === '' || time === '' || people === '') {
            document.getElementById('reservationError').innerText = 'Please fill in all fields.';
        } else {
            alert(`Reservation confirmed for ${people} people on ${date} at ${time} for ${currentEatery}!`);
            closeModal();
        }
    }

    function likeEvent(eatery, btn) {
        btn.classList.toggle('liked');
        alert(`${eatery} liked!`);
    }

    function postComment(eatery) {
        const commentInput = document.querySelector(`#comments-${eatery.replace(' ', '-')}`);
        const commentText = commentInput.previousElementSibling.value;
        if (commentText) {
            const commentItem = document.createElement('li');
            commentItem.className = 'comment-item';
            commentItem.innerText = commentText;
            commentInput.appendChild(commentItem);
            commentInput.previousElementSibling.value = ''; // Clear input
        }
    }

    function cancelReservation(eatery) {
        alert(`Reservation at ${eatery} has been canceled.`);
        // Additional logic to update the UI can be added here
    }
</script>

</body>
</html>
