<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tap.model.OrderTable"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!-- Import SimpleDateFormat -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Confirmation</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

.top-bar {
	border: 1px solid #ccc;
	background-color: #fff;
	padding: 25px 20px;
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

.order-container {
	width: 300px;
	height: 400px;
	border: 2px solid #ccc;
	border-radius: 10px; /* optional: to round the corners */
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto; /* to center the container horizontally */
}

.order-details {
	text-align: center;
}

.thank-you {
	border: 1px solid #ccc;
	padding: 10px;
	border-radius: 5px;
}

#confirm-btn {
	font-size: 18px; /* Increase button size */
	background-color: #4CAF50; /* Light green color */
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

#confirm-btn:hover {
	background-color: orange /* Change color on hover */
}
</style>
</head>
<body>
	<div class="top-bar">
		<img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo"
			class="logo" style="width: 40px; margin-right: 10px;"> <img
			src="tapfood.png" alt="Logo" class="logo"
			style="width: 80px; margin-right: 5px;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h1>Order Confirmation</h1>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="order-container">
		<%
		OrderTable orderTable = (OrderTable) session.getAttribute("order");
		if (orderTable != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // Define date format
		%>
		<form id="order-form" action="your_action_url_here" method="post">
			<!-- Replace 'your_action_url_here' with your actual action URL -->
			<div class="order-details">
				<div>
					<p>Thank You For Your Order..!</p>
				</div>
				<p>
					OrderTable ID:
					<%=orderTable.getOrderTableId()%></p>
				<p>
					User ID:
					<%=orderTable.getUserId()%></p>
				<p>
					Restaurant ID:
					<%=orderTable.getRestaurantId()%></p>

				<p>
					Order Date:
					<%=sdf.format(orderTable.getOrderDate())%></p>
				<!-- Format order date -->
				<p>
					Payment Method:
					<%=orderTable.getModeOfPayment()%></p>
				<p>
					Total Amount:
					<%=orderTable.getTotalAmount()%></p>
				<p>
					Status:
					<%=orderTable.getStatus()%></p>

				<input id="confirm-btn" type="submit" value="Confirm">
				<!-- Submit button -->
			</div>
		</form>
		<%
		} else {
		%>
		<p>No order found!</p>
		<%
		}
		%>
	</div>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#order-form').submit(function(e) {
				e.preventDefault(); // Prevent default form submission
				alert("CHILL RELAX FOODS IS ON YOUR WAY"); // Display message
			});
		});
	</script>

</body>
</html>