<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .top-bar {
            display: flex;
            align-items: center;
            background-color: #333;
            color: white;
            padding: 10px;
        }
        .top-bar .logo {
            width: 50px;
            margin-right: 20px;
        }
        .top-bar h1 {
            flex: 1;
            text-align: center;
            margin: 0;
        }
        .container {
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
            color: #333;
        }
        td img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }
        .rating {
            color: #f5b301;
        }
        .rating .fa {
            color: #f5b301;
        }
        .price {
            font-size: 1.2em;
            color: #e94e77;
        }
        .availability {
            color: #007bff;
        }
        .action-buttons button {
            margin: 5px;
        }
        .add-menu {
            margin-top: 20px;
            text-align: right;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <img src="path_to_logo" alt="Logo" class="logo">
        <h1>Menu</h1>
    </div>

    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Rating</th>
                    <th>Price</th>
                    <th>Availability</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
                    String errorMessage = (String) request.getAttribute("error");

                    if (errorMessage != null) {
                %>
                    <tr>
                        <td colspan="8"><%= errorMessage %></td>
                    </tr>
                <% } else if (menuList != null && !menuList.isEmpty()) {
                        for (Menu menuitem : menuList) {
                            int fullStars = (int) Math.floor(menuitem.getRating());
                            boolean halfStar = menuitem.getRating() % 1 >= 0.5;
                %>
                <tr>
                    <td><%= menuitem.getMenuId() %></td>
                    <td><img src="<%= request.getContextPath() + menuitem.getMenuimagePath() %>" alt="Image of <%= menuitem.getName() %>"></td>
                    <td><%= menuitem.getName() %></td>
                    <td><%= menuitem.getDescription() %></td>
                    <td>
                        <div class="rating">
                            <% for (int i = 1; i <= 5; i++) { %>
                                <span class="fa fa-star <%= i <= fullStars ? "checked" : "" %>"></span>
                            <% } %>
                            <% if (halfStar) { %>
                                <span class="fa fa-star-half-o checked"></span>
                            <% } %>
                        </div>
                    </td>
                    <td class="price"><%= menuitem.getPrice() %></td>
                    <td class="availability"><%= menuitem.isAvailable() ? "Available" : "Not Available" %></td>
                    <td class="action-buttons">
                        <!-- Edit Menu -->
                        <form action="editMenu" method="post" style="display:inline;">
                            <input type="hidden" name="menuId" value="<%= menuitem.getMenuId() %>">
                            <button type="submit">Edit</button>
                        </form>
                        <!-- Delete Menu -->
                        <form action="deleteMenu" method="post" style="display:inline;">
                            <input type="hidden" name="menuId" value="<%= menuitem.getMenuId() %>">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="8">No menu items available</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Add New Menu -->
        <div class="add-menu">
            <form action="addMenu" method="post">
                <input type="hidden" name="restaurantId" value="<%= request.getParameter("restaurantId") %>">
                <button type="submit">Add New Menu</button>
            </form>
        </div>
    </div>
</body>
</html>
