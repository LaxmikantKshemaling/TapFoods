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
import com.tap.daoimple.MenuDAOImple;
import com.tap.model.Menu;

@WebServlet("/menuList")
public class MenuListServlet extends HttpServlet {

    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAOImple();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String restaurantIdStr = request.getParameter("restaurantId");
        int restaurantId;

        try {
            restaurantId = Integer.parseInt(restaurantIdStr);
        } catch (NumberFormatException e) {
            restaurantId = -1;
            request.setAttribute("error", "Invalid Restaurant ID.");
        }

        if (restaurantId != -1) {
            List<Menu> menuList = menuDAO.getAllMenusByRestaurant(restaurantId);
            request.setAttribute("menuList", menuList);
            //request.setAttribute("restaurantId", restaurantId);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("menulist.jsp");
        dispatcher.forward(request, response);
    }
}
