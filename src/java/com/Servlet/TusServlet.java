/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Servlet;

/**
 *
 * @author skota
 */
import com.Bean.TusBean;
import com.Dao.TusDao;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class TusServlet extends HttpServlet {
    private final TusDao tusDao;

    // Constructor
    public TusServlet() {
        tusDao = new TusDao();
    }

    // Method to handle GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TusBean> feedbackList = tusDao.getFeedback();
        request.setAttribute("feedbackList", feedbackList);
        request.getRequestDispatcher("aboutus.jsp").forward(request, response);
    }

    // Method to handle POST requests
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedback = request.getParameter("comments");

        TusBean tus = new TusBean();
        tus.setName(name);
        tus.setEmail(email);
        tus.setFeedback(feedback);

        tusDao.addFeedback(tus);
        response.sendRedirect("aboutus.jsp");
    }
}