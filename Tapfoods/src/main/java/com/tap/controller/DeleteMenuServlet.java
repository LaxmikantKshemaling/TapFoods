package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.dao.MenuDAO;
import com.tap.daoimple.MenuDAOImple;

@WebServlet("/DeleteMenu")
public class DeleteMenuServlet extends HttpServlet {
    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the menu ID and restaurant ID from the form
            String menuIdStr = request.getParameter("menuId");
            String restaurantIdStr = request.getParameter("restaurantId");

            if (menuIdStr != null && restaurantIdStr != null && !menuIdStr.isEmpty() && !restaurantIdStr.isEmpty()) {
                int menuId = Integer.parseInt(menuIdStr);
                int restaurantId = Integer.parseInt(restaurantIdStr);

                // Delete the menu item
                menuDAO.deleteMenu(menuId);

                // Redirect back to the menu list
                response.sendRedirect("MenuListServlet?restaurantId=" + restaurantId);
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
