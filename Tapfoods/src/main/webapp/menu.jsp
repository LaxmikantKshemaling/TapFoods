<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.tap.model.Menu"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu</title>
<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
/* Custom styles */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	overflow-x: hidden;
	background-color: #f4f4f4;
}

/* Top bar styles */
.top-bar {
	border: 1px solid #ccc;
	background-color: #fff;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: fixed;
	width: 100%;
	z-index: 999;
	top: 0;
}

.top-bar a {
	color: rgba(0, 0, 0, 0.918);
	text-decoration: none;
}

.top-bar a:hover {
	color: #ec7a08;
}

.logo {
	width: 80px;
	transition: opacity 0.3s ease;
}

.logo:hover {
	animation: blink 1s infinite;
}
/* Menu container styles */
.menu-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-top: 60px;
    padding: 20px;
    overflow-y: auto;
}

.menu-item {
    width: 800px; /* Adjust the width as needed */
    margin-bottom: 20px;
    display: flex;
    align-items: flex-start; /* Align items at the start of the container */
    background-color: #fff;
    border: 1px solid #ccc; /* Border around each menu item */
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.menu-item img {
    height: 180px; /* Adjust the height as needed */
    width: auto;
    object-fit: cover;
    margin-right: 5px; /* Add margin to separate the image from details */
}

.menu-item-details {
    flex: 1;
    padding: 20px;
}

.menu-item h3 {
    margin-top: 0;
    font-size: 1.2rem;
    margin-bottom: 10px;
}

.menu-item p {
    margin: 0;
    font-size: 1rem;
}

.menu-item .rating {
    margin-bottom: 10px;
}
.checked {
    color: rgb(238, 156, 5); /* Change the color to the desired RGB value */
}

.menu-item .add-to-cart-btn {
    margin-top: 10px;
    padding: 5px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}

.menu-item .add-to-cart-btn:hover {
    background-color: #0056b3;
}
.add-to-cart-btn {
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}

.add-to-cart-btn:hover {
    background-color: #0056b3;
}

/* Adjust the size of the quantity input */
input[type="number"] {
    width: 50px; /* Adjust the width as needed */
    padding: 5px; /* Adjust the padding as needed */
    font-size: 1rem; /* Adjust the font size as needed */
}
</style>
</head>
<body>
	<div class="top-bar">
		<img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo"
			class="logo" style="width: 40px;"> <img src="tapfood.png"
			alt="Logo" class="logo" style="margin-left: 5px;">
		<h1 style="margin-right: auto; margin-left: 350px;">Welcome Menu</h1>
	</div>
	<br>
	<br>
	<br>
	<div class="menu-container">
    <% 
        // Retrieve menuList from request attributes
        List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
        // Check if menuList is not null and not empty
        if (menuList != null && !menuList.isEmpty()) {
            // Iterate through each menu item in the menuList
            for (Menu menuitem : menuList) {
    %>
    <div class="menu-item">
        <div class="menu-item-details">
            <!-- Display menu item name -->
            <h3><%= menuitem.getName() %></h3>
            <!-- Display menu item description -->
            <p><%= menuitem.getDescription() %></p>
            <div class="rating">
                <!-- Display star rating -->
                <span class="fa fa-star checked"></span>
                <!-- Display menu item rating -->
                <span><%= menuitem.getRating() %></span>
            </div>
            <!-- Display menu item price -->
            <p>Price: <%= menuitem.getPrice() %></p>
            
            
            
            
            
            <!-- Form to add item to cart -->
            <form action="cart" method="post">
                <!-- Input field for quantity -->
                Quantity:<input type="number" name="quantity" value="1" min="1">
                <!-- Hidden input field for item ID -->
                <input type="hidden" name="itemId" value="<%= menuitem.getMenuId() %>">
                <!-- Submit button to add item to cart -->
                <input type="submit" value="Add" class="add-to-cart-btn">
                <!-- Hidden input field for action -->
                <input type="hidden" name="action" value="add">
            </form>
            
            
            
            
            
        </div>
        <!-- Display menu item image -->
        <img src="<%= request.getContextPath() + menuitem.getImagePath() %>" alt="Image of <%= menuitem.getName() %>">
    </div>
    <% 
            }
        } else { 
    %>
    <!-- Display message if no menu items available -->
    <p>No menu items available</p>
    <% 
        } 
    %>
</div>

</body>
</html>
