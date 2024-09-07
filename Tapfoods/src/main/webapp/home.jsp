<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.tap.model.Restaurant" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TapFoods</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Include Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.top-bar {
        border-bottom: 1px solid #ccc;
        background-color: #fff;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        z-index: 999;
        position: fixed;
        top: 0;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        position: sticky;
    top: 0;
    z-index: 1000;
    }

    .profile-modal .modal-dialog {
        max-width: 300px;
    }
    
    .profile-modal .modal-content {
        border-radius: 10px;
    }

    .profile-modal .modal-header {
        border-bottom: none;
    }

    .profile-modal .modal-body {
        padding: 15px;
    }

    .profile-modal .modal-body a {
        display: block;
        padding: 10px;
        color: #007bff;
        text-decoration: none;
        font-size: 16px;
    }

    .profile-modal .modal-body a:hover {
        text-decoration: underline;
    }

    .icon-bar a {
        margin-left: 15px;
        color: #333;
        text-decoration: none;
        font-size: 16px;
        position: relative;
    }

    .icon-bar a:hover {
        color: #ff9933;
    }

    .icon-bar .profile-icon {
        position: relative;
    }

    .icon-bar .profile-icon .fa {
        font-size: 18px;
    }

    .top-bar img.logo {
        width: 40px;
        margin-right: 15px;
    }

    .search-bar {
        width: 300px;
        position: relative;
        background-color: #fff;
        border-radius: 20px;
        padding: 8px 40px 8px 20px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .search-bar input {
        width: 100%;
        border: none;
        outline: none;
    }

    .search-bar i {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #555;
    }

    .icon-bar {
        display: flex;
        align-items: center;
    }

    .icon-bar a {
        margin-left: 15px;
        color: #333;
        text-decoration: none;
        font-size: 16px;
    }

    .icon-bar a:hover {
        color: #ff9933;
    }
.display-bar {
    position: relative;
    background: linear-gradient(to bottom, #f3f2f5, #e4bff4);
    padding: 100px 20px; /* Increased padding for better spacing */

    border-radius: 20px;
}

.heading-border {
    padding: 10px;
    display: inline-block;
    margin-right: 20px;
    color: black;
    font-size: 30px;
    font-weight: bold;
}

.right-image {
    position: absolute;
    bottom: 20px; /* Adjusted position to move the image down */
    right: 20px; /* Adjusted position to move the image down */
    max-width: 400px;
    height: auto;
    padding: 10px;
    border-radius: 20px;
    overflow: hidden;
    background-color: transparent;
}

.Itemenu-heading h3 {
  text-align:left; /* Align the text to the right */
  margin-left: 142px; /* Add margin to the left side */
  font-size: 25px; /* Set the font size to your desired value */
  font-weight: bold; /* Make the font bold */
  margin-right: 10px; /* Adjust as needed */
}


/* Basic styling */
        .itemmenu-container {
            width: 100%;
            overflow-x: auto;
            padding: 10px 0;
        }

        .itemmenu-bar {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            overflow-x: auto;
        }

        .scroll-wrapper {
            display: flex;
            gap: 20px;
        }

        .item {
            min-width: 150px;
            text-align: center;
        }

        .item img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            transition: transform 0.3s ease-in-out;
        }

        .item img:hover {
            transform: scale(1.05);
        }

        .item a {
            text-decoration: none;
            color: inherit;
        }

.direction-buttons {
  float: right; /* Align buttons to the right */
  margin-top:-45px ;
  margin-right:120px ;
}

.direction-buttons .btn {
  color: #000; /* Set button text color */
  text-decoration: none; /* Remove underline */
}

.direction-buttons .btn i {
  margin-right: 5px; /* Adjust margin between icon and text */
}

.direction-buttons .btn:hover {
  color: #007bff; /* Change color on hover */
}
.scroll-wrapper {
    overflow-x: auto;
    white-space: nowrap;
    padding: 0 20px;
    border-bottom: 2px solid transparent;
    max-width: 100%;
    overflow-y: hidden;
}

.scroll-wrapper::-webkit-scrollbar {
    display: none;
}

.Itemmenu-bar {
  padding: 10px 0;
  border-bottom: 1px solid #ccc; /* Horizontal line */
  margin-right: 130px; /* Add margin to the right side */
  margin-left: 130px;
}

.itemmenu-container {
  display: inline-block;
  margin-right: 20px;
  border-right: 1px solid #ccc; /* Vertical line */
  padding-right: 20px;
  padding: 0 20px; /* Add padding to the left and right */
  border-bottom: 2px solid transparent; /* Add a transparent border */
  max-width: 100%; /* Set maximum width to 100% */
  overflow-y: hidden; /* Hide vertical scrollbar if present */
}

.scroll-wrapper {
  overflow-x: auto; /* Enable horizontal scrolling */
  white-space: nowrap; /* Prevent wrapping of items */
  padding: 0 20px; /* Add padding to the left and right */
  border-bottom: 2px solid transparent; /* Add a transparent border */
  max-width: 100%; /* Set maximum width to 100% */
  overflow-y: hidden; /* Hide vertical scrollbar if present */
}

.scroll-wrapper::-webkit-scrollbar {
  display: none; /* Hide the scrollbar */
}


.scroll-wrapper::-webkit-scrollbar {
  display: none; /* Hide the scrollbar */
  width: 12px; /* Hide the scrollbar */
  background-color: transparent; /* Set the background color of the scrollbar to transparent */
  background-color: white; /* Set the color of the scrollbar thumb */
  border-radius: 6px; /* Set the border radius of the scrollbar thumb */
  background-color: #ccc; /* Change color on hover */
}


.item {
  display: inline-block; /* Display the items inline */
  margin-right: 20px; /* Adjust margin between items */
  text-align: center; /* Center align the content within each item */
}
.item a {
  display: inline-block;
}
.item a:hover img {
  opacity: 0.7; /* Reduce opacity on hover */
  cursor: pointer; /* Change cursor on hover */
}

.img {
  width: 180px;
  height: auto;
  margin-bottom: 10px;
  background-color: white; /* Add white background */
}

.img {
  width: 180px;
  height: 180px; /* Ensure all images have the same height */
  object-fit: cover; /* Maintain aspect ratio and cover the container */
  margin-bottom: 10px;
  background-color: white; /* Add white background */
}

 /* Restaurant List */
    .restaurant-heading {
        margin: 30px 20px 10px;
        font-size: 30px;
        font-weight: bold;
        color: #333;
    }

    .restaurant-row {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin: 20px;
    }

    .restaurant-card {
        width: calc(33.33% - 20px);
        margin-bottom: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        overflow: hidden;
        transition: transform 0.3s ease;
    }

    .restaurant-card:hover {
        transform: translateY(-5px);
    }

    .restaurant-card img {
        width: 100%;
        height: 180px;
        object-fit: cover;
    }

    .restaurant-info {
        padding: 15px;
    }

    .restaurant-info h3 {
        margin: 0;
        font-size: 20px;
        color: #333;
    }

    .restaurant-info p {
        margin: 5px 0;
        font-size: 14px;
        color: #777;
    }

    .restaurant-info .rating {
        margin: 10px 0;
    }

    .restaurant-info .rating .fa-star {
        color: #ffcc00;
    }

    .restaurant-info a {
        display: inline-block;
        padding: 8px 15px;
        background-color: #007bff;
        color: #fff;
        border-radius: 5px;
        text-decoration: none;
        font-size: 14px;
    }

    .restaurant-info a:hover {
        background-color: #0056b3;
    }

.checked {
  color:rgb(238, 156, 5); /* Change the color to gold */
}


.alert-modal {
    display: none; /* Hidden by default */
    position: fixed;
    top: 20px; /* Adjust top position */
    right: 20px; /* Adjust right position */
    width: 200px; /* Width of the alert */
    background-color: #fff;
    border: 1px solid #ddd;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    border-radius: 5px;
    z-index: 1000; /* Ensure it's above other content */
}

.alert-content {
    padding: 15px;
    font-size: 14px;
}

.close-alert {
    background: transparent;
    border: none;
    font-size: 20px;
    color: #333;
    float: right;
    cursor: pointer;
}

.close-alert:hover {
    color: #ff0000; /* Change color on hover */
}

.modal-body a {
    color: black !important; /* Use !important to override other styles */
    text-decoration: none !important; /* Remove underline */
}

.modal-body a:hover {
    text-decoration: underline !important; /* Optional: Add underline on hover */
}

.modal-header .modal-title {
    color: #FF5722 !important; /* Bhagava color with !important */
}



    </style>

</head>
<body>

<form action="home" method="GET">
    <div class="top-bar">
        <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px;"> 
        
        <div class="search-bar">
            <input type="text" name="search" placeholder="Search...">
            <i class="fa fa-search"></i>
        </div>
        
        
        <div class="alert-modal" id="alertModal">
        <div class="alert-content">
            <button class="close-alert" id="closeAlert">&times;</button>
            <h4>Sign In Alert</h4>
            <p>This is a small alert message or notification.</p>
        </div>
    </div>
        <div class="icon-bar">
            <a href="Signin.jsp"><i class="fa fa-sign-in"></i> Sign In</a>
            <a href="SignUp.jsp"><i class="fa fa-user-plus"></i> Sign Up</a>
            <a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a>
            <a href="#" class="profile-icon"    id="accountName" data-toggle="modal" data-target="#profileModal"><i class="fa fa-user"></i> Profile</a>
        </div>
    </div>
</form>

<!-- Profile Modal -->
<div class="modal fade profile-modal" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profileModalLabel">Profile</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <a href="Profil.jsp">My Profile</a>
                
            </div>
        </div>
    </div>
</div>


<div class="display-bar">
    <div class="heading-border">
        <h1 style="font-size: 40px; font-weight: bold; text-align: right;">
            Order Food <br>
            Online in <br>
            Bangalore
        </h1>
    </div>
    <img id="image" src="without background image.avif" alt="Right Image" class="right-image">
</div>
<br>
<br>
<div class="itemmenu-heading">
    <h3>&nbsp;&nbsp;&nbsp;&nbsp;What's on your mind?</h3>
    <div class="direction-buttons">
        <a id="scroll-left" class="btn btn-link"><i class="fa fa-angle-left"></i></a>
        <a id="scroll-right" class="btn btn-link"><i class="fa fa-angle-right"></i></a>
    </div>
</div>
<%
 String category =request.getParameter("category");
%>
<div class="itemmenu-container">
    <div class="itemmenu-bar">
        <div class="scroll-wrapper">
            <!-- Biryani -->
            <div class="item" data-category="biryani">
                <a href="menu?category=biryani" id="biryani-link">
                    <img src="Biryani_123.avif" alt="Biryani" class="img">
                </a>
            </div>
            <!-- Ice Cream -->
            <div class="item" data-category="icecream">
                <a href="menu?category=icecream" id="icecream-link">
                    <img src="Ice_Creams123.avif" alt="Ice Cream" class="img">
                </a>
            </div>
            <!-- Pasta -->
            <div class="item" data-category="pasta">
                <a href="menu?category=pasta" id="pasta-link">
                    <img src="Pasta123.avif" alt="Pasta" class="img">
                </a>
            </div>
            <!-- Rolls -->
            <div class="item" data-category="rolls">
                <a href="menu?category=rolls" id="rolls-link">
                    <img src="Rolls123.avif" alt="Rolls" class="img">
                </a>
            </div>
            <!-- Burger (fixed link) -->
            <div class="item" data-category="burger">
                <a href="menu?category=burger" id="burger-link">
                    <img src="Burger123.avif" alt="Burger" class="img" id="burger-image">
                </a>
            </div>
            <!-- Cakes -->
            <div class="item" data-category="cakes">
                <a href="menu?category=cakes" id="cakes-link">
                    <img src="Cakes123.avif" alt="Cakes" class="img">
                </a>
            </div>
            <!-- Kebabs (fix double question mark in link) -->
            <div class="item" data-category="kebabs">
                <a href="menu?category=kebabs" id="kebabs-link">
                    <img src="Kebabs123.avif" alt="Kebabs" class="img">
                </a>
            </div>
            <!-- Pure Veg -->
            <div class="item" data-category="pureveg">
                <a href="menu?category=pureveg" id="pureveg-link">
                    <img src="Pure_Veg123.avif" alt="Pure Veg" class="img">
                </a>
            </div>
        </div>
    </div>
</div>


<div class="restaurant-heading">
    <h2>Top restaurant chains in Bangalore</h2>
</div>
<div class="restaurant-row">
    <% List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurantList"); %>
    <% if (restaurants != null && !restaurants.isEmpty()) { %>
        <% for (Restaurant restaurant : restaurants) { %>
            <div class="restaurant-card">
                <a href="menu?restaurantId=<%= restaurant.getRestauranId() %>&restaurantName=<%= URLEncoder.encode(restaurant.getRestaurantName(), "UTF-8") %>&imagePath=<%= URLEncoder.encode(restaurant.getImagePath(), "UTF-8") %>">
                    <img src="<%= request.getContextPath() + restaurant.getImagePath() %>" alt="Image of <%= restaurant.getRestaurantName() %>">
                </a>
               
                
                <div class="restaurant-info">
                    <h3><%= restaurant.getRestaurantName() %></h3>
                    <div class="rating">
                        <span class="fa fa-star checked"></span>
                        <p><%= restaurant.getRating() %> - <%= restaurant.getDeliveryTime() %> mins</p>
                        <p><%= restaurant.getCuisineType() %></p>
                        <p><%= restaurant.getAddress() %></p>
                    </div>
                </div>
            </div>
        <% } %>
    <% } else { %>
        <p>No restaurants available.</p>
    <% } %>
</div>


<script>
document.addEventListener('DOMContentLoaded', function() {
    // Scroll amount
    var scrollAmount = 200;
    
    // Scroll left and right functionality
    var scrollContainer = document.querySelector('.scroll-wrapper');
    if (scrollContainer) {
        document.getElementById('scroll-left').addEventListener('click', function(e) {
            e.preventDefault();
            scrollContainer.scrollBy({
                left: -scrollAmount,
                behavior: 'smooth'
            });
        });

        document.getElementById('scroll-right').addEventListener('click', function(e) {
            e.preventDefault();
            scrollContainer.scrollBy({
                left: scrollAmount,
                behavior: 'smooth'
            });
        });
    }

    // Navigation for burger category
    document.getElementById('burger-link').addEventListener('click', function(event) {
        event.preventDefault();
        window.location.href = 'menu?category=burger';
    });

    document.getElementById('burger-image').addEventListener('click', function(e) {
        e.preventDefault();
        window.location.href = "menu.jsp?category=burger";
    });

    // Update account name from localStorage
    if (localStorage.getItem('profileName')) {
        document.getElementById('accountName').innerText = localStorage.getItem('profileName');
    }

    // Confirm and handle profile edit
    function confirmEditProfile() {
        if (confirm("Do you want to edit your profile?")) {
            // Create and show the edit profile modal
            var editModal = document.createElement('div');
            editModal.className = 'modal fade';
            editModal.id = 'editProfileModal';
            editModal.tabIndex = -1;
            editModal.setAttribute('role', 'dialog');
            editModal.setAttribute('aria-labelledby', 'editProfileModalLabel');
            editModal.setAttribute('aria-hidden', 'true');

            editModal.innerHTML = `
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editProfileModalLabel" style="color: #FF9933;">Edit Profile</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="editProfileForm">
                                <div class="form-group">
                                    <label for="name">Name:</label>
                                    <input type="text" class="form-control" id="name" placeholder="Enter your name" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                                </div>
                                <button type="submit" class="btn btn-primary edit-profile-btn">Save</button>
                            </form>
                        </div>
                    </div>
                </div>
            `;

            document.body.appendChild(editModal);
            $('#editProfileModal').modal('show');

            // Handle form submission
            $('#editProfileForm').on('submit', function(event) {
                event.preventDefault();
                var name = $('#name').val();
                localStorage.setItem('profileName', name); // Save the name in localStorage
                $('#accountName').text(name); // Update the account name on the main page
                $('#editProfileModal').modal('hide');
                // You can add an AJAX call here to save the changes to the server if needed
            });
        }
    }

    // Attach the confirmEditProfile function to an event if needed
    // e.g., document.getElementById('editProfileButton').addEventListener('click', confirmEditProfile);
});



function loadMenu(category) {
    // Load menu items dynamically when a category is clicked
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "MenuServlet?category=" + category, true);
    xhr.onload = function () {
        if (xhr.status === 200) {
            document.getElementById("menuItems").innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}
</script>



<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>