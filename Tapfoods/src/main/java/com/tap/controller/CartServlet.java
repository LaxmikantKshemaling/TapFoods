package com.tap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.dao.MenuDAO;
import com.tap.daoimple.MenuDAOImple;
import com.tap.model.Cart;
import com.tap.model.CartItem;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the session
        HttpSession session = request.getSession();

        // Retrieve cart from session
        Cart cart = (Cart) session.getAttribute("cart");
        // Create a new cart if it doesn't exist in session
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Retrieve action parameter from request
        String action = request.getParameter("action");

        // Perform action based on the parameter
        if (action != null) {
            if (action.equals("add")) {
                // Add item to cart
                addItemToCart(request, cart);
            } else if (action.equals("update")) {
                // Update cart item
                updateCartItem(request, cart);
            } else if (action.equals("remove")) {
                // Remove item from cart
                removeItemFromCart(request, cart);
            }
        }

        // Update cart in session
        session.setAttribute("cart", cart);
        // Redirect to cart.jsp
        response.sendRedirect("cart.jsp");
    }

    // Forward GET requests to cart.jsp
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    // Method to add item to cart
    private void addItemToCart(HttpServletRequest request, Cart cart) {
        // Retrieve item ID and quantity from request
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Retrieve MenuDAO and fetch menu item from database
        MenuDAO menuDAO = new MenuDAOImple();
        com.tap.model.Menu menuItem = menuDAO.getMenu(itemId);

        // Set restaurant ID in session
        HttpSession session = request.getSession();
        session.setAttribute("restaurantId", menuItem.getRestaurantId());

        // Create CartItem and add to cart
        if (menuItem != null) {
            CartItem item = new CartItem(
                    menuItem.getMenuId(),
                    menuItem.getRestaurantId(),
                    menuItem.getName(),
                    quantity,
                    menuItem.getPrice()
            );
            cart.addItem(item);
        }
    }

    // Method to update cart item quantity
    private void updateCartItem(HttpServletRequest request, Cart cart) {
        // Retrieve item ID and quantity from request
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        // Update cart item quantity
        cart.updateItem(itemId, quantity);
    }

    // Method to remove item from cart
    private void removeItemFromCart(HttpServletRequest request, Cart cart) {
        // Retrieve item ID from request and remove item from cart
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        cart.removeItem(itemId);
    }
}
