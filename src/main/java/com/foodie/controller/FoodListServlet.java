package com.foodie.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.foodie.dao.FoodDAO;
import com.foodie.util.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/foods")
public class FoodListServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Connection conn = null;
		try {
			conn = DBConnection.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        FoodDAO dao = new FoodDAO(conn);
        try {
        	String name = req.getParameter("name");
        	String type = req.getParameter("type");
        	String sortBy = req.getParameter("sort");
        	req.setAttribute("foods", dao.searchFilterSortFoods(name, type, sortBy));
            RequestDispatcher rd = req.getRequestDispatcher("foodlist.jsp");
            rd.forward(req, res);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
