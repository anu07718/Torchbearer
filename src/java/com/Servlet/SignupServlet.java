package com.Servlet;



import com.Bean.SignupBean;
import com.Dao.SignupDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        SignupBean signupBean = new SignupBean();
        signupBean.setUsername(username);
        signupBean.setEmail(email);
        signupBean.setPassword(password);

        SignupDao signupDao = new SignupDao();

        if (signupDao.registerUser(signupBean)) {
            response.getWriter().println("<script>alert('Signup successful!');</script>");
        } else {
            response.getWriter().println("<script>alert('Signup failed!');</script>");
        }
    }
}
