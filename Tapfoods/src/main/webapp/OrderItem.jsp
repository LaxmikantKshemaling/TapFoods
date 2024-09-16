<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.OrderItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Items</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .top-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #fff;
            padding: 10px;
            color: #000;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }

        .top-bar .left-section {
            display: flex;
            align-items: center;
        }

        .top-bar .right-section {
            display: flex;
            align-items: center;
        }

        .top-bar img.logo {
            height: 50px;
            margin-right: 10px;
        }

        .top-bar form {
            display: flex;
            align-items: center;
        }

        .top-bar form .form-control {
            border-radius: 20px;
            margin-right: 10px;
        }

        .title-section {
            flex: 1;
            text-align: center;
            background-color: #fff; /* White background */
            color: #ff9933; /* Bhagava color */
            padding: 10px;
            font-size: 1.9rem;
        }

        .container {
            margin-top: 130px;
        }

        .table-container {
            max-height: 60vh;
            overflow-y: auto;
            border: 1px solid #ff9933; /* Bhagava color (light orange) */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0px;
            background-color: #fff;
        }

        .table thead th {
            position: sticky;
            top: 0;
            background-color: #fff; /* White background for header */
            color: #ff9933; /* Bhagava color for text */
            z-index: 10;
            text-align: center;
            border-bottom: 1px solid #ff9933; /* Border color to match the text */
        }

        .table tbody tr:nth-child(even) {
            background-color: #e9ecef;
        }

        .table tbody tr:hover {
            background-color: #dee2e6;
        }

        .table td {
            text-align: center;
        }

        .no-data {
            text-align: center;
            font-style: italic;
        }
    </style>
</head>
<body>
    <!-- Top Bar Layout -->
    <div class="top-bar">
        <div class="left-section">
            <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px;">
        </div>

        <!-- Title Section -->
        <div class="title-section">
            Order Items
        </div>
    </div>

    <div class="container">
        <!-- Scrollable Table to display order items -->
        <div class="table-container">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Order Item ID</th>
                        <th>Order Table ID</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Name</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<OrderItem> orderItemList = (List<OrderItem>) request.getAttribute("orderItemList");
                    if (orderItemList != null && !orderItemList.isEmpty()) {
                        for (OrderItem orderItem : orderItemList) {
                    %>
                    <tr>
                        <td><%= orderItem.getOrderItemId() %></td>
                        <td><%= orderItem.getOrderTableId() %></td>
                        <td><%= orderItem.getQuantity() %></td>
                        <td><%= orderItem.getPrice() %></td>
                        <td><%= orderItem.getName() %></td>
                        <td><%= orderItem.getTotalPrice() %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" class="no-data">No items found for this order.</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
