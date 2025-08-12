package com.foodie.dao;

import java.sql.*;
import com.foodie.model.Order;

public class OrderDAO {
    private Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean placeOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (user_id, food_item_id, order_time) VALUES (?, ?, NOW())";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, order.getUserId());
        ps.setInt(2, order.getFoodItemId());
        return ps.executeUpdate() > 0;
    }
}
