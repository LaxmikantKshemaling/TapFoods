package com.tap.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.dao.OrderItemDAO;
import com.tap.dao.OrderTableDAO;
import com.tap.daoimple.OrderItemDAOImple;
import com.tap.daoimple.OrderTableDAOImple;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.User;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private OrderTableDAO orderTableDAO;
    private OrderItemDAO orderItemDAO;

    @Override
    public void init() {
        orderTableDAO = new OrderTableDAOImple();
        orderItemDAO = new OrderItemDAOImple();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");

        User user = (User) session.getAttribute("loggedInUser");

        // Check if the user is logged in
        if (user == null) {
            response.sendRedirect("Signin.jsp");
            return;
        }

        // Check if the cart is empty
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("menu.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");
        String address = request.getParameter("address");
        String phoneNo = request.getParameter("phoneNo");

        // Check if payment method, address, and phone number are provided
        if (paymentMethod == null || paymentMethod.isEmpty() || address == null || address.isEmpty() || phoneNo == null
                || phoneNo.isEmpty()) {
            response.sendRedirect("checkout.jsp");
            return;
        }

        try {
            // Create and save the OrderTable
            OrderTable orderTable = new OrderTable();
            orderTable.setRestaurantId((int) session.getAttribute("restaurantId"));
            orderTable.setUserId(user.getUserId());
            orderTable.setModeOfPayment(paymentMethod);
            orderTable.setStatus("Pending");
            orderTable.setOrderDate(new Date());
            orderTable.setAddress(address);
            orderTable.setPhoneNo(phoneNo);

            double totalAmount = 0;
            for (CartItem item : cart.getItems().values()) {
                totalAmount += item.getPrice() * item.getQuantity();
            }
            orderTable.setTotalAmount(totalAmount);

            // Save OrderTable and retrieve generatedOrderId
            int generatedOrderId = orderTableDAO.addOrderTable(orderTable);
            orderTable.setOrderTableId(generatedOrderId);
            System.out.println(orderTable);

            // Retrieve order items from the cart
            Map<Integer, CartItem> cartItems = cart.getItems();
            for (CartItem cartItem : cartItems.values()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderItemId(cartItem.getItemId());
                orderItem.setOrderTableId(generatedOrderId);
                orderItem.setQuantity(cartItem.getQuantity());
                orderItem.setPrice(cartItem.getPrice());
                orderItem.setName(cartItem.getName());
                orderItem.setTotalPrice(cartItem.getPrice() * cartItem.getQuantity());

                // Save OrderItem
                System.out.println(orderItem);
                orderItemDAO.addOrderItem(orderItem);
            }

            // Clear the cart after saving the order
            session.removeAttribute("cart");
            session.setAttribute("orderList", orderTable);

            // Redirect to confirmation page
            response.sendRedirect("confirmation.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("menu.jsp");
        }
    }
}



