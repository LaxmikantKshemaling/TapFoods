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
    max-width: 400px; /* Reduced max-width to make the container smaller */
    margin: 50px auto;
    padding: 20px;
    border-radius: 5px;
    background-color: transparent;
}

h1 {
    color: black;
    display: inline-block;
    margin-right: 20px;
    margin-top: 0;
}

input[type="text"],
input[type="password"] {
    width: calc(100% - 22px);
    padding: 10px; /* Reduced padding */
    box-sizing: border-box;
    border: none;
    border-bottom: 2px solid #ccc;
    outline: none;
    
    transition: border-bottom-color 0.3s ease;
    font-size: 14px; /* Reduced font size */
}

input[type="text"]:focus,
input[type="password"]:focus {
    border-bottom-color: orange;
}

.clearfix {
    text-align: center;
    margin-top: 20px;
}

.loginbtn {
    background-color: orange;
    color: white;
    padding: 10px 50px; /* Reduced padding */
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px; /* Reduced font size */
    transition: background-color 0.3s ease;
}

.loginbtn:hover {
    background-color: #ff7f00;
}

.terms {
    font-size: 12px; /* Reduced font size */
    color: #666;
    margin-top: 10px;
}

.top-right-img {
    border-radius: 50%; /* Changed to 50% for a circular shape */
    float: right;
    width: 80px; /* Reduced width */
    height: auto;
    margin-right: 10px; /* Adjusted margin */
    margin-bottom: 10px; /* Adjusted margin */
}
 </style>
</head>
<body>

<div class="container">
    <h1>Login</h1>
    <a href="restaurant_details_page.html">
        <img src="logoLoginime.png" alt="Food Image" class="top-right-img">
    </a>
    <pre><a href="SignUp.jsp" style="color: orange; text-decoration: none;">or create an account</a> </pre><!-- Make the text clickable -->
    
    <!-- Error message section -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">
            ${errorMessage}
        </div>
    </c:if>
    
    <form action="login" method="post">
        <div class="form-group">
            <div>
                <input type="text" name="username" placeholder="User Name" required>
            </div>
            <div>
                <input type="password" name="password" placeholder="Password" required>
            </div>
        </div>
        <div class="clearfix">
            <button type="submit" class="loginbtn">LOGIN</button>
            <p class="terms">By clicking on Login, I accept the Terms & Conditions & Privacy Policy</p>
        </div>
    </form>
</div> 
</body>
</html>