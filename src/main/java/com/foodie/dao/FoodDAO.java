package com.foodie.dao;

import java.sql.*;
import java.util.*;
import com.foodie.model.FoodItem;

public class FoodDAO {
    private Connection conn;

    public FoodDAO(Connection conn) {
        this.conn = conn;
    }

    public List<FoodItem> searchFilterSortFoods(String name, String type, String sortBy) throws SQLException {
        List<FoodItem> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT * FROM food_item WHERE 1=1");

        if (name != null && !name.isEmpty()) {
            sql.append(" AND name LIKE ?");
        }
        if (type != null && !type.isEmpty()) {
            sql.append(" AND type = ?");
        }
        if ("price".equals(sortBy)) {
            sql.append(" ORDER BY price");
        } else if ("rating".equals(sortBy)) {
            sql.append(" ORDER BY rating DESC");
        }

        PreparedStatement ps = conn.prepareStatement(sql.toString());

        int idx = 1;
        if (name != null && !name.isEmpty()) {
            ps.setString(idx++, "%" + name + "%");
        }
        if (type != null && !type.isEmpty()) {
            ps.setString(idx++, type);
        }

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            FoodItem item = new FoodItem();
            item.setId(rs.getInt("id"));
            item.setName(rs.getString("name"));
            item.setPrice(rs.getDouble("price"));
            item.setRestaurantName(rs.getString("restaurant_name"));
            item.setType(rs.getString("type"));
            item.setRating(rs.getFloat("rating"));
            list.add(item);
        }

        return list;
    }

}
