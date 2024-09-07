package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.dao.OrderTableDAO;
import com.tap.daoimple.OrderTableDAOImple;
import com.tap.model.OrderTable;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
    private OrderTableDAO orderTableDAO;

    @Override
    public void init() throws ServletException {
        orderTableDAO = new OrderTableDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");

        OrderTable order = orderTableDAO.getOrderTable(orderId);
        if (order != null) {
            order.setStatus(status);
            orderTableDAO.updateOrderTable(order);

            // Send notification (this could be a push notification, email, etc.)
            sendNotification(order);
        }

        response.sendRedirect("OrderTableServlet");
    }

    private void sendNotification(OrderTable order) {
        // Notification logic here (e.g., push notifications, email notifications)
    }
}
