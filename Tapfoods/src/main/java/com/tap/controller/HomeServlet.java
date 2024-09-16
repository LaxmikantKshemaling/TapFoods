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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        restaurantDAO = new RestaurantDAOImple(); // Initialize DAO here
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String searchQuery = request.getParameter("search");
            List<Restaurant> restaurantList;
            
            if (searchQuery != null && !searchQuery.isEmpty()) {
                restaurantList = restaurantDAO.searchRestaurantsByrestaurantName(searchQuery);
            } else {
                restaurantList = restaurantDAO.getAllRestaurants();
            }

            request.setAttribute("restaurantList", restaurantList);
        } catch (Exception e) {
            request.setAttribute("error", "Failed to load restaurants. Please try again.");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}