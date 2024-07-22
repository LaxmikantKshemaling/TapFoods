<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.model.Cart"%> <!-- Import the Cart class -->
<%@ page import="com.tap.model.CartItem"%> <!-- Import the CartItem class -->
<%@ page import="com.tap.model.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.border-container {
	border: 1px solid #ccc; /* Add border */
	padding: 15px; /* Add padding */
	text-align: center; /* Center align text */
}

.top-bar {
	display: flex;
	align-items: center;
	justify-content: flex-start; /* Align items to the left */
}

.secure-checkout {
	font-weight: bold; /* Make the text bold */
	margin-top: 1px; /* Add margin */
	font-size: 25px;
}
.center-container {
    display: flex;
    flex-direction: column;
    justify-content: flex-start; /* Align items to the start */
    align-items: center;
    position: relative;
    width: 100%;
    max-width: 800px; /* Adjust as needed */
    margin: auto;
    padding: 20px;
}
.border-top,
.border-bottom {
    width: 100%;
    height: 1px;
    background-color: #ccc;
    position: absolute;
    left: 0;
}

.border-top {
    top: 0;
}

.border-bottom {
    bottom: 0;
}

.content-container {
    width: calc(100% - 300px); /* Adjust width to accommodate right image */
    padding: 0 10px;
    box-sizing: border-box;
}


.right-image-container {
    width: 100%; /* Take full width */
    margin-bottom: 20px; /* Add some spacing between the image and the content */
}


.menu-items {
    overflow-y: auto;
    max-height: 300px; /* Adjust as needed */
    width: 100%; /* Take full width */
}

.menu-item {
    margin-bottom: 20px;
    display: flex;
}

.item-details {
    flex: 1;
    margin-left: 10px;
}



.empty-cart-msg {
    margin: 0;
}


.right-image-container {
    position: absolute;
    top: 0;
    right: 5px; /* Position the container 5px away from the right side */
}

.top-image {
    max-width: 100%; /* Ensure the image doesn't exceed its container's width */
    max-height: 120px; /* Set the maximum height of the image */
    width: auto; /* Maintain the aspect ratio of the image */
}
.top-image-container {
    display: flex;
    justify-content: center; /* Center the image horizontally */
    align-items: center; /* Center the image vertically */
    height: 100px; /* Set the height of the container */
}
.proceed-button {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    margin-top: 2px; /* Add some spacing between the content and the buttons */
}
.proceed-button .add-more-item-btn {
    background-color: #4CAF50; /* Background color for "Add More" button */
    color: white; /* Text color for "Add More" button */
    border: none;
    border-radius: 5px;
    padding: 10px 10px; /* Adjusted padding */
    cursor: pointer;
    transition: background-color 0.3s;
    margin-right: 180px; /* Add margin to separate from "Proceed to Checkout" button */
}

.proceed-button .add-more-item-btn:hover {
    background-color: #45a049; /* Hover background color for "Add More" button */
}

.proceed-button .proceed-to-checkout-btn {
    background-color: white; /* Background color for "Proceed to Checkout" button */
    color: black; /* Text color for "Proceed to Checkout" button */
    border: 1px solid black; /* Border for "Proceed to Checkout" button */
    border-radius: 5px;
    padding: 10px 10px; /* Adjusted padding */
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s, border-color 0.3s;
}

.proceed-button .proceed-to-checkout-btn:hover {
    background-color: #f2f2f2; /* Hover background color for "Proceed to Checkout" button */
}

</style>


</head>
<body>
	<div class="border-container">
    <div class="top-bar">
        <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px;">
        <img src="tapfood.png" alt="Logo" class="logo" style="width: 80px; margin-left: 5px;">
    </div>
    <div class="secure-checkout">SECURE CHECKOUT</div>
</div>
<br>
<div class="center-container">\
<div class="right-image-container">
        <img src="SwiggyImage.avif" alt="Top Image" class="top-image">
    </div>
    
    <div class="border-top"></div>
    <div class="border-bottom"></div>
    <div class="content-container">
        <div class="header-container">
            <h1>Cart Items</h1>
        </div>
        <div class="menu-items">
            <!-- Cart Items -->
            <% 
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null && !cart.getItems().isEmpty()) {
                for (CartItem     item   :    cart.getItems().values()) {
            %>
            <div class="menu-item" id="<%=item.getItemId()%>">
                <div class="item-details">
                    <p><%=item.getName()%></p>
                    <span class="price">&#x20B9;<%=item.getPrice()%></span>
                    
                    <form action="cart" method="post">
                        <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
                        <div class="quantity-controls">
                            <input type="submit" name="action" value="remove" class="remove-btn">
                            
                            
                            <input type="number" name="quantity" value="<%=item.getQuantity()%>" min="1">
                            
                            
                            <input type="submit" name="action" value="update" class="update-btn">
                            
                        </div>
                    </form>
                </div>
            </div>
            <% 
                }
            } else { 
            %>
            <div class="top-image-container">
                <img src="Cart.webp" alt="Top Image" class="top-image">
                <p class="empty-cart-msg">Your Cart Is Empty</p>
            </div>
            <% 
            } 
            %>
        </div>
    </div>
</div>
<div class="proceed-button">
    <a href="menu?restaurantId=<%=session.getAttribute("restaurantId")%>" class="btn add-more-item-btn">Add More</a>
    
    
    
    
    <% if (session.getAttribute("cart") != null) { %>
    <form action="check.jsp" method="post">
      <input type="submit" value="proceed to checkout" class="btn proceed-to-checkout-btn">
    </form>
    <% } %>
</div>

</body>
</html>