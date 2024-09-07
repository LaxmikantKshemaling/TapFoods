<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Restaurant</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Existing CSS styles here */
        .top-bar {
            border: 1px solid #ccc;
            background-color: #fff;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            position: fixed;
            width: 100%;
            z-index: 999;
            top: 0;
        }

        .top-bar .logo {
            width: 40px;
            margin-right: 20px;
        }

        .top-bar .page-title {
            color: #ec7a08;
            font-size: 24px;
            font-weight: bold;
            flex-grow: 1;
            text-align: center;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            overflow-x: hidden;
        }

        .container {
            margin-top: 35px;
            padding: 20px;
        }

        .form-container {
            background: #fff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 2px auto;
            position: relative;
            overflow: hidden;
        }

        .form-header {
            position: sticky;
            top: 0;
            background: #fff;
            padding: 10px 20px;
            border-bottom: 1px solid #ccc;
            z-index: 1000;
        }

        .form-header h2 {
            color: #ec7a08;
            font-weight: 700;
        }

        .form-content {
            max-height: 400px; /* Adjust height as needed */
            overflow-y: auto;
        }

        .form-group label {
            font-weight: bold;
            color: #ec7a08;
            margin-bottom: 4px;
        }

        .form-control, .custom-select {
            border-radius: 25px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background-color: #ec7a08;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #b35905;
        }

        .modal-dialog {
            max-width: 80%;
        }

        .image-gallery img {
            cursor: pointer;
            margin: 5px;
            width: 100px; /* Adjust size as needed */
            height: 100px; /* Adjust size as needed */
        }

        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo"> 
        <h1 class="page-title">Add Restaurant</h1>
    </div>

    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <h2>Restaurant Details</h2>
            </div>
            <div class="form-content">
                <form id="restaurantForm" action="AddRestaurantServlet" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="restaurantName">Restaurant Name:</label>
                        <input type="text" class="form-control" id="restaurantName" name="restaurantName" placeholder="Enter Restaurant Name" required>
                    </div>
                    <div class="form-group">
                        <label for="imagePath">Image Path:</label>
                        <input type="file" class="form-control-file" id="imagePath" name="imagePath" required>
                    </div>
                    <!-- Other form fields -->
                    <div class="form-group">
                        <label for="rating">Rating:</label>
                        <input type="number" step="0.1" class="form-control" id="rating" name="rating" placeholder="Enter Rating" required>
                    </div>
                    <div class="form-group">
                        <label for="deliveryTime">Delivery Time (minutes):</label>
                        <input type="number" class="form-control" id="deliveryTime" name="deliveryTime" placeholder="Enter Delivery Time" required>
                    </div>
                    <div class="form-group">
                        <label for="cuisineType">Cuisine Type:</label>
                        <input type="text" class="form-control" id="cuisineType" name="cuisineType" placeholder="Enter Cuisine Type" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Enter Address" required>
                    </div>
                    <div class="form-group">
                        <label for="isActive">Active:</label>
                        <select class="custom-select" id="isActive" name="isActive">
                            <option value="true">Yes</option>
                            <option value="false">No</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="restaurantAdmin">Restaurant Admin ID:</label>
                        <input type="number" class="form-control" id="restaurantAdmin" name="restaurantAdmin" placeholder="Enter Admin ID" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Add Restaurant</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Gallery Modal -->
    <div class="modal fade" id="galleryModal" tabindex="-1" role="dialog" aria-labelledby="galleryModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="galleryModalLabel">Select Image</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="image-gallery">
                        <!-- Example images; these should be dynamically populated -->
                        <img src="path/to/image1.jpg" alt="Image 1" class="img-thumbnail" onclick="selectImage('path/to/image1.jpg')">
                        <img src="path/to/image2.jpg" alt="Image 2" class="img-thumbnail" onclick="selectImage('path/to/image2.jpg')">
                        <!-- Add more images here -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="loadingOverlay" class="loading-overlay">Loading...</div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.getElementById('restaurantForm').addEventListener('submit', function(event) {
            // Show loading overlay
            document.getElementById('loadingOverlay').style.display = 'flex';
            
            // Add an event listener to detect when the form is submitted successfully
            this.addEventListener('submit', function(event) {
                // Hide loading overlay
                document.getElementById('loadingOverlay').style.display = 'none';
                // Show success alert
                alert('Restaurant added successfully!');
            }, { once: true });
        });
    </script>
</body>
</html>
