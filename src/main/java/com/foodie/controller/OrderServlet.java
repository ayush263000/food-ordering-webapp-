package com.foodie.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.foodie.dao.OrderDAO;
import com.foodie.model.Order;
import com.foodie.model.User;
import com.foodie.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int foodId = Integer.parseInt(req.getParameter("foodId"));
        User user = (User) req.getSession().getAttribute("user");

        Order order = new Order();
        order.setUserId(user.getId());
        order.setFoodItemId(foodId);

        Connection conn = null;
		try {
			conn = DBConnection.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        OrderDAO dao = new OrderDAO(conn);

        try {
            dao.placeOrder(order);
            res.sendRedirect("foodlist.jsp?ordered=1");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
