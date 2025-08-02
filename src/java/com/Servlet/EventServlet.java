/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Servlet;

/**
 *
 * @author skota
 */

import com.Bean.EventBean;
import com.Dao.EventDao;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class EventServlet extends HttpServlet {
    private EventDao eventDao;

    @Override
    public void init() throws ServletException {
        Connection connection = DatabaseConnection.getConnection(); // Assume a utility for DB connection
        eventDao = new EventDao(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<EventBean> events = eventDao.getAllEvents();
            request.setAttribute("events", events);
            RequestDispatcher dispatcher = request.getRequestDispatcher("upcoming_events.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load events.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int eventId = Integer.parseInt(request.getParameter("eventId"));

        try {
            boolean result = false;
            if ("book".equals(action)) {
                result = eventDao.bookEvent(eventId);
            } else if ("like".equals(action)) {
                result = eventDao.likeEvent(eventId);
            } else if ("comment".equals(action)) {
                String comment = request.getParameter("comment");
                result = eventDao.addComment(eventId, comment);
            }

            response.getWriter().write(result ? "Success" : "Failure");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error");
        }
    }
}


