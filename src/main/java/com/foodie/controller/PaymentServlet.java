package com.foodie.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/processPayment")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Simulate payment details received
        String cardName = request.getParameter("cardName");
        String cardNumber = request.getParameter("cardNumber");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");

        HttpSession session = request.getSession();
        ArrayList<?> cart = (ArrayList<?>) session.getAttribute("cart");

        // Basic check for dummy payment success
        if (cardName != null && cardNumber != null && expiry != null && cvv != null) {
            // Clear the cart after successful payment
            session.removeAttribute("cart");

            // Forward to confirmation page
            response.sendRedirect("orderSuccess.jsp");
        } else {
            // Redirect back if any field missing (optional validation)
            response.sendRedirect("payment.jsp?error=true");
        }
    }
}
