<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List, com.tap.model.Restaurant" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant List</title>
    <link rel="stylesheet" href="path/to/your/styles.css">
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }
    .top-bar {
        background-color: #fff;
        color: #333;
        padding: 15px;
        border-bottom: 2px solid #ddd;
        display: flex;
        align-items: center;
        justify-content: center;
        position: fixed;
        width: 100%;
        top: 0;
        left: 0;
        z-index: 1000;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .top-bar .logo {
        width: 50px;
        height: auto;
        position: absolute;
        left: 15px;
    }
    .top-bar h1 {
        margin: 0;
        font-size: 28px;
        text-align: center;
    }
    .content {
        margin-top: 80px;
        padding: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        border: 1px solid #ddd;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    td img {
        max-width: 100px;
        height: auto;
    }
    button {
        color: #fff;
        border: 2px solid #000;
        padding: 8px 12px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
        font-size: 14px;
        margin: 2px;
    }
    .update-btn {
        background-color: #FF4500;
        border-color: #FF4500;
    }
    .update-btn:hover {
        background-color: #FF6347;
    }
    .delete-btn {
        background-color: #fff;
        color: #FF6347;
        border-color: #FF6347;
    }
    .delete-btn:hover {
        background-color: #FF4500;
        color: #fff;
    }
    .no-data {
        text-align: center;
        padding: 20px;
        color: #666;
    }
    </style>
</head>
<body>
    <div class="top-bar">
        <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo">
        <h1>Restaurant List</h1>
    </div>

    <div class="content">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Rating</th>
                    <th>Delivery Time</th>
                    <th>Cuisine Type</th>
                    <th>Address</th>
                    <th>Active</th>
                    <th>Admin ID</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurant");
                    if (restaurants != null && !restaurants.isEmpty()) {
                        for (Restaurant restaurant : restaurants) { 
                %>
                    <tr>
                        <td><%= restaurant.getRestauranId() %></td>
                        <td><%= restaurant.getRestaurantName() %></td>
                        <td>
                            <a href="MenuListServlet?restaurantId=<%= restaurant.getRestauranId() %>&restaurantName=<%= URLEncoder.encode(restaurant.getRestaurantName(), "UTF-8") %>&imagePath=<%= URLEncoder.encode(restaurant.getImagePath(), "UTF-8") %>">
                                <img src="<%= request.getContextPath() + restaurant.getImagePath() %>" alt="Image of <%= restaurant.getRestaurantName() %>">
                            </a>
                        </td>
                        <td><%= restaurant.getRating() %></td>
                        <td><%= restaurant.getDeliveryTime() %></td>
                        <td><%= restaurant.getCuisineType() %></td>
                        <td><%= restaurant.getAddress() %></td>
                        <td><%= restaurant.isActive() ? "Yes" : "No" %></td>
                        <td><%= restaurant.getRestaurantAdmin() %></td>
                        <td>
                            <form action="ListRestaurantsServlet" method="post" style="display:inline;">
                                <input type="hidden" name="restaurantId" value="<%= restaurant.getRestauranId() %>">
                                <button type="submit" name="action" value="update" class="update-btn">Update</button>
                            </form>
                            <form action="ListRestaurantsServlet" method="post" style="display:inline;">
                                <input type="hidden" name="restaurantId" value="<%= restaurant.getRestauranId() %>">
                                <button type="submit" name="action" value="delete" class="delete-btn">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% 
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="10" class="no-data">No restaurants found.</td>
                    </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
