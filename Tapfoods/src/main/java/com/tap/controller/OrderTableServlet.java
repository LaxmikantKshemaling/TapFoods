package com.tap.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.dao.OrderTableDAO;
import com.tap.daoimple.OrderTableDAOImple;
import com.tap.model.OrderTable;



@WebServlet("/OrderTableServlet")
public class OrderTableServlet extends HttpServlet {

    private OrderTableDAO orderTableDAO;

    @Override
    public void init() {
        orderTableDAO = new OrderTableDAOImple();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderIdParam = request.getParameter("orderId");
        List<OrderTable> orderTableList;

        if (orderIdParam != null && !orderIdParam.trim().isEmpty()) {
            try {
                int orderId = Integer.parseInt(orderIdParam);
                orderTableList = orderTableDAO.getOrderTablesByOrderId(orderId);
            } catch (NumberFormatException e) {
                orderTableList = new ArrayList<>(); // Invalid ID format
            }
        } else {
            orderTableList = orderTableDAO.getAllOrderTables();
        }

        request.setAttribute("orderTableList", orderTableList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderTable.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
