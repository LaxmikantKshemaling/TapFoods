package com.tap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.dao.OrderItemDAO;
import com.tap.daoimple.OrderItemDAOImple;
import com.tap.model.OrderItem;

@WebServlet("/AllOrderItems")
public class OrderItemServlet extends HttpServlet {

    private OrderItemDAO orderItemDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        orderItemDAO = new OrderItemDAOImple();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch the list of all order items
        List<OrderItem> orderItemList = orderItemDAO.getAllOrderItems();
        
        // Set the list in the request scope
        request.setAttribute("orderItemList", orderItemList);
        
        // Forward to the OrderItem.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderItem.jsp");
        dispatcher.forward(request, response);
    }
}
