package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.dao.RestaurantDAO;
import com.tap.daoimple.RestaurantDAOImple;
import com.tap.model.Restaurant;

@WebServlet("/Delete")
public class DeleteRestaurantServlet extends HttpServlet {
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        restaurantDAO = new RestaurantDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

            // Check if the restaurant exists before attempting to delete
            Restaurant restaurant = restaurantDAO.getRestaurant(restaurantId);
            if (restaurant != null) {
                restaurantDAO.deleteRestaurant(restaurantId);
                response.sendRedirect("ListRestaurantsServlet");
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Restaurant not found.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid restaurant ID.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }
}
