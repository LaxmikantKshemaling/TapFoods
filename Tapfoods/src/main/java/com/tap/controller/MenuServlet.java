package com.tap.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.dao.MenuDAO;
import com.tap.daoimple.MenuDAOImple;
import com.tap.model.Menu;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAOImple();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the query parameters from the request
        String category = request.getParameter("category");
        String restaurantIdStr = request.getParameter("restaurantId");
        String restaurantName = request.getParameter("restaurantName");
        String imagePath = request.getParameter("imagePath");
        String searchQuery = request.getParameter("search");
        String ratingStr = request.getParameter("rating");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");

        // Initialize the menuList
        List<Menu> menuList = new ArrayList<>();
        RequestDispatcher dispatcher = null;

        try {
            // Handle different search cases
            if (category != null && !category.isEmpty()) {
                // Fetch all menus by category (like "burger", "pasta", etc.)
                menuList = menuDAO.getAllMenusByCategory(category);

            } else if (searchQuery != null && !searchQuery.isEmpty()) {
                // Fetch menus by name matching the search query
                menuList = menuDAO.searchMenuByName(searchQuery);

            } else if (ratingStr != null && !ratingStr.isEmpty()) {
                // Fetch menus by rating
                double rating = Double.parseDouble(ratingStr);
                menuList = menuDAO.searchMenuByRating(rating);

            } else if (minPriceStr != null && !minPriceStr.isEmpty()) {
                // Fetch menus by price range
                double minPrice = Double.parseDouble(minPriceStr);
                Double maxPrice = (maxPriceStr != null && !maxPriceStr.isEmpty()) ? Double.parseDouble(maxPriceStr) : null;
                menuList = menuDAO.searchMenuByPrice(minPrice, maxPrice);

            } else if (restaurantIdStr != null && !restaurantIdStr.isEmpty()) {
                // Fetch menus by restaurant ID
                int restaurantId = Integer.parseInt(restaurantIdStr);
                menuList = menuDAO.getAllMenusByRestaurant(restaurantId);

            } else if (restaurantName != null && !restaurantName.isEmpty()) {
                // Fetch menus by restaurant name
                menuList = menuDAO.getMenusByRestaurantName(restaurantName);
                
            } else {
                // If no search parameter is provided, set a default behavior
                menuList = menuDAO.getAllMenusByRestaurant(1); // Default restaurant ID
            }

            // Set request attributes for menuList, restaurantName, and imagePath
            request.setAttribute("menuList", menuList);
            request.setAttribute("restaurantName", restaurantName);
            request.setAttribute("imagePath", imagePath);

            // Forward the request to the menu.jsp page
            dispatcher = request.getRequestDispatcher("menu.jsp");
            dispatcher.forward(request, response);

            // Set the same attributes in the session for later use
            HttpSession session = request.getSession();
            session.setAttribute("menuList", menuList);
            session.setAttribute("restaurantName", restaurantName);
            session.setAttribute("imagePath", imagePath);

        } catch (NumberFormatException e) {
            // Handle potential number format exceptions gracefully
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
