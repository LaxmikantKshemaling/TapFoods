<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa; /* Soft background color */
        }

        .top-bar {
            background-color: white; /* White background for the top bar */
            color: #007bff; /* Primary color for text */
            padding: 20px; /* Increased padding for more height */
            display: flex;
            justify-content: center; /* Center the heading */
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
            border-bottom: 1px solid #ced4da; /* Light border for separation */
        }

        .top-bar img {
            height: 60px; /* Increased logo size */
            position: absolute;
            left: 20px; /* Adjust position */
        }

        .top-bar h1 {
            margin: 0;
            font-size: 32px; /* Increased font size */
            text-align: center;
        }

        .form-container {
            margin-top: 120px; /* Adjust spacing to fit under the larger top bar */
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px; /* Reduced width for a more compact form */
            margin: 30px auto;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 15px;
            color: #343a40;
            font-size: 22px; /* Slightly smaller font size */
        }

        .form-container .form-label {
            color: #495057;
            font-weight: 500;
        }

        .form-container input[type="text"],
        .form-container textarea,
        .form-container select {
            border-radius: 6px;
        }

        .form-container input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-size: 14px; /* Slightly smaller font size */
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #218838;
        }

        @media (max-width: 576px) {
            .top-bar {
                padding: 15px;
            }

            .top-bar img {
                height: 50px;
                left: 15px;
            }

            .top-bar h1 {
                font-size: 26px;
            }

            .form-container {
                margin-top: 100px;
                padding: 15px;
                max-width: 90%; /* Adjust width for smaller screens */
            }

            .form-container h2 {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px;">
        <h1>Checkout</h1>
    </div>
<br>
<br>
<br>
    <div class="container">
        <div class="form-container">
            <h2>Your Details</h2>
            <form id="checkoutForm" action="checkout" method="post">
                <div class="mb-3">
                    <label for="phoneNo" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNo" name="phoneNo" value="${loggedInUser.phoneNo}" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <textarea class="form-control" id="address" name="address" rows="4" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="paymentMethod" class="form-label">Payment Method</label>
                    <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                        <option value="UPI">UPI</option>
                        <option value="Cash">Cash</option>
                        <option value="Debit Card">Debit Card</option>
                        <option value="Credit Card">Credit Card</option>
                    </select>
                </div>
                <input type="submit" value="Confirm">
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Font Awesome for search icon -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>

    <script>
        document.getElementById('checkoutForm').addEventListener('submit', function(event) {
            if (!confirm("Are you sure you want to confirm your order? Your order details will be processed.")) {
                event.preventDefault(); // Prevent form submission
                window.location.href = 'cart'; // Redirect to the cart page
            }
        });
    </script>
</body>
</html>
