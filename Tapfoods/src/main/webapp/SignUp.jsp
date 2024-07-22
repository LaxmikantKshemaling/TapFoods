<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>

<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 5px;
            background-color: transparent;
        }
        h1 {
            color: black; /* Changed to black color */
            display: inline-block;
            margin-right: 20px;
            margin-top: 0; /* Resetting the top margin */
        }
        /* Added a table-like layout for inputs */
        .form-group {
            display: table;
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px; /* Added margin to separate inputs */
        }
        .form-group > div {
            display: table-row;
        }
        .form-group > div > div {
            display: table-cell;
            padding: 10px;
            width: 25%; /* Set width for each column */
        }
        input[type="text"],
        input[type="number"],
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 15px;
            box-sizing: border-box;
            border: none;
            border-bottom: 2px solid #ccc;
            outline: none;
            transition: border-bottom-color 0.3s ease;
            font-size: 16px;
        }
        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="password"]:focus {
            border-bottom-color: orange;
        }
        .clearfix {
            text-align: center;
            margin-top: 20px;
        }
        .signupbtn {
            background-color: orange;
            color: white;
            padding: 15px 150px; /* Adjusted button padding */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px; /* Adjusted button font size */
            transition: background-color 0.3s ease;
        }
        .signupbtn:hover {
            background-color: #ff7f00;
        }
        .terms {
            font-size: 14px;
            color: #666;
            margin-top: 10px;
        }
        /* Added styling for images */
        .top-right-img {
            border-radius: 60%;
            float: right; /* Adjusted to float the image to the left */
            width: 100px;
            height: auto;
            margin-right: 20px; /* Adjusted margin to separate the image from the text */
            margin-bottom: 20px; /* Added margin to separate the image from the form */
        }
    </style>
</head>
<body>

<div class="container">
        <h1>Sign Up</h1>
        <img src="logoLoginime.png" alt="Food Image"  class="top-right-img"  > <!-- Image added closer to the "Sign Up" heading -->
        <p style="color: orange;">Sign up to your account</p>
        
         <!-- Text color changed to orange -->
        <form  action="signup"   method="post">
            <div class="form-group">
                <div>
                    <input type="text" name="username" placeholder="User Name" required>
                </div>
                <div>
                    <input type="text" name="email" placeholder="Email" required>
                </div>
                <div>
                    <input type="number" name="number" placeholder="Phone Number" required>
                </div>
                <div>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
            </div>
            <div class="clearfix">
                <button type="submit" class="signupbtn">CONTINUE</button>
                <p class="terms">By creating an account, I accept the Terms & Conditions & Privacy Policy</p>
            </div>
        </form>
    </div>

</body>
</html>