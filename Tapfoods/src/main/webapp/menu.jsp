<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>
<%@ page import="java.util.List" %>

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

/* Restaurant info styles */
.restaurant-info {
    text-align: center;
    margin-top: 60px; /* Adjust margin to account for the top bar */
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.restaurant-info img {
    width: 150px;
    height: auto;
    border-radius: 10px;
    margin-bottom: 10px;
}

.restaurant-info h2 {
    margin-top: 0;
    font-size: 1.5rem;
}

/* Search form styles */
.search-form {
    text-align: center;
    padding: 20px;
    background-color: #fff;
    margin: 20px auto;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.search-form input[type="text"],
.search-form input[type="number"] {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-right: 10px;
}

.search-form input[type="number"] {
    width: 120px;
}

.search-form button {
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.search-form button:hover {
    background-color: #0056b3;
}

/* Menu container styles */
.menu-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
}

.menu-item {
    width: 80%;
    margin-bottom: 20px;
    display: flex;
    align-items: flex-start;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 10px;
}

.menu-item img {
    height: 120px;
    width: 150px;
    object-fit: cover;
    margin-right: 15px;
}

.menu-item-details {
    flex: 1;
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
    color: rgb(238, 156, 5);
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
    width: 50px;
    padding: 5px;
    font-size: 1rem;
}
</style>
</head>
<body>
    <div class="top-bar">
        <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px;">
        
        <h1 style="margin-right: auto; margin-left: 350px;">Welcome Menu</h1>
    </div>

    <br><br><br><br><br>

    <!-- Search Form -->
    <div class="search-form">
        <form action="menu" method="get">
            <input type="text" name="search" placeholder="Search by name" value="${param.search}">
            <input type="number" name="rating" step="0.1" placeholder="Min rating" value="${param.rating}">
            <input type="number" name="minPrice" step="0.01" placeholder="Min price" value="${param.minPrice}">
            <input type="number" name="maxPrice" step="0.01" placeholder="Max price" value="${param.maxPrice}">
            <button type="submit">Search</button>
        </form>
    </div>
    
    <%
    String category = request.getParameter("category");
    List<Menu> menuItems = (List<Menu>) request.getAttribute("menuList");
%>
    

    <div class="restaurant-info">
    <% 
    String restaurantId = (String) request.getAttribute("restaurantId");
    String restaurantName = (String) request.getAttribute("restaurantName");
    String imagePath = (String) request.getAttribute("imagePath");
        if (restaurantName != null && imagePath != null) {
    %>
    <h2>Menu for <%= restaurantName %></h2>
    <img src="<%= request.getContextPath() + imagePath %>" alt="Image of <%= restaurantName %>">
    <% 
        } else {
            // Handle case where attributes are not set (fallback logic)
            restaurantName = request.getParameter("restaurantName");
            imagePath = request.getParameter("imagePath");
            if (restaurantName != null && imagePath != null) {
    %>
    <h2>Restaurant <%= restaurantName %></h2>
    <img src="<%= request.getContextPath() + imagePath %>" alt="Image of <%= restaurantName %>">
    <% 
            } else {
                // Optional: Handle the case where neither session nor request parameters are set
    %>
    <p>Restaurant information is not available.</p>
    <% 
            }
        }
    %>
</div>




    <!-- Menu Items -->
    
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
            <img src="<%= request.getContextPath() + menuitem.getMenuimagePath() %>" alt="Image of <%= menuitem.getName() %>">
            <div class="menu-item-details">
                <h3><%= menuitem.getName() %></h3>
                <p><%= menuitem.getDescription() %></p>
                <div class="rating">
                    <span class="fa fa-star checked"></span>
                    <span><%= menuitem.getRating() %></span>
                </div>
                <p>Price: <%= menuitem.getPrice() %></p>
                
                <form action="cart" method="post">
                    Quantity:<input type="number" name="quantity" value="1" min="1">
                    <input type="hidden" name="itemId" value="<%= menuitem.getMenuId() %>">
                    <input type="submit" value="Add" class="add-to-cart-btn">
                    <input type="hidden" name="action" value="add">
                </form>
            </div>
        </div>
        <% 
                }
            } else {
        %>
        <p>No menu items available for this restaurant.</p>
        <% 
            } 
        %>
    </div>
</body>
</html>




