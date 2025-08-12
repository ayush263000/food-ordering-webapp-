package com.foodie.controller;

import com.foodie.dao.UserDAO;
import com.foodie.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        UserDAO dao = new UserDAO();
        boolean success = dao.registerUser(user);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration Failed.");
        }
    }
}
