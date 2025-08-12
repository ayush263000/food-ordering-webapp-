//package com.foodie.controller;
//
//import com.foodie.model.CartItem;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//@WebServlet("/removeFromCart")
//public class RemoveFromCartServlet extends HttpServlet {
//    /**
//	 * 
//	 */
//	private static final long serialVersionUID = 1603493120660628253L;
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String name = request.getParameter("name");
//        HttpSession session = request.getSession();
//        ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
//
//        if (cart != null) {
//            CartItem target = null;
//            for (CartItem item : cart) {
//                if (item.getItemName().equals(name)) {
//                    item.decrementQuantity();
//                    if (item.getQuantity() <= 0) {
//                        target = item;
//                    }
//                    break;
//                }
//            }
//            if (target != null) {
//                cart.remove(target);
//            }
//        }
//
//        response.sendRedirect("cart.jsp");
//    }
//}


package com.foodie.controller;

import com.foodie.model.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1603493120660628253L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // accept either "name" or "item" param
        String name = request.getParameter("name");
        if (name == null) {
            name = request.getParameter("item");
        }
        String redirect = request.getParameter("redirect");
        if (redirect == null) redirect = "index";

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

        if (cart != null && name != null) {
            CartItem toRemove = null;
            for (CartItem ci : cart) {
                String ciName = ci.getItemName();
                if (ciName != null && ciName.equals(name)) {
                    ci.decrementQuantity();
                    if (ci.getQuantity() <= 0) {
                        toRemove = ci;
                    }
                    break;
                }
            }
            if (toRemove != null) {
                cart.remove(toRemove);
            }
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }
}

