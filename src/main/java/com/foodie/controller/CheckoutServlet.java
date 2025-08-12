package com.foodie.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/checkoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // You can add logic here to validate or prepare data if needed

        // Forward to payment.jsp
        request.getRequestDispatcher("payment.jsp").forward(request, response);
    }
}
