<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Admin Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
            color: #333;
            margin: 0;
        }

        /* Top Layout */
        .navbar {
            background-color: white;
            border-bottom: 2px solid #ffffff; /* Set navbar border color to white */
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5em;
            color: #ff9933; /* Set restaurant admin text to saffron color */
            margin: 0 auto;
        }
        .navbar-nav .nav-link {
            color: #212529;
            font-size: 1.2em;
        }
        .navbar-toggler {
            border: none;
        }

        /* Left Sidebar */
        .left-sidebar {
            position: fixed;
            top: 70px;
            left: 0;
            padding: 5px;
            width: 150px; /* Adjusted width for better alignment */
            background-color: #ff9933;
            border-right: 1px solid #495057;
            height: calc(100vh - 400px); /* Adjusted height to fit the viewport */
            overflow-y: auto;
        }
        .left-sidebar h1 {
            color: #fff;
            margin-bottom: 20px;
        }
        .left-sidebar .nav-link {
            color: #fff;
            padding: 10px;
            border-bottom: 1px solid #495057;
        }

        /* Image */
        .left-section .logo {
            width: 40px;
            margin-right: 10px;
        }

        /* Buttons */
        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border-radius: 30px;
            padding: 10px 20px;
            font-size: 1em;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="left-section">
            <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo">
        </div>
        <a class="navbar-brand" href="#">Restaurant Admin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                
            </ul>
        </div>
    </nav>

    <!-- Left Sidebar for Admin Actions -->
    <div class="left-sidebar">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="ListRestaurantsServlet">All Restaurant</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="add_restaurnt.jsp">Add Restaurant</a>
            </li>
            
        </ul>
    </div>

    <!-- Main Content -->
    <div class="container" style="background-color: white; margin-top: 70px;">
        <!-- Your main content goes here -->
    </div>

    <!-- Modals, Scripts, and Footer (unchanged) -->
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
