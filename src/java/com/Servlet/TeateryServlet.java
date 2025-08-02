/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Servlet;

/**
 *
 * @author skota
 */


import com.Bean.TeateryBean;
import com.Dao.TeateryDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class TeateryServlet extends HttpServlet {
    private TeateryDao teateryDao;

    @Override
    public void init() {
        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
        teateryDao = new TeateryDao(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<TeateryBean> eateries = teateryDao.getAllEateries();
            request.setAttribute("eateries", eateries);
            RequestDispatcher dispatcher = request.getRequestDispatcher("eateries.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int eateryId = Integer.parseInt(request.getParameter("eateryId"));

        try {
            if ("comment".equals(action)) {
                String comment = request.getParameter("comment");
                teateryDao.addComment(eateryId, comment);
            } 
            // Other actions for reserve, cancel, and like can be added here

            response.sendRedirect("eateries.jsp?eateryId=" + eateryId);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
