<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
}

.top-bar {
    border: 1px solid #ccc;
    background-color: #fff;
    padding: 35px 20px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    width: 100%;
    z-index: 999;
    position: fixed;
    top: 0;
}

.logo {
    width: 40px;
    transition: opacity 0.3s ease;
    margin-right: 10px;
}


h1 {
    margin: 0;
    flex-grow: 1; /* Allow the h1 element to grow and occupy remaining space */
   
}

form {
    margin-top: 100px; /* Adjusted to give space below top-bar */
    padding: 80px;
    border: 2px solid #ccc; /* Add border */
    width: 150px; /* Set width to 100px */
    height: 200px; /* Set height to 200px */
    margin: 0 auto; /* Center the form horizontally */
}

label {
    font-weight: bold;
}

textarea#address,
select#paymentMethod,
input[type="submit"] {
    width: calc(100% - 20px); /* Adjusted width */
    padding: 15px; /* Adjusted padding */
    margin-bottom: 30px; /* Reduced margin */
    border: 2px solid #ccc; /* Add border */
    box-sizing: border-box; /* Include padding and border in element's total width and height */
}
input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 5px 10px; /* Adjusted padding */
    width: 100px; /* Adjusted width */
    height: 40px; /* Adjusted height */
    bottom: 10px; /* Adjusted bottom position */
    right: 20px; /* Align the button to the right inside the form */
}

input[type="submit"]:hover {
    background-color: #45a049;
}

/* Media query for smaller screen sizes */
@media screen and (max-width: 600px) {
    textarea#address {
        height: 60px; /* Reduced height for smaller screens */
    }
}
</style>
</head>
<body>
<div class="top-bar">
    <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px; margin-right: 10px;">
    <img src="tapfood.png" alt="Logo" class="logo" style="width: 80px; margin-right:5px;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>CheckOut</h1>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div>
    <form action="checkout" method="post">
        <label for="address">Delivery Address</label>
        <textarea id="address" name="address" required></textarea><br>
        <label for="paymentMethod">Payment Method</label>
        <select id="paymentMethod" name="paymentMethod">
            <option value="UPI">UPI</option>
            <option value="Cash">Cash</option>
            <option value="Debit Card">Debit Card</option>
            <option value="Credit Card">Credit Card</option>
        </select><br>
        <input type="submit" value="Confirm">
    </form>
</div>
</body>
</html>
