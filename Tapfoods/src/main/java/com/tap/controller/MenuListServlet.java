package com.tap.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tap.dao.MenuDAO;
import com.tap.dao.RestaurantDAO;
import com.tap.daoimple.MenuDAOImple;
import com.tap.daoimple.RestaurantDAOImple;
import com.tap.model.Menu;

@WebServlet("/MenuListServlet")
public class MenuListServlet extends HttpServlet {

    private MenuDAO menuDAO;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAOImple();
        restaurantDAO = new RestaurantDAOImple();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String restaurantIdStr = request.getParameter("restaurantId");

        if (restaurantIdStr != null && !restaurantIdStr.isEmpty()) {
            try {
                int restaurantId = Integer.parseInt(restaurantIdStr);

                // Fetch menu items for the restaurant
                List<Menu> menuList = menuDAO.getAllMenusByRestaurant(restaurantId);

                // Set attributes for the JSP page
                request.setAttribute("menuList", menuList);

                // Forward the request to the JSP
                RequestDispatcher dispatcher = request.getRequestDispatcher("menulist.jsp");
                dispatcher.forward(request, response);

            } catch (NumberFormatException e) {
                // Handle invalid restaurant ID
                response.sendRedirect("errorPage.jsp");
            }
        } else {
            // Handle missing restaurant ID
            response.sendRedirect("errorPage.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String menuIdStr = request.getParameter("menuId");
        String restaurantIdStr = request.getParameter("restaurantId");

        try {
            if (menuIdStr != null && restaurantIdStr != null) {
                int menuId = Integer.parseInt(menuIdStr);
                int restaurantId = Integer.parseInt(restaurantIdStr);

                if ("delete".equals(action)) {
                    // Delete the menu item
                    menuDAO.deleteMenu(menuId);
                    // Redirect to the same restaurant's menu list after deletion
                    response.sendRedirect("MenuListServlet?restaurantId=" + restaurantId);
                } else if ("update".equals(action)) {
                    // Redirect to the menu update page
                    response.sendRedirect("UpdateMenu?menuId=" + menuId + "&restaurantId=" + restaurantId);
                }
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
