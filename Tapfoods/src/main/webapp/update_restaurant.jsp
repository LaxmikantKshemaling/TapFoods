<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%@ page import="com.tap.model.Restaurant" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Restaurant</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            border: 1px solid #ddd; /* Subtle border */
        }
        h1 {
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }
        label {
            font-weight: bold;
            margin-top: 10px;
        }
        .form-control {
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .btn-primary {
            width: 100%;
            background-color: #ff5722;
            border: none;
            padding: 10px;
            font-size: 16px;
        }
        .btn-primary:hover {
            background-color: #e64a19;
        }
        .checkbox-label {
            font-weight: normal;
            margin-left: 5px;
        }
        .alert {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Restaurant</h1>

        <% 
            Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
            String successMessage = (String) request.getAttribute("successMessage"); // Get success message from request
            if (successMessage != null) {
        %>
        <div class="alert alert-success" role="alert" id="successAlert">
            <%= successMessage %>
        </div>
        <% 
            }
            if (restaurant != null) {
        %>
        <form action="Update" method="post" onsubmit="showSuccessAlert()">
            <input type="hidden" name="restaurantId" value="<%= restaurant.getRestauranId() %>">

            <div class="form-group">
                <label for="restaurantName">Restaurant Name</label>
                <input type="text" id="restaurantName" name="restaurantName" class="form-control" value="<%= restaurant.getRestaurantName() %>" required>
            </div>

            <div class="form-group">
                <label for="imagePath">Image Path</label>
                <input type="text" id="imagePath" name="imagePath" class="form-control" value="<%= restaurant.getImagePath() %>" required>
            </div>

            <div class="form-group">
                <label for="rating">Rating</label>
                <input type="number" step="0.1" id="rating" name="rating" class="form-control" value="<%= restaurant.getRating() %>" required>
            </div>

            <div class="form-group">
                <label for="deliveryTime">Delivery Time (in minutes)</label>
                <input type="number" id="deliveryTime" name="deliveryTime" class="form-control" value="<%= restaurant.getDeliveryTime() %>" required>
            </div>

            <div class="form-group">
                <label for="cuisineType">Cuisine Type</label>
                <input type="text" id="cuisineType" name="cuisineType" class="form-control" value="<%= restaurant.getCuisineType() %>" required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" class="form-control" value="<%= restaurant.getAddress() %>" required>
            </div>

            <div class="form-group form-check">
                <input type="checkbox" id="isActive" name="isActive" class="form-check-input" <%= restaurant.isActive() ? "checked" : "" %>>
                <label class="form-check-label checkbox-label" for="isActive">Is Active</label>
            </div>

            <div class="form-group">
                <label for="restaurantAdmin">Admin ID</label>
                <input type="number" id="restaurantAdmin" name="restaurantAdmin" class="form-control" value="<%= restaurant.getRestaurantAdmin() %>" required>
            </div>

            <button type="submit" class="btn btn-primary">Update Restaurant</button>
        </form>
        <% 
            } else { 
                out.println("<div class='alert alert-danger' role='alert'>No restaurant found with the provided ID.</div>");
            }
        %>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function showSuccessAlert() {
            var alert = document.getElementById('successAlert');
            if (alert) {
                alert.style.display = 'block';
                setTimeout(function() {
                    alert.style.display = 'none';
                }, 5000); // Hide alert after 5 seconds
            }
        }

        // Hide the success alert initially
        document.addEventListener('DOMContentLoaded', function() {
            var alert = document.getElementById('successAlert');
            if (alert) {
                alert.style.display = 'none';
            }
        });
    </script>
</body>
</html>
