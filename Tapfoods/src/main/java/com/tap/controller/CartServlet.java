package com.tap.controller;

import java.io.IOException;
import java.util.List;

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
import com.tap.model.Menu;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the session
        HttpSession session = request.getSession();

        // Retrieve session attributes
        List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");
        Integer restaurantId = (Integer) session.getAttribute("restaurantId"); // Changed to Integer
        String restaurantName = (String) session.getAttribute("restaurantName");
        String imagePath = (String) session.getAttribute("imagePath");

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
                addItemToCart(request, session, cart);
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    private void addItemToCart(HttpServletRequest request, HttpSession session, Cart cart) {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Retrieve restaurantName and imagePath from the session
        String restaurantName = (String) session.getAttribute("restaurantName");
        String imagePath = (String) session.getAttribute("imagePath");

        MenuDAO menuDAO = new MenuDAOImple();
        Menu menuItem = menuDAO.getMenu(itemId);

        if (menuItem != null) {
            // Ensure restaurant details are already set in the session by MenuServlet
            if (restaurantName != null && imagePath != null) {
                // Set restaurant details again only if necessary (this is usually not needed)
                session.setAttribute("restaurantId", menuItem.getRestaurantId()); // Assuming it’s an Integer
                session.setAttribute("restaurantName", restaurantName);
                session.setAttribute("imagePath", imagePath);
            }

            // Add the menu item to the cart
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
