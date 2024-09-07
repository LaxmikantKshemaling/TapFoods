<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.OrderTable"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Orders</title>
    <link rel="stylesheet" href="path/to/your/styles.css">
</head>
<body>
    <h1>Manage Orders</h1>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Restaurant Name</th>
            <th>Items</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <% 
        List<OrderTable> orders = (List<OrderTable>) request.getAttribute("orderTableList");
        if (orders != null) {
            for (OrderTable order : orders) { 
        %>
        <tr>
            <td><%= order.getOrderTableId() %></td>
            <td><%= order.getRestaurantId() %></td>
            <td><!-- Add logic to display items --></td>
            <td><%= order.getStatus() %></td>
            <td>
                <form action="UpdateOrderStatusServlet" method="post">
                    <input type="hidden" name="orderId" value="<%= order.getOrderTableId() %>">
                    <button name="status" value="Accepted">Accept</button>
                    <button name="status" value="Canceled">Cancel</button>
                </form>
            </td>
        </tr>
        <% 
            }
        } else { 
        %>
        <tr>
            <td colspan="5">No orders available.</td>
        </tr>
        <% 
        } 
        %>
    </table>
</body>
</html>
