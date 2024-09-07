package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.dao.MenuDAO;
import com.tap.daoimple.MenuDAOImple;

@WebServlet("/addMenu")
public class AddMenuServlet extends HttpServlet {
    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get restaurantId from the form
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        // Create logic for adding new menu item
        // After adding, redirect to menu list
        response.sendRedirect("menuList?restaurantId=" + restaurantId);
    }
}
