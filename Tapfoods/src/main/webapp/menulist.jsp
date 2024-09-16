<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu List</title>
<link rel="stylesheet" href="css/menu.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 2px;
}

/* Top bar fixed at the top */
.top-bar {
	position: fixed;
	top: 0;
	width: 100%;
	background-color: white;
	color: black;
	display: flex;
	align-items: center;
	padding: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	z-index: 100;
	font-weight: bold;
}

.top-bar img {
	width: 50px;
	height: 50px;
	margin-right: 15px;
}

.add-menu-button {
	margin-left: auto;
}

.add-menu-button form {
	display: inline;
}

.add-menu-button button {
	padding: 10px 20px;
	background-color: white;
	color: black;
	font-weight: bold;
	border: 2px solid white;
	cursor: pointer;
	border-radius: 4px;
}

.add-menu-button button:hover {
	background-color: #f0f0f0;
}

/* Table and Scrollable Content */
.content {
	margin-top: 120px;
	overflow-y: auto;
	height: calc(100vh - 140px);
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

thead {
	position: sticky;
	top: 0;
	background-color: white;
	z-index: 50;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid white;
}

th {
	background-color: white;
	color: black;
	font-weight: bold;
}

td img {
	width: 80px;
	height: 80px;
	object-fit: cover;
	border-radius: 5px;
}

.price {
	font-size: 1.2em;
	color: #e94e77;
}

.rating {
	font-size: 1.1em;
	color: #FFD700;
}

.availability {
	font-weight: bold;
}

.available {
	color: green;
}

.unavailable {
	color: red;
}

/* Action buttons styling */
.action-buttons {
	display: flex;
	gap: 10px;
}

/* Update button */
.action-buttons button.update {
	padding: 8px 12px;
	background-color: white;
	color: black;
	border: 2px solid white;
	cursor: pointer;
	border-radius: 4px;
	font-size: 1.1em; /* Increased font size */
}

.action-buttons button.update:hover {
	background-color: #f0f0f0;
}

/* Delete button */
.action-buttons button.delete {
	padding: 8px 12px;
	background-color: white;
	color: #ff6f00;
	border: 2px solid white;
	cursor: pointer;
	border-radius: 4px;
	font-size: 1.1em; /* Increased font size */
}

.action-buttons button.delete:hover {
	background-color: #f0f0f0;
}
</style>
</head>
<body>

	<!-- Fixed Top Bar with Add Menu Button -->
	<div class="top-bar">
		<img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo"
			class="logo">
		<h1>Restaurant Menu List</h1>

		<div class="add-menu-button">
			<form action="addmenulist.jsp" method="get">
				<input type="hidden" name="restaurantId"
					value="<%=request.getParameter("restaurantId")%>">
				<button type="submit">Add Menu Item</button>
			</form>
		</div>
	</div>

	<!-- Scrollable Content -->
	<div class="content">
		<table>
			<thead>
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Rating</th>
					<th>Available</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");

				if (menuList != null && !menuList.isEmpty()) {
					for (Menu menuItem : menuList) {
				%>
				<tr>
					<td><img
						src="<%=request.getContextPath() + menuItem.getMenuimagePath()%>"
						alt="Image of <%=menuItem.getName()%>"></td>
					<td><%=menuItem.getName()%></td>
					<td><%=menuItem.getDescription()%></td>
					<td class="price">$<%=menuItem.getPrice()%></td>
					<td class="rating"><%=menuItem.getRating()%></td>
					<td
						class="availability <%=menuItem.isAvailable() ? "available" : "unavailable"%>">
						<%=menuItem.isAvailable() ? "In Stock" : "Out of Stock"%>
					</td>
					<td class="action-buttons">
						<form action="UpdateMenu" method="get">
							<input type="hidden" name="menuId"
								value="<%=menuItem.getMenuId()%>">
							<button type="submit" class="update">Update</button>
						</form>
						<form action="DeleteMenu" method="post">
							<input type="hidden" name="menuId"
								value="<%=menuItem.getMenuId()%>"> <input
								type="hidden" name="restaurantId"
								value="<%=request.getParameter("restaurantId")%>">
							<button type="submit" class="delete">Delete</button>
						</form>



					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="7">No menu items available</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>
