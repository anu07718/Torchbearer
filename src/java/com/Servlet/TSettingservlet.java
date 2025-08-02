package com.Servlet;

import com.Bean.TSettingsBean;
import com.Dao.TSettingsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/saveTravellerInfo")
public class TSettingservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String location = request.getParameter("location");

        // Populate TSettingsBean with form data
        TSettingsBean traveller = new TSettingsBean();
        traveller.setUsername(username);
        traveller.setEmail(email);
        traveller.setPhone(phone);
        traveller.setLocation(location);

        // Save traveller info using DAO
        TSettingsDao dao = new TSettingsDao();
        boolean isSaved = dao.saveTravellerInfo(traveller);

        // Forward to a JSP page to display saved information
        if (isSaved) {
            request.setAttribute("traveller", traveller); // Store traveller object in request scope
            request.getRequestDispatcher("travellerInfo.jsp").forward(request, response); // Forward to JSP
        } else {
            request.setAttribute("errorMessage", "Failed to save traveller info"); // Set error message
            request.getRequestDispatcher("error.jsp").forward(request, response); // Forward to error JSP
        }
    }
}
