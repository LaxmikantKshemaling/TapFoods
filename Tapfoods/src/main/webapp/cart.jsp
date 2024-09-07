<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="com.tap.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            padding: 17px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        .top-bar img {
            width: 50px;
        }
        .secure-checkout {
            font-weight: bold;
            font-size:35px;
            color: #343a40;
        }
        .container-custom {
            margin-top: 2px; /* Space for top-bar */
            padding-bottom: 45px; /* Space for fixed-bottom-buttons */
            display: flex;
        }
        .main-content {
            display: flex;
            width: 100%;
        }
        .left-side {
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 5px;
            width: 600px; /* Fixed width for left side */
            height: calc(100vh - 120px); /* Full height minus top margin */
            position: fixed;
            top: 80px; /* Below the top-bar */
            left: 0;
            z-index: 998;
        }
        .left-side img {
            width: 120px;
            height: auto;
            border-radius: 4px;
        }
        .small-image {
            width: 40px;
            height: auto;
        }
        .left-side p {
            color: orange; /* Change text color to orange */
        }
        .auth-buttons a {
            display: block;
            margin-bottom: 10px;
            padding: 10px;
            color: orange; /* Change button text color to orange */
            border-radius: 8px;
            text-align: center;
            text-decoration: none;
            border: 2px solid orange; /* Change button border color to orange */
        }
        .auth-buttons .signin-btn {
            background-color: #ffffff; /* Keep button background white */
        }
        .auth-buttons .signup-btn {
            background-color: #ffffff; /* Keep button background white */
        }
        .auth-buttons a:hover {
            opacity: 0.9;
            background-color: #f8f9fa; /* Optional: Adjust hover color if needed */
        }
        .right-side {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
            padding: 1px;
            margin-left: 600px; /* Adjust to fit the remaining width */
            overflow-y: auto; /* Make the cart items scrollable vertically */
            height: calc(100vh - 120px); /* Full height minus top margin */
            display: flex;
            flex-direction: column;
            width: calc(100% - 600px); /* Ensure the width is responsive to the new margin-left */
        }
        .restaurant-info-right {
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-bottom: 1px solid #e9ecef;
            margin-bottom: 2px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 999;
        }
        .restaurant-info-right img {
            width: 70px;
            height: auto;
            margin-top: 20px;
        }
        .cart-items {
            flex: 1; /* Allow cart items to take available space */
            overflow-x: auto; /* Make the cart items scrollable horizontally */
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #e9ecef;
            border-radius: 20px;
            background-color: #f8f9fa;
            margin-bottom: 1px;
            width: 100%; /* Make cart items take up full width */
        }
        .item-details h5 {
            margin: 0;
            font-size: 16px;
        }
        .quantity-controls {
            display: flex;
            align-items: center;
        }
        .quantity-controls input[type="number"] {
            width: 40px;
            margin-right: 10px;
        }
        .empty-cart-msg {
            text-align: center;
            font-size: 18px;
            color: #6c757d;
        }
        .btn-custom {
            width: 150px; /* Adjust width */
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            color: white;
            text-decoration: none;
            font-size: 14px;
            border: none;
        }
        .btn-add-more {
            background-color: #28a745;
        }
        .btn-add-more:hover {
            background-color: #218838;
        }
        .btn-checkout {
            background-color: #007bff;
        }
        .btn-checkout:hover {
            background-color: #0056b3;
        }
        .cart-summary {
            background-color: #ffffff;
            border-top: 2px solid #e9ecef;
            padding: 5px;
            box-shadow: 0 -2px 5px rgba(0,0,0,0.1);
            text-align: center;
        }
        .fixed-bottom-buttons {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #ffffff;
            padding: 10px;
            box-shadow: 0 -2px 5px rgba(0,0,0,0.1);
            z-index: 1000;
            display: flex;
            justify-content: flex-end; /* Align buttons to the right */
            gap: 10px;
            padding-right: 20px; /* Add right padding for spacing */
        }

    </style>
</head>
<body>

<div class="top-bar">
    <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px;">
    <div class="secure-checkout">SECURE CHECKOUT</div>
</div>

<div class="container-custom">
    <div class="main-content">
        <div class="left-side">
            <img src="SwiggyImage.avif" alt="Top Image" class="top-image">
            <h3 class="mt-3">Account</h3>
            <p>To place your order now, log in to your existing account or sign up.</p>
            <div class="auth-buttons">
    
                <a href="Signin.jsp" class="signin-btn">Sign In</a>
            
                <a href="SignUp.jsp" class="signup-btn">Sign Up</a>
            </div>
        </div>
        <!-- Other content here -->
    </div>
</div>


        
        <div class="right-side">
            <div class="restaurant-info-right">
                <% 
                String restaurantName = (String) session.getAttribute("restaurantName");
                String imagePath = (String) session.getAttribute("imagePath");

                if (restaurantName != null && imagePath != null) {
                %>
                    <h2><%= restaurantName %></h2>
                    <img src="<%= request.getContextPath() + imagePath %>" alt="Image of <%= restaurantName %>" class="img-fluid small-image">
                <% 
                } else {
                %>
                    <p>No restaurant selected.</p>
                <% 
                } 
                %>
            </div>

            <div class="cart-items">
                <% 
                Cart cart = (Cart) session.getAttribute("cart");
                double totalAmount = 0;
                double tax = 0.10; // Example tax rate
                if (cart != null && !cart.getItems().isEmpty()) {
                    for (CartItem item : cart.getItems().values()) {
                        totalAmount += item.getPrice() * item.getQuantity();
                %>
                <div class="cart-item">
                    <div class="item-details">
                        <h5><%= item.getName() %></h5>
                        <p>Quantity: <%= item.getQuantity() %></p>
                        <p>Price: $<%= item.getPrice() %></p>
                    </div>
                    <div class="quantity-controls">
                        <form action="cart" method="post">
                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="quantity-input">
                            <button type="submit" name="action" value="update" class="btn btn-primary btn-sm">Update</button>
                        </form>
                        <form action="cart" method="post">
                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                            <button type="submit" name="action" value="remove" class="btn btn-danger btn-sm">Remove</button>
                        </form>
                    </div>
                </div>
                <% 
                    }
                } else {
                %>
                <div class="empty-cart-msg">
                    <p>Your cart is empty.</p>
                </div>
                <% 
                } 
                %>
            </div>

            <div class="cart-summary">
                <% 
                if (cart != null && !cart.getItems().isEmpty()) {
                    double taxAmount = totalAmount * tax;
                    double grandTotal = totalAmount + taxAmount;
                %>
                    <h5>Total Amount: $<%= totalAmount %></h5>
                    <h5>Tax: $<%= taxAmount %></h5>
                    <h5>Grand Total: $<%= grandTotal %></h5>
                <% 
                } 
                %>
            </div>
        </div>
    </div>
</div>

<div class="fixed-bottom-buttons">
    <a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>&restaurantName=<%= session.getAttribute("restaurantName") %>&imagePath=<%= session.getAttribute("imagePath") %>" class="btn btn-custom btn-add-more">Add More</a>
    <a href="javascript:void(0);" id="proceed-to-checkout" class="btn btn-custom btn-checkout" onclick="proceedToCheckout()">Proceed to Checkout</a>
</div>



<script>
        function proceedToCheckout() {
            // Check if the cart is empty
            var isEmpty = <%= (cart != null && !cart.getItems().isEmpty()) ? "false" : "true" %>;
            
            if (isEmpty) {
                // If the cart is empty, redirect to the menu page of the same restaurant
                window.location.href = "menu?restaurantId=<%= session.getAttribute("restaurantId") %>&restaurantName=<%= session.getAttribute("restaurantName") %>&imagePath=<%= session.getAttribute("imagePath") %>";
            } else {
                // If the cart is not empty, proceed to checkout
                window.location.href = "checkout.jsp";
            }
        }
    </script>



</body>
</html>
