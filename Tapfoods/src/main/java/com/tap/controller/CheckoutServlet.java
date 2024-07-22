package com.tap.controller;

import java.io.IOException;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.dao.OrderTableDAO;
import com.tap.daoimple.OrderTableDAOImple;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.OrderTable;
import com.tap.model.User;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private OrderTableDAO orderTableDAO;

    // Initialize the OrderTableDAO when the servlet is initialized
    public void init() {
        orderTableDAO = new OrderTableDAOImple();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart"); // Retrieve cart from session
        User user = (User) session.getAttribute("loggedInUser"); // Retrieve logged-in user from session
        List<Menu> menuList = (List<Menu>) session.getAttribute("Menu"); // Retrieve menu list from session

        // Check if the cart is null or empty
        if (cart == null || cart.getItems().isEmpty()) {
            // Redirect to menu page if the cart is null or empty
            response.sendRedirect("menu.jsp");
        } else if (user == null) {
            // Redirect to login page if the user is null
            response.sendRedirect("Login.jsp");
        } else {
            String paymentMethod = request.getParameter("paymentMethod"); // Retrieve payment method from request

            if (paymentMethod == null || paymentMethod.isEmpty()) {
                // Redirect back to checkout page if payment method is not selected
                response.sendRedirect("checkout.jsp"); // Assuming checkout.jsp is the page for payment selection
            } else {
                try {
                    // Create a new OrderTable instance to store order details
                    OrderTable order = new OrderTable();

                    // Set order details
                    order.setOrderTableId(order.getOrderTableId()); 
                    order.setRestaurantId((int) session.getAttribute("restaurantId"));
                    order.setUserId(user.getUserId());
                    order.setModeOfPayment(paymentMethod);
                    order.setStatus("Pending");
                    order.setOrderDate(new Date());

                    // Get the generated order ID from the database
                    int generatedOrderId = orderTableDAO.getGeneratedOrderId(order);
                    order.setOrderTableId(generatedOrderId);

                    double totalAmount = 0;
                    // Calculate total amount of the order
                    for (CartItem item : cart.getItems().values()) {
                        totalAmount += item.getPrice() * item.getQuantity();
                    }
                    order.setTotalAmount(totalAmount);

                    // Save the order to the database
                    orderTableDAO.addOrderTable(order);

                    // Remove the cart from session
                    session.removeAttribute("cart");
                    // Set the order in session for confirmation page
                    session.setAttribute("order", order);

                    // Redirect to confirmation page
                    response.sendRedirect("confirmation.jsp");
                } catch (Exception e) {
                    // Redirect to menu page in case of any error during order processing
                    response.sendRedirect("menu.jsp");
                }
            }
        }
    }
}
