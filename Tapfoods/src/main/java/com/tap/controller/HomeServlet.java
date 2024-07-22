package com.tap.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tap.dao.RestaurantDAO;
import com.tap.daoimple.RestaurantDAOImple;
import com.tap.model.Restaurant;

@WebServlet("/home") // Servlet mapping to the URL '/home'
public class HomeServlet extends HttpServlet {
	private RestaurantDAO restaurantDAO;

	@Override
	public void init() {
		restaurantDAO = new RestaurantDAOImple();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Restaurant> restaurantList = restaurantDAO.getAllRestaurants();
		request.setAttribute("restaurantList", restaurantList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		dispatcher.forward(request, response);
	}
}
