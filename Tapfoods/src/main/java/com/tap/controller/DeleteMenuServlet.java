package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.dao.MenuDAO;
import com.tap.daoimple.MenuDAOImple;

@WebServlet("/deleteMenu")
public class DeleteMenuServlet extends HttpServlet {
    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int menuId = Integer.parseInt(request.getParameter("menuId"));
        menuDAO.deleteMenu(menuId);
        // Redirect to the menu list after deleting
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        response.sendRedirect("menuList?restaurantId=" + restaurantId);
    }
}
