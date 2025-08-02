<%-- 
    Document   : submitComment
    Created on : 31 Oct 2024, 9:11:41 pm
    Author     : skota
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Comment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Comment</title>
    <script>
        function submitComment(eventId) {
            const commentInput = document.getElementById(`comment-${eventId}`);
            const comment = commentInput.value.trim();

            if (comment === '') {
                alert("Please enter a comment.");
                return;
            }

            // Send the comment to the backend
            fetch('SubmitCommentServlet', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ eventId: eventId, comment: comment })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("Comment submitted successfully.");
                    commentInput.value = ''; // Clear the comment input
                    loadComments(eventId); // Reload comments
                } else {
                    alert("Failed to submit comment. Please try again.");
                }
            })
            .catch(error => {
                console.error("Error submitting comment:", error);
                alert("Error submitting comment. Please try again.");
            });
        }

        function loadComments(eventId) {
            fetch('LoadCommentsServlet?eventId=' + eventId)
            .then(response => response.json())
            .then(data => {
                const commentsContainer = document.getElementById(`comments-container-${eventId}`);
                commentsContainer.innerHTML = ''; // Clear current comments
                data.comments.forEach(comment => {
                    const commentElement = document.createElement("p");
                    commentElement.innerText = comment.text;
                    commentsContainer.appendChild(commentElement);
                });
            })
            .catch(error => {
                console.error("Error loading comments:", error);
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Event Comments</h2>
        <!-- Event comments form -->
        <div class="event-comments">
            <textarea id="comment-1" rows="3" placeholder="Write a comment..."></textarea>
            <button onclick="submitComment(1)">Submit Comment</button>
        </div>

        <!-- Comments display -->
        <div id="comments-container-1">
            <!-- Loaded comments will appear here -->
        </div>
    </div>
</body>
</html>
