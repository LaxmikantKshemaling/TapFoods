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

@WebServlet("/Update")
public class UpdateRestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        // Initialize the RestaurantDAO implementation
        restaurantDAO = new RestaurantDAOImple();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve the restaurant ID from the request
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
            // Fetch the restaurant details from the database
            Restaurant restaurant = restaurantDAO.getRestaurant(restaurantId);
            
            if (restaurant != null) {
                // Forward the restaurant details to the update page
                request.setAttribute("restaurant", restaurant);
                request.getRequestDispatcher("update_restaurant.jsp").forward(request, response);
            } else {
                // Handle the case where the restaurant was not found
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Restaurant not found.");
            }
        } catch (NumberFormatException e) {
            // Handle invalid ID format
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid restaurant ID format.");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve and validate the updated data from the request
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
            String restaurantName = request.getParameter("restaurantName");
            String imagePath = request.getParameter("imagePath");
            float rating = Float.parseFloat(request.getParameter("rating"));
            int deliveryTime = Integer.parseInt(request.getParameter("deliveryTime"));
            String cuisineType = request.getParameter("cuisineType");
            String address = request.getParameter("address");
            boolean isActive = request.getParameter("isActive") != null;
            int restaurantAdmin = Integer.parseInt(request.getParameter("restaurantAdmin"));

            // Fetch the restaurant object
            Restaurant restaurant = restaurantDAO.getRestaurant(restaurantId);
            
            if (restaurant != null) {
                // Update the restaurant object with new values
                restaurant.setRestaurantName(restaurantName);
                restaurant.setImagePath(imagePath);
                restaurant.setRating(rating);
                restaurant.setDeliveryTime(deliveryTime);
                restaurant.setCuisineType(cuisineType);
                restaurant.setAddress(address);
                restaurant.setActive(isActive);
                restaurant.setRestaurantAdmin(restaurantAdmin);

                // Save the updated restaurant details
                boolean isUpdated = restaurantDAO.updateRestaurant(restaurant);

                if (isUpdated) {
                    // Redirect to the list of restaurants on successful update
                    response.sendRedirect("ListRestaurantsServlet");
                } else {
                    // Handle update failure
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update restaurant details.");
                }
            } else {
                // Handle case where the restaurant was not found
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Restaurant not found.");
            }
        } catch (NumberFormatException e) {
            // Handle invalid data format
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid data format.");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }
}