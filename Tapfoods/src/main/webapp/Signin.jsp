<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginPage</title>
<link rel="stylesheet" type="text/css" href="css/log.css">

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 360px; /* Adjusted for mobile view */
    margin: 50px auto;
    padding: 20px;
    border-radius: 10px; /* Rounded corners for a softer look */
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Added shadow for depth */
}

h1 {
    color: #333; /* Dark color for better readability */
    margin-top: 0;
    text-align: center;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0; /* Added margin between fields */
    border: 1px solid #ddd;
    border-radius: 5px; /* Rounded corners for inputs */
    font-size: 16px; /* Adjusted font size for better readability */
}

input[type="text"]:focus,
input[type="password"]:focus {
    border-color: #ff5722; /* Color on focus */
    outline: none;
}

.clearfix {
    text-align: center;
    margin-top: 20px;
}

.loginbtn {
    background-color: #ff5722; /* Orange color similar to Swiggy */
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px; /* Adjusted font size */
    transition: background-color 0.3s ease;
    width: 100%; /* Full-width button */
}

.loginbtn:hover {
    background-color: #e64a19; /* Darker shade on hover */
}

.terms {
    font-size: 12px;
    color: #666;
    margin-top: 10px;
}

.top-right-img {
    border-radius: 50%;
    width: 60px; /* Adjusted size for mobile view */
    height: 60px;
    float: right;
    margin-left: 10px;
}

.error-message {
    color: red;
    font-size: 14px;
    text-align: center;
    margin-bottom: 10px;
}
</style>
</head>
<body>

<div class="container">
    <h1>Login</h1>
    <a href="restaurant_details_page.html">
        <img src="logoLoginime.png" alt="Logo" class="top-right-img">
    </a>
    <pre><a href="SignUp.jsp" style="color: #ff5722; text-decoration: none; text-align: center; display: block;">or create an account</a></pre>
    
    <!-- Error message section -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">
            ${errorMessage}
        </div>
    </c:if>
    
    <form action="login" method="post">
        <div class="form-group">
            <input type="text" name="username" placeholder="User Name" required>
            <input type="password" name="password" placeholder="Password" required>
        </div>
        <div class="clearfix">
            <button type="submit" class="loginbtn">LOGIN</button>
            <p class="terms">By clicking on Login, I accept the Terms & Conditions & Privacy Policy</p>
        </div>
    </form>
</div>

</body>
</html>