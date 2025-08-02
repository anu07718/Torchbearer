package com.Servlet;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpSession;

import com.Bean.OrganizerBean;
import com.Dao.OrganizerDao;

@WebServlet("/OrganizerServlet")
public class OrganizerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrganizerDao organizerDao = new OrganizerDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            // Handle registration
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password"); // Getting password in plain text

            OrganizerBean organizer = new OrganizerBean();
            organizer.setName(name);
            organizer.setEmail(email);
            organizer.setPassword(password); // Storing plain text password

            if (organizerDao.registerOrganizer(organizer)) {
                response.sendRedirect("registrationSuccess.jsp"); // Redirect to success page
            } else {
                response.sendRedirect("registrationError.jsp"); // Redirect to error page
            }
        } else if ("login".equals(action)) {
            // Handle login
            String email = request.getParameter("email");
            String password = request.getParameter("password"); // Getting password in plain text

            OrganizerBean organizer = organizerDao.loginOrganizer(email, password);
            if (organizer != null) {
                HttpSession session = request.getSession();
                session.setAttribute("organizer", organizer);
                response.sendRedirect("dashboard.jsp"); // Redirect to dashboard
            } else {
                response.sendRedirect("loginError.jsp"); // Redirect to error page
            }
        }
    }
}
