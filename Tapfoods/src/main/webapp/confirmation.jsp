<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.model.OrderTable"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Payment Successfully</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
        }
        .top-bar {
            background-color: #ffffff;
            color: #ff9933;
            padding: 25px;
            border-bottom: 3px solid #dee2e6;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: center; /* Center align the text */
            position: relative;
        }
        .top-bar .logo {
            position: absolute;
            left: 15px; /* Adjust as needed */
            top: 50%;
            transform: translateY(-50%);
        }
        .logo {
            height: 40px;
            margin-right: 10px;
        }
        .top-bar h1 {
            color: #000000; /* Change color to black */
            font-size: 1.2em; /* Decrease font size */
            margin: 0;
            text-align: center;
        }
        .order-container {
            margin: 30px auto;
            max-width: 500px;
        }
        .order-details {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
        }
        .order-details:hover {
            transform: translateY(-10px);
        }
        .order-details h2 {
            font-size: 1.5em;
            margin-bottom: 15px;
            color: #28a745;
            text-align: center;
        }
        .order-details p {
            font-size: 0.9em;
            margin-bottom: 10px;
            color: #555;
        }
        /* Custom alert styling */
        .alert-success-custom {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            text-align: center;
            font-size: 1.1em;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            display: none; /* Hidden by default */
        }
        .btn-confirm {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            font-size: 1em;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            display: block;
            width: 100%;
            margin-top: 15px;
        }
        .btn-confirm:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        /* Modal styles */
        .modal-content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        .modal-body {
            font-size: 1.2em;
            color: #555;
        }
        .spinner-border {
            width: 3rem;
            height: 3rem;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px;">
        <h1 class="m-0">Payment Successfully</h1>
    </div>

    <div class="container order-container">
        <%
        OrderTable orderTable = (OrderTable) session.getAttribute("orderList");
        Boolean isMessageShown = (Boolean) session.getAttribute("messageShown");

        if (orderTable != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            if (isMessageShown == null || !isMessageShown) {
                session.setAttribute("messageShown", true);
                %>
                <div id="successAlert" class="alert-success-custom">
                    Payment Completed! Your order will arrive soon.
                </div>
                <%
            } else {
                %>
                <div id="successAlert" class="alert-success-custom" style="display: none;">
                    Payment Completed! Your order will arrive soon.
                </div>
                <%
            }
        %>
        
        <div class="order-details">
            <h2>Thank You For Your Payment!</h2>
            <p><strong>Order ID:</strong> <%= orderTable.getOrderTableId() %></p>
            <p><strong>User ID:</strong> <%= orderTable.getUserId() %></p>
            <p><strong>Restaurant ID:</strong> <%= orderTable.getRestaurantId() %></p>
            <p><strong>Order Date:</strong> <%= sdf.format(orderTable.getOrderDate()) %></p>
            <p><strong>Payment Method:</strong> <%= orderTable.getModeOfPayment() %></p>
            <p><strong>Total Amount:</strong> $<%= orderTable.getTotalAmount() %></p>
            <p><strong>Status:</strong> <%= orderTable.getStatus() %></p>
            <p><strong>Address:</strong> <%= orderTable.getAddress() %></p>
            <p><strong>Phone Number:</strong> <%= orderTable.getPhoneNo() %></p>
            <input type="hidden" name="orderTableId" value="<%= orderTable.getOrderTableId() %>">
            <button id="confirm-btn" type="button" class="btn btn-confirm" onclick="showLoadingAndMessage()">Confirm Payment</button>
        </div>
        
        <%
        } else {
        %>
        <div class="alert alert-warning" role="alert">
            No order found!
        </div>
        <%
        }
        %>
    </div>

    <!-- Modal for loading and success message -->
    <div class="modal fade" id="loadingModal" tabindex="-1" role="dialog" aria-labelledby="loadingModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="spinner-border text-primary" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                    Processing your payment, please wait...
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function showLoadingAndMessage() {
            // Show the loading modal
            $('#loadingModal').modal('show');

            // Simulate a delay for the payment processing
            setTimeout(function() {
                // Hide the loading modal
                $('#loadingModal').modal('hide');
                
                // Display the success alert
                document.getElementById('successAlert').style.display = 'block';
                
                // Optional: Automatically hide the alert after a few seconds
                setTimeout(function() {
                    document.getElementById('successAlert').style.display = 'none';
                }, 5000);
            }, 3000); // Simulated delay of 3 seconds
        }
    </script>
</body>
</html>
