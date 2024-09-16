package com.tap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tap.dao.RestaurantDAO;
import com.tap.daoimple.RestaurantDAOImple;

@WebServlet("/DeleteRestaurantServlet")
public class DeleteRestaurantServlet extends HttpServlet {
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() {
        restaurantDAO = new RestaurantDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the restaurant ID from the form
            String restaurantIdStr = request.getParameter("restaurantId");

            if (restaurantIdStr != null) {
                int restaurantId = Integer.parseInt(restaurantIdStr);

                // Delete the restaurant
                restaurantDAO.deleteRestaurant(restaurantId);

                // Redirect back to the restaurant list
                response.sendRedirect("ListRestaurantsServlet");
            } else {
                response.sendRedirect("errorPage.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format
            response.sendRedirect("errorPage.jsp");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }
}
