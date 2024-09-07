<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        width: 90%;
        max-width: 400px;
        padding: 15px; /* Reduced padding */
        border-radius: 10px;
        background-color: white;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        justify-content: center;
        min-height: 45vh; /* Reduced height */
    }
    h1 {
        color: black;
        margin-top: 0;
        font-size: 22px; /* Slightly smaller font size */
        text-align: center;
    }
    p {
        color: orange;
        text-align: center;
        margin-bottom: 20px; /* Reduced bottom margin */
    }
    .form-group {
        margin-bottom: 15px; /* Reduced margin */
    }
    .form-group input[type="text"],
    .form-group input[type="number"],
    .form-group input[type="password"] {
        width: 100%;
        padding: 12px; /* Reduced padding */
        margin: 8px 0; /* Reduced margin */
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        outline: none;
        transition: border-color 0.3s ease;
    }
    .form-group input[type="text"]:focus,
    .form-group input[type="number"]:focus,
    .form-group input[type="password"]:focus {
        border-color: orange;
    }
    .clearfix {
        text-align: center;
    }
    .signupbtn {
        background-color: orange;
        color: white;
        padding: 12px 0; /* Reduced padding */
        width: 100%;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    .signupbtn:hover {
        background-color: #ff7f00;
    }
    .terms {
        font-size: 14px;
        color: #666;
        margin-top: 15px; /* Reduced margin */
    }
</style>
</head>
<body>

<div class="container">
    <h1>Sign Up</h1>
    <p>Sign up to your account</p>
    
    <form action="signup" method="post">
        <div class="form-group">
            <input type="text" name="username" placeholder="User Name" required>
        </div>
        <div class="form-group">
            <input type="text" name="email" placeholder="Email" required>
        </div>
        <div class="form-group">
            <input type="number" name="number" placeholder="Phone Number" required>
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Password" required>
        </div>
        <div class="clearfix">
            <button type="submit" class="signupbtn">CONTINUE</button>
            <p class="terms">By creating an account, I accept the Terms & Conditions & Privacy Policy</p>
        </div>
    </form>
</div>

</body>
</html>
