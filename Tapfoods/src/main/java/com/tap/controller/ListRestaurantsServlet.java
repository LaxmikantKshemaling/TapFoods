package com.tap.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.dao.RestaurantDAO;
import com.tap.daoimple.RestaurantDAOImple;
import com.tap.model.Restaurant;

@WebServlet("/ListRestaurantsServlet")
public class ListRestaurantsServlet extends HttpServlet {
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        restaurantDAO = new RestaurantDAOImple();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();
            if (restaurants == null) {
                restaurants = new ArrayList<>();
            }
            request.setAttribute("restaurant", restaurants);
            request.getRequestDispatcher("list_restaurants.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception or handle it appropriately
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        try {
            if ("delete".equals(action)) {
                Restaurant restaurant = restaurantDAO.getRestaurant(restaurantId);
                if (restaurant != null) {
                    restaurantDAO.deleteRestaurant(restaurantId);
                }
                response.sendRedirect("ListRestaurantsServlet");
            } else if ("update".equals(action)) {
                response.sendRedirect("Update?restaurantId=" + restaurantId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }
}