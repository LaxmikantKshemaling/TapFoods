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

@WebServlet("/OrderItem")
public class OrderItemServlet extends HttpServlet {

    private OrderItemDAO orderItemDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        orderItemDAO = new OrderItemDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch the orderTableId from the request
        String orderTableIdParam = request.getParameter("orderTableId");
        if (orderTableIdParam != null && !orderTableIdParam.isEmpty()) {
            int orderTableId = Integer.parseInt(orderTableIdParam);

            // Fetch the list of OrderItems associated with the orderTableId
            List<OrderItem> orderItemList = orderItemDAO.getAllOrderItemsByOrderTable(orderTableId);

            // Set the list in the request scope
            request.setAttribute("orderItemList", orderItemList);
        }

        // Forward to the OrderItem.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderItem.jsp");
        dispatcher.forward(request, response);
    }
}
