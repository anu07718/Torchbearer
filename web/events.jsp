<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upcoming Events - Torchbearer</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Body and Basic Styling */
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #0a1128; color: #ffffff; margin: 0; padding: 0; }
        header { background-color: #0d47a1; padding: 20px; text-align: center; }
        h1 { color: #ffffff; margin: 0; font-size: 36px; }

        .events-section {
            max-height: 600px;
            overflow-y: auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px;
            padding: 20px;
            background-color: #1e3a8a;
            border-radius: 10px;
        }

        .event-card {
            background-color: #0d47a1;
            border-radius: 10px;
            padding: 15px;
            margin: 15px;
            width: calc(45% - 30px);
            box-shadow: 0 4px 10px rgba(0, 255, 255, 0.5), 0 0 20px rgba(0, 255, 255, 0.5);
            transition: transform 0.2s, box-shadow 0.2s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .event-card:hover { transform: scale(1.03); box-shadow: 0 0 30px rgba(0, 255, 255, 0.8); }
        .event-img { width: 100%; height: 150px; border-radius: 10px; object-fit: cover; }
        .event-title { font-size: 24px; margin: 10px 0; display: flex; align-items: center; }

        .like-icon {
            cursor: pointer;
            width: 24px;
            height: 24px;
            margin-left: 10px;
            transition: color 0.3s;
            color: white; /* Default color */
        }
        .like-icon.liked { color: pink; } /* Color when liked */

        .event-highlights { font-size: 14px; color: #ffeb3b; margin-top: 10px; }
        .event-availability { font-size: 14px; color: #00ff00; margin-top: 5px; }
        .book-button, .cancel-button {
            background-color: #ffeb3b; color: #0a1128; padding: 10px; border: none; border-radius: 5px; cursor: pointer; font-size: 18px; margin-top: 10px;
        }
        .book-button:hover, .cancel-button:hover { background-color: #ffd600; }

        .comments-section { margin-top: 15px; }
        .comment { margin: 5px 0; }
        .comment-input { width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ffffff; border-radius: 5px; background-color: #1e3a8a; color: #ffffff; }
        .submit-comment { margin-top: 10px; }

        /* Modal for Booking Confirmation */
        .modal { display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0, 0, 0, 0.7); }
        .modal-content { background-color: #0d47a1; margin: 15% auto; padding: 20px; border: 1px solid #888; width: 80%; max-width: 400px; border-radius: 10px; color: white; }
        .close { color: #ffffff; float: right; font-size: 28px; font-weight: bold; cursor: pointer; }
        .close:hover { color: #ffeb3b; }

        .cancel-booking {
            background-color: #ff1744;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            margin-top: 10px;
        }
        .cancel-booking:hover { background-color: #f50057; }

        footer { background-color: #0d47a1; color: white; padding: 20px; text-align: center; position: relative; }

        .location-map {
            margin: 15px 0;
            border: 1px solid #ffffff;
            border-radius: 10px;
            overflow: hidden;
        }
        iframe {
            width: 100%;
            height: 100px; /* Adjust height for better view */
            border: none;
        }
    </style>
</head>
<body>

<header>
    <h1>Upcoming Events</h1>
</header>

<div class="events-section">
    <!-- Event Cards -->
    <div class="event-card" data-event-id="kalaghoda">
        <img src="images/kalaghoda.jpg" alt="Kala Ghoda Festival" class="event-img">
        <div class="event-title">
            Kala Ghoda Festival
            <span class="like-icon" onclick="likeEvent('kalaghoda', this)">❤️</span>
        </div>
        <div class="event-details">Date: February 3-11, 2024</div>
        <div class="event-details">Timing: 10:00 AM - 10:00 PM</div>
        <div class="event-highlights">Highlights: Art installations, live performances, food stalls.</div>
        <div class="event-availability">Availability: <span class="availability-status">Available</span></div>
        <div class="location-map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224819.56464827342!2d72.82025144491534!3d19.07609035369613!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c7c5b78cd84b%3A0x6b2b5766b18de5f0!2sKala%20Ghoda!5e0!3m2!1sen!2sin!4v1614282737391!5m2!1sen!2sin" allowfullscreen></iframe>
        </div>
        <button class="book-button" onclick="openModal('Kala Ghoda Festival', 'kalaghoda')">Book Now</button>
        <button class="cancel-button" onclick="cancelBooking('kalaghoda')">Cancel Booking</button>
        <div class="comments-section">
            <textarea class="comment-input" placeholder="Leave a comment..." id="comment-kalaghoda"></textarea>
            <button class="submit-comment" onclick="submitComment('kalaghoda')">Submit Comment</button>
        </div>
    </div>

    <div class="event-card" data-event-id="punefestival">
        <img src="images/punefestival.jpg" alt="Pune International Film Festival" class="event-img">
        <div class="event-title">
            Pune International Film Festival
            <span class="like-icon" onclick="likeEvent('punefestival', this)">❤️</span>
        </div>
        <div class="event-details">Date: January 9-16, 2024</div>
        <div class="event-details">Timing: Varies by screening</div>
        <div class="event-highlights">Highlights: Screenings of international films, Q&A with directors.</div>
        <div class="event-availability">Availability: <span class="availability-status">Available</span></div>
        <div class="location-map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224819.56464827342!2d73.8567!3d18.5204!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c4f84717c2c1%3A0x7ed7e05bcf4a612b!2sPune!5e0!3m2!1sen!2sin!4v1614282834980!5m2!1sen!2sin" allowfullscreen></iframe>
        </div>
        <button class="book-button" onclick="openModal('Pune International Film Festival', 'punefestival')">Book Now</button>
        <button class="cancel-button" onclick="cancelBooking('punefestival')">Cancel Booking</button>
        <div class="comments-section">
            <textarea class="comment-input" placeholder="Leave a comment..." id="comment-punefestival"></textarea>
            <button class="submit-comment" onclick="submitComment('punefestival')">Submit Comment</button>
        </div>
    </div>

    <div class="event-card" data-event-id="mumbaitransit">
        <img src="images/mumbaitransit.jpg" alt="Mumbai Transit" class="event-img">
        <div class="event-title">
            Mumbai Transit
            <span class="like-icon" onclick="likeEvent('mumbaitransit', this)">❤️</span>
        </div>
        <div class="event-details">Date: December 1-3, 2024</div>
        <div class="event-details">Timing: 9:00 AM - 6:00 PM</div>
        <div class="event-highlights">Highlights: Transport systems exhibition, panel discussions, workshops.</div>
        <div class="event-availability">Availability: <span class="availability-status">Available</span></div>
        <div class="location-map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224819.56464827342!2d72.8777!3d19.076!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c7c5b78cd84b%3A0x6b2b5766b18de5f0!2sMumbai!5e0!3m2!1sen!2sin!4v1614282737391!5m2!1sen!2sin" allowfullscreen></iframe>
        </div>
        <button class="book-button" onclick="openModal('Mumbai Transit', 'mumbaitransit')">Book Now</button>
        <button class="cancel-button" onclick="cancelBooking('mumbaitransit')">Cancel Booking</button>
        <div class="comments-section">
            <textarea class="comment-input" placeholder="Leave a comment..." id="comment-mumbaitransit"></textarea>
            <button class="submit-comment" onclick="submitComment('mumbaitransit')">Submit Comment</button>
        </div>
    </div>

    <div class="event-card" data-event-id="foodfestival">
        <img src="images/foodfest.jpg" alt="Food Festival" class="event-img">
        <div class="event-title">
            Food Festival
            <span class="like-icon" onclick="likeEvent('foodfestival', this)">❤️</span>
        </div>
        <div class="event-details">Date: April 10-12, 2024</div>
        <div class="event-details">Timing: 11:00 AM - 9:00 PM</div>
        <div class="event-highlights">Highlights: Food stalls, cooking workshops, celebrity chefs.</div>
        <div class="event-availability">Availability: <span class="availability-status">Available</span></div>
        <div class="location-map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224819.56464827342!2d72.8777!3d19.076!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c7c5b78cd84b%3A0x6b2b5766b18de5f0!2sFood+Festival!5e0!3m2!1sen!2sin!4v1614282737391!5m2!1sen!2sin" allowfullscreen></iframe>
        </div>
        <button class="book-button" onclick="openModal('Food Festival', 'foodfestival')">Book Now</button>
        <button class="cancel-button" onclick="cancelBooking('foodfestival')">Cancel Booking</button>
        <div class="comments-section">
            <textarea class="comment-input" placeholder="Leave a comment..." id="comment-foodfestival"></textarea>
            <button class="submit-comment" onclick="submitComment('foodfestival')">Submit Comment</button>
        </div>
    </div>

    <div class="event-card" data-event-id="techconference">
        <img src="images/techconference.jpg" alt="Tech Conference" class="event-img">
        <div class="event-title">
            Tech Conference 2024
            <span class="like-icon" onclick="likeEvent('techconference', this)">❤️</span>
        </div>
        <div class="event-details">Date: March 15-17, 2024</div>
        <div class="event-details">Timing: 10:00 AM - 5:00 PM</div>
        <div class="event-highlights">Highlights: Keynote speakers, workshops, networking opportunities.</div>
        <div class="event-availability">Availability: <span class="availability-status">Available</span></div>
        <div class="location-map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224819.56464827342!2d72.8777!3d19.076!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c7c5b78cd84b%3A0x6b2b5766b18de5f0!2sTech+Conference!5e0!3m2!1sen!2sin!4v1614282737391!5m2!1sen!2sin" allowfullscreen></iframe>
        </div>
        <button class="book-button" onclick="openModal('Tech Conference 2024', 'techconference')">Book Now</button>
        <button class="cancel-button" onclick="cancelBooking('techconference')">Cancel Booking</button>
        <div class="comments-section">
            <textarea class="comment-input" placeholder="Leave a comment..." id="comment-techconference"></textarea>
            <button class="submit-comment" onclick="submitComment('techconference')">Submit Comment</button>
        </div>
    </div>
</div>

<!-- Modal for Booking Confirmation -->
<div class="modal" id="bookingModal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="modalTitle"></h2>
        <p id="modalMessage"></p>
        <div class="booking-form">
            <label class="form-label">Select Date:</label>
            <input type="date" class="form-input" id="modal-date" required>
            <label class="form-label">Select Time:</label>
            <input type="time" class="form-input" id="modal-time" required>
            <button class="confirm-booking" onclick="confirmBooking()">Confirm Booking</button>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2024 Torchbearer. All rights reserved.</p>
</footer>

<script>
    function openModal(eventTitle, eventId) {
        document.getElementById('modalTitle').innerText = eventTitle;
        document.getElementById('modalMessage').innerText = 'Please select the date and time for your booking.';
        document.getElementById('bookingModal').style.display = "block";
    }

    function closeModal() {
        document.getElementById('bookingModal').style.display = "none";
    }

    function confirmBooking() {
        const date = document.getElementById('modal-date').value;
        const time = document.getElementById('modal-time').value;
        if (date && time) {
            alert(`Booking confirmed for ${date} at ${time}.`);
            closeModal();
        } else {
            alert('Please select both date and time.');
        }
    }

    function cancelBooking(eventId) {
        alert(`Booking for ${eventId} has been cancelled.`);
    }

    function likeEvent(eventId, element) {
        element.classList.toggle('liked');
    }

    function submitComment(eventId) {
        const comment = document.getElementById(`comment-${eventId}`).value;
        alert(`Comment submitted for ${eventId}: ${comment}`);
        document.getElementById(`comment-${eventId}`).value = ''; // Clear the comment input
    }

    // Close modal if user clicks outside of it
    window.onclick = function(event) {
        if (event.target === document.getElementById('bookingModal')) {
            closeModal();
        }
    };
</script>
</body>
</html>