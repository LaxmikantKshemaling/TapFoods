	`<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.tap.model.Restaurant" %>
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
    border: 1px solid #ccc;
    background-color: #fff;
    padding: 25px 20px;
    display: flex;
    justify-content: space-between; /* Centering search bar and pushing icon bar to the right */
    align-items: center;
    width: 100%;
    z-index: 999;
    position: fixed;
    top: 0;
}

.logo {
    width: 40px;
    transition: opacity 0.3s ease;
}
.search-bar {
    width: 200px;
    background-color: #fff;
    border: none;
    transition: background-color 0.3s ease;
    position: relative;
    border-radius: 20px;
    padding: 8px 30px 8px 40px;
    cursor: pointer;
}

.search-bar input {
    background-color: transparent;
    border: none;
    width: 100%;
    color: #000;
}


.search-bar i {
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #000;
    transition: color 0.3s ease;
}

.search-bar:hover i,
.search-bar:focus i {
    color: #ff9933;
}

.icon-bar {
    display: flex;
}

.icon-bar a {
    margin-right: 10px;
    color: rgba(0, 0, 0, 0.918);
    text-decoration: none;
    border: none;
    padding: 5px;
}
.icon-bar a:hover {
    color: #ec7a08;
}

.icon-bar a[href="profile.jsp"] {
    font-size: 20px; /* Increase font size */
}

.icon-bar a[href="profile.jsp"] i {
    font-size: 25px; /* Increase icon size */
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

label {
  display: block; /* Display the label as a block element */
  font-size: 16px; /* Set the font size for the labels */
}        
.restaurant-row {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap; /* Allow items to wrap to the next line */
  margin-bottom: 20px;
}


.img {
  width: 180px;
  height: 180px; /* Ensure all images have the same height */
  object-fit: cover; /* Maintain aspect ratio and cover the container */
  margin-bottom: 10px;
  background-color: white; /* Add white background */
}

.restaurant-card {
  width: calc(33.33% - 20px); /* Adjusted width */
  border: 1px solid #ccc;
  border-radius: 10px;
  overflow: hidden;
  box-sizing: border-box; /* Ensure border and padding are included in the width calculation */
  margin-bottom: 20px; /* Add margin between cards */
}

.restaurant-card img {
  width: 100%;
  height: auto;
}

.restaurant-info {
  padding: 10px;
}

.restaurant-info h3 {
  margin: 0;
}

.restaurant-info p {
  margin: 5px 0;
}

.restaurant-info a {
  display: inline-block;
  padding: 5px 10px;
  background-color: #007bff;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
}

.restaurant-info a:hover {
  background-color: #0056b3;
}

.checked {
  color:rgb(238, 156, 5); /* Change the color to gold */
}
    </style>

</head>
<body>


<form action="#" method="GET">
    <div class="top-bar">
        <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px; margin-right: -262px;">
        <img src="tapfood.png" alt="Logo" class="logo" style="width: 80px; margin-right:5px;">
        <div class="search-bar">
            <input type="text" placeholder="Search...">
            <i class="fa fa-search"></i>
        </div>
        <div class="icon-bar">
            <a href="Login.jsp" class="btn"><i class="fa fa-user-o"></i> Sign In</a>
            <a href="SignUp.jsp" class="btn"><i class="fa fa-user"></i> Sign Up</a>
            <a href="cart.jsp" class="btn"><i class="fa fa-cart-plus"></i> Cart</a>
            <a href="#" class="btn"><i class="fa fa-user-circle"></i> Profile</a> <!-- New Profile link -->
        </div>
    </div>
</form>


<div class="display-bar">
    <!-- Additional border around the heading -->
    <div class="heading-border">
        <h1 style="font-size: 40px; font-weight: bold; text-align: right;"> <!-- Align text to the right -->
            Order Food <br> <!-- Added line breaks for better spacing -->
            Online in <br> <!-- Added line breaks for better spacing -->
            Bangaluru
        </h1>
    </div>
    <!-- Image on the right side -->
    <img id="image" src="without background image.avif" alt="Right Image" class="right-image">
</div>
<br>
<br>

<div class="Itemenu-heading">
  <h3>&nbsp;&nbsp;&nbsp;&nbsp;What's on your mind?</h3>
  <div class="direction-buttons">
    <a href="#" class="btn btn-link"><i class="fa fa-angle-left"></i></a>
    <a href="#" class="btn btn-link"><i class="fa fa-angle-right"></i></a>
  </div>
</div>
<div class="itemmenu-container">
  <div class="Itemmenu-bar">
  <div class="border-container">
    <div class="scroll-wrapper">
      <div class="item">
        <a href="#">
        <img src="Biryani_123.avif" alt="Biryani" class="img">
      </a>
      
      </div>



    <div class="item">
      <a href="#">
      <img src="Ice_Creams123.avif" alt="Ice_Creams" class="img">
      </a>

    </div>

    <div class="item">
      <a href="#">
      <img src="Pasta123.avif" alt="Pasta" class="img">
      </a>

    </div>

    <div class="item">
      <a href="#">
      <img src="Rolls123.avif" alt="Rolls" class="img">
      </a>
    </div>

    <div class="item">
      <a href="#">
      <img src="Burger123.avif" alt="Biryani" class="img">
    </a>
    
    </div>



  <div class="item">
    <a href="#">
    <img src="Cakes123.avif" alt="Ice_Creams" class="img">
    </a>

  </div>


  <div class="item">
    <a href="#">
    <img src="Kebabs123.avif" alt="Rolls" class="img">
    </a>
  </div>
  <div class="item">
    <a href="#">
    <img src="Pure_Veg123.avif" alt="Biryani" class="img">
  </a>
  
  </div>



<div class="item">
  <a href="#">
  <img src="Ice_Creams123.avif" alt="Ice_Creams" class="img">
  </a>

</div>

<div class="item">
  <a href="#">
  <img src="Pasta123.avif" alt="Pasta" class="img">
  </a>

</div>

<div class="item">
  <a href="#">
  <img src="Rolls123.avif" alt="Rolls" class="img">
  </a>
</div>

  </div>
</div>
<br>
<br>

<div class="restaurant-heading">
  <h2>Top restaurant chains in Bangalore</h2>
</div>
<br>
<div class="restaurant-row">
<%
List<Restaurant> restaurants = (List<Restaurant>)request.getAttribute("restaurantList"); // Retrieve the list of restaurants from the request attributes

if (restaurants != null && !restaurants.isEmpty()) { // Check if the restaurant list is not null and not empty
 
  for (Restaurant restaurant : restaurants) { // Loop through each restaurant in the list
%>
<div class="restaurant-card"> <!-- Start of restaurant card -->
  <a href="menu?restaurantId=<%=restaurant.getRestauranId()%>"> <!-- Anchor tag starts here with a link to the menu page of the restaurant -->
    <img src="<%=request.getContextPath() +restaurant.getImagePath()%>" alt="Image of <%=restaurant.getName()%>"> <!-- Display the image of the restaurant -->
  </a> <!-- Anchor tag ends here -->
  <div class="restaurant-info"> <!-- Start of restaurant information -->
    <h3><%=restaurant.getName()%></h3> <!-- Display the name of the restaurant -->
    <div class="rating"> <!-- Start of rating section -->
      <span class="fa fa-star checked"></span> <!-- Display a star icon for rating -->
      <p><%=restaurant.getRating()%> - <%=restaurant.getDeliveryTime()%>Mins</p> <!-- Display the rating and delivery time of the restaurant -->
      <p><%=restaurant.getCuisineType()%></p> <!-- Display the cuisine type of the restaurant -->
      <p><%=restaurant.getAddress()%></p> <!-- Display the address of the restaurant -->
    </div> <!-- End of rating section -->
  </div> <!-- End of restaurant information -->
</div> <!-- End of restaurant card -->
<%
  }
} else { // If there are no restaurants available
%>
<p>No restaurants available.</p> <!-- Display a message indicating no restaurants are available -->
<%
}
%>
</div> <!-- End of restaurant row -->


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>