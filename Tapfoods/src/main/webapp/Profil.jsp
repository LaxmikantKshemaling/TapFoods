<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .container {
            margin-top: 0px;
            max-width: 1400px;
        }

        .sidebar {
            position: fixed;
            top: 100px;
            left: 0;
            width: 200px;
            background-color: #f1f1f1;
            padding: 20px;
            height: auto;
        }

        .sidebar a {
            display: block;
            margin-bottom: 10px;
            font-size: 1.1em;
            color: #000000;
            text-decoration: none;
        }

        .sidebar a:hover {
            color: #ff3f6c;
            text-decoration: none;
        }

        .top-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .top-bar .left {
            display: flex;
            align-items: center;
        }

        .top-bar .logo {
            margin-right: 10px;
        }

        .top-bar .middle {
            flex-grow: 1;
            text-align: center;
            color: #000000;
        }

        .top-bar .right {
            text-align: right;
            color: #FF9933;
        }

        .profile-icon {
            font-size: 1.5em;
            cursor: pointer;
            color: #FF9933;
            transition: color 0.3s ease;
        }

        .profile-icon:hover {
            color: #000000;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="top-bar">
                    <div class="left">
                        <img src="WhatsApp Image 2024-03-15 at 2.11.19 PM.jpeg" alt="Logo" class="logo" style="width: 40px;">
                    </div>
                    <div class="middle">
                        <h4>My Account</h4>
                    </div>
                    <div class="right">
                        <a href="#" class="profile-icon" id="accountName" data-toggle="modal" data-target="#profileModal"><i class="fa fa-user"></i> Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Sidebar with Links -->
    <div class="sidebar">
       <a href="javascript:void(0);" onclick="openDashboardModal();">Dashboard</a>

        <a href="OrderTableServlet">My Orders</a>
        <a href="OrderItem">My Items</a>
        <a href="#">History</a>
    </div>

    <!-- Profile Modal -->
    <div class="modal fade profile-modal" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profileHeader" style="color: #FF9933;">Profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <a href="javascript:void(0);" onclick="confirmEditProfile();">My Profile</a>
                    
                </div>
            </div>
        </div>
    </div>


<!-- Dashboard Modal -->
<div class="modal fade" id="dashboardModal" tabindex="-1" role="dialog" aria-labelledby="dashboardModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="dashboardModalLabel" style="color: #FF9933;">Dashboard</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                
                <button type="button" class="btn btn-primary" onclick="window.location.href='deliveryBoyDashboard.jsp';">Delivery Boy</button>
                <button type="button" class="btn btn-secondary" onclick="window.location.href='admin_home.jsp';">Restaurant Admin</button>
            </div>
        </div>
    </div>
</div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Check if the name is already stored in localStorage
        if (localStorage.getItem('profileName')) {
            document.getElementById('accountName').innerText = localStorage.getItem('profileName');
        }

        function confirmEditProfile() {
            if (confirm("Do you want to edit your profile?")) {
                // Open a small modal for editing profile
                var editModal = document.createElement('div');
                editModal.className = 'modal fade';
                editModal.id = 'editProfileModal';
                editModal.tabIndex = -1;
                editModal.setAttribute('role', 'dialog');
                editModal.setAttribute('aria-labelledby', 'editProfileModalLabel');
                editModal.setAttribute('aria-hidden', 'true');

                editModal.innerHTML = `
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editProfileModalLabel" style="color: #FF9933;">Edit Profile</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="editProfileForm">
                                    <div class="form-group">
                                        <label for="name">Name:</label>
                                        <input type="text" class="form-control" id="name" placeholder="Enter your name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary edit-profile-btn">Save</button>
                                </form>
                            </div>
                        </div>
                    </div>
                `;

                document.body.appendChild(editModal);
                $('#editProfileModal').modal('show');

                // Handle the form submission to update the profile modal header
                $('#editProfileForm').on('submit', function(event) {
                    event.preventDefault();
                    var name = $('#name').val();
                    localStorage.setItem('profileName', name); // Save the name in localStorage
                    $('#accountName').text(name); // Update the account name in the main page
                    $('#editProfileModal').modal('hide');
                    // You can add an AJAX call here to save the changes to the server if needed
                });
            }
        }
        
        
        function openDashboardModal() {
            $('#dashboardModal').modal('show');
        }
    </script>
</body>
</html>
