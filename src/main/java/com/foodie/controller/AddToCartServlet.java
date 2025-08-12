//package com.foodie.controller;
//
//import com.foodie.model.CartItem;
//
//import jakarta.servlet.annotation.WebServlet;
//
////import javax.servlet.ServletException;
////import javax.servlet.http.*;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//
//@WebServlet("/addToCart")
//public class AddToCartServlet extends HttpServlet {
//    
//	private static final long serialVersionUID = 1191962803129099784L;
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String name = request.getParameter("item");
//        String price = request.getParameter("price");
//
//        HttpSession session = request.getSession();
//        ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
//
//        if (cart == null) {
//            cart = new ArrayList<>();
//        }
//        
//        boolean found = false;
//        for (CartItem item : cart) {
//            if (item.getItemName().equals(name)) {
//                item.incrementQuantity();
//                found = true;
//                item.incrementQuantity();
//                break;
//            }
//        }
//
//        if(!found) {
//        	cart.add(new CartItem(name, price));        	
//        }
//        
//        
//        session.setAttribute("cart", cart);
//        
//        if(!found) {
//        	response.sendRedirect("index.jsp");        	
//        }
//        else {
//        	response.sendRedirect("cart.jsp");
//        }
//    }
//
////	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////	    HttpSession session = request.getSession();
////
////	    String name = request.getParameter("name");
////	    String price = request.getParameter("price");
////
////	    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
////	    if (cart == null) {
////	        cart = new ArrayList<>();
////	        session.setAttribute("cart", cart);
////	    }
////
////	    boolean itemExists = false;
////	    for (CartItem item : cart) {
////	        if (item.getName() != null && item.getName().equals(name)) {
////	            item.setQuantity(item.getQuantity() + 1);
////	            itemExists = true;
////	            break;
////	        }
////	    }
////
////	    if (!itemExists) {
////	        CartItem newItem = new CartItem(name, price, 1);
////	        cart.add(newItem);
////	    }
////
////	    response.sendRedirect("cart.jsp");
////	}
//
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

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Try both parameter names so index.jsp and cart.jsp both work
        String name = request.getParameter("item");
        if (name == null) {
            name = request.getParameter("name");
        }
        String price = request.getParameter("price");
        
        String redirect = request.getParameter("redirect");
        if (redirect == null) redirect = "index";
        
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;
        for (CartItem ci : cart) {
            if (ci.getItemName() != null && ci.getItemName().equals(name)) {
                // only increment once
                ci.incrementQuantity();
                found = true;
                break;
            }
        }

        if (!found) {
            cart.add(new CartItem(name, price));
        }

        session.setAttribute("cart", cart);
        
        if ("cart".equals(redirect)) {
            response.sendRedirect("cart.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
        // Always go back to cart so "+1" stays on cart.jsp
//        response.sendRedirect("cart.jsp");
    }
}
