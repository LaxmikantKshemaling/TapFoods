package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.dao.MenuDAO;
import com.tap.daoimple.MenuDAOImple;
import com.tap.model.Menu;

@WebServlet("/editMenu")
public class EditMenuServlet extends HttpServlet {
    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch menuId from the form
        int menuId = Integer.parseInt(request.getParameter("menuId"));
        
        // Fetch the updated details from the form
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String menuimagePath = request.getParameter("menuimagePath");
        boolean isAvailable = Boolean.parseBoolean(request.getParameter("isAvailable"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        
        // Create a new Menu object with the updated details
        Menu updatedMenu = new Menu();
        
        // Call the DAO to update the menu item in the database
        menuDAO.updateMenu(updatedMenu);
        
        // Redirect back to the menu list for the same restaurant
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        response.sendRedirect("menuList?restaurantId=" + restaurantId);
    }
}
