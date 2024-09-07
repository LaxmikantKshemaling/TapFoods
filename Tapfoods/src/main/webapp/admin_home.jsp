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
            margin: 0; /* Remove default margin */
        }
        .navbar {
            background-color: #212529; /* Dark navbar for a sleek look */
        }
        .navbar-brand {
    font-weight: bold;
    font-size: 1.5em;
    color: #ff9933; /* Saffron color */
    margin: 0 auto; /* Centering heading */
}

        .navbar-nav {
            margin-left: auto;
        }
        .navbar-nav .nav-link {
            color: #f8f9fa;
            font-size: 1.2em;
            padding: 15px 20px;
            transition: background-color 0.3s;
        }
        .navbar-nav .nav-link:hover {
            background-color: #495057;
            border-radius: 5px;
        }
        .navbar-toggler {
            border: none;
        }
        .container {
            margin-top: 70px;
        }
        .left-sidebar {
            position: fixed;
            top: 70px; /* Move sidebar below the navbar */
            left: 0;
            padding: 5px;
            width: 200px;
            background-color: #343a40;
            border-right: 1px solid #495057;
            height: calc(100vh - 290px); /* Full height minus navbar */
            overflow-y: auto; /* Scroll if needed */
        }
        .left-sidebar h1 {
            color: #ff5733; /* Changed color */
            margin-bottom: 20px; /* Reduced bottom margin */
        }
        .left-sidebar .nav-link {
            color: #f8f9fa;
            padding: 10px;
            border-bottom: 1px solid #495057;
            text-align: left;
        }
        .left-sidebar .nav-link:hover {
            background-color: #495057;
            border-radius: 5px;
        }
        .btn-signin {
            background-color: #007bff; /* Blue color for Sign In */
            color: #fff;
            border-radius: 30px;
            padding: 10px 20px;
            font-size: 1em;
        }
        .btn-signin:hover {
            background-color: #0056b3; /* Darker blue for hover effect */
        }
        .btn-signup {
            background-color: #dc3545; /* Red color for Sign Up */
            color: #fff;
            border-radius: 30px;
            padding: 10px 20px;
            font-size: 1em;
        }
        .btn-signup:hover {
            background-color: #c82333; /* Darker red for hover effect */
        }
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
        .modal-content {
            background-color: #343a40; /* Dark gray background color */
            color: #ffffff; /* White text color */
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <a class="navbar-brand" href="#">Restaurant Admin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#loginModal"><i class="fa fa-sign-in"></i> Sign In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#registerModal"><i class="fa fa-user-plus"></i> Sign Up</a>
                </li>
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
            
            
            <li class="nav-item">
                <a class="nav-link" href="#"> Add MenuItem</a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="vieworders.jsp">Manage Orders</a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="container">
        <!-- Your main content goes here -->
    </div>

    <!-- Login Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Login</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="loginEmail">Email address</label>
                            <input type="email" class="form-control" id="loginEmail" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="loginPassword">Password</label>
                            <input type="password" class="form-control" id="loginPassword" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-custom btn-block">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Register Modal -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLabel">Register</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="registerName">Name</label>
                            <input type="text" class="form-control" id="registerName" placeholder="Enter name">
                        </div>
                        <div class="form-group">
                            <label for="registerEmail">Email address</label>
                            <input type="email" class="form-control" id="registerEmail" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="registerPassword">Password</label>
                            <input type="password" class="form-control" id="registerPassword" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-custom btn-block">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
