package com.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidate the session to log out the user
        HttpSession session = request.getSession(false); // Fetch session if exists
        if (session != null) {
            session.invalidate(); // Destroy session
        }

        // Redirect to the traveller homepage after logout
        response.sendRedirect("traveller.jsp");
    }
}
