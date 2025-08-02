<%-- 
    Document   : submitEvent
    Created on : 25 Oct 2024, 7:02:56 am
    Author     : skota
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Submission Status</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }
        .message-box {
            text-align: center;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            max-width: 400px;
            width: 90%;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <%
            String status = request.getParameter("status");
            if ("success".equals(status)) {
        %>
            <h2 class="success">Event Created Successfully!</h2>
            <p>Your event has been added to the database.</p>
            <a href="Uploadevent.jsp">Create Another Event</a>
        <% 
            } else { 
        %>
            <h2 class="error">Event Creation Failed!</h2>
            <p>There was an error while adding your event. Please try again.</p>
            <a href="Uploadevent.jsp">Back to Create Event</a>
        <% 
            } 
        %>
    </div>
</body>
</html>
