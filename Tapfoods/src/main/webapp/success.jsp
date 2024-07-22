<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Details</title>
</head>
<body>
    <h1>Order Details</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Order Item ID</th>
                <th>Menu ID</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Name</th>
                <th>Total Price</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${orderItem.orderItemId}</td>
                <td>${orderItem.menuId}</td>
                <td>${orderItem.quantity}</td>
                <td>${orderItem.price}</td>
                <td>${orderItem.name}</td>
                <td>${orderItem.totalPrice}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
