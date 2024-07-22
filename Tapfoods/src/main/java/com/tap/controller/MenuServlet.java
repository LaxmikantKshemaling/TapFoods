package com.tap.controller;

import java.io.IOException;
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

@WebServlet("/menu") // Servlet mapping to the URL '/menu'
public class MenuServlet extends HttpServlet {

    private MenuDAO menuDAO; // Declare MenuDAO reference variable

    public void init() {
        menuDAO = new MenuDAOImple(); // Initialize MenuDAO implementation
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String restaurantId = request.getParameter("restaurantId"); // Retrieve restaurantId parameter from request
        
        // Check if restaurantId parameter is not null and not empty
        if (restaurantId != null && !restaurantId.isEmpty()) {
            try {
                // Retrieve menu list for the specified restaurantId
                List<Menu> menuList = menuDAO.getAllMenusByRestaurant(Integer.parseInt(restaurantId));
                
                // Set menuList as a request attribute to be accessed in the JSP
                request.setAttribute("menuList", menuList);
                
                HttpSession session = request.getSession();
                session.setAttribute("Menu", menuList);

                
                
            } catch (NumberFormatException e) {
                // Log or handle the NumberFormatException
                e.printStackTrace();
            }
        }

        // Forward the request to the 'menu.jsp' page
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
        dispatcher.forward(request, response);
    }
}
