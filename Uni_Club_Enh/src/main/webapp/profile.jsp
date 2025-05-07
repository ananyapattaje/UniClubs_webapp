<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>University Club - Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/uniclubs.css">
    <style>
        .profile-header {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .profile-avatar {
            width: 100px;
            height: 100px;
            background-color: var(--primary-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 30px;
            color: var(--primary);
            font-size: 2.5rem;
            font-weight: 700;
        }
        
        .profile-info h2 {
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 5px;
        }
        
        .profile-info p {
            color: var(--secondary);
            margin-bottom: 0;
        }
        
        .profile-form {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-bottom: 30px;
        }
        
        .profile-form-title {
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 25px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .profile-form-title:after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            background-color: var(--primary);
            bottom: 0;
            left: 0;
        }
        
        .nav-tabs {
            border-bottom: none;
            margin-bottom: 30px;
        }
        
        .nav-tabs .nav-link {
            border: none;
            border-radius: 30px;
            padding: 10px 20px;
            margin-right: 10px;
            color: var(--secondary);
            font-weight: 500;
        }
        
        .nav-tabs .nav-link.active {
            background-color: var(--primary);
            color: white;
        }
        
        .nav-tabs .nav-link:hover:not(.active) {
            background-color: var(--primary-light);
            color: var(--primary);
        }
        
        @media (max-width: 768px) {
            .profile-header {
                flex-direction: column;
                text-align: center;
            }
            
            .profile-avatar {
                margin-right: 0;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body class="bg-image-overlay">
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
        <div class="container">
            <a class="navbar-brand" href="dashboard">UniClubs</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navMenu">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="dashboard"><i class="fas fa-tachometer-alt me-1"></i>Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile"><i class="fas fa-user me-1"></i>Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="events"><i class="fas fa-calendar-alt me-1"></i>All Events</a></li>
                    <li class="nav-item"><a class="nav-link" href="registered-events"><i class="fas fa-clipboard-check me-1"></i>My Events</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout"><i class="fas fa-sign-out-alt me-1"></i>Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <%
            User user = (User) request.getAttribute("user");
            String initials = user.getName().substring(0, 1).toUpperCase();
            if (user.getName().contains(" ")) {
                initials += user.getName().substring(user.getName().lastIndexOf(" ") + 1, user.getName().lastIndexOf(" ") + 2).toUpperCase();
            }
        %>
        
        <div class="profile-header">
            <div class="profile-avatar">
                <%= initials %>
            </div>
            <div class="profile-info">
                <h2><%= user.getName() %></h2>
                <p><i class="fas fa-envelope me-2 text-primary"></i><%= user.getEmail() %></p>
                <p><i class="fas fa-phone me-2 text-primary"></i><%= user.getPhone() %></p>
            </div>
        </div>

        <%
            if (request.getParameter("updated") != null && request.getParameter("updated").equals("true")) {
        %>
            <div class="message success-message">
                <i class="fas fa-check-circle message-icon"></i>
                <div>Profile updated successfully!</div>
            </div>
        <% } %>

        <% if (request.getParameter("passwordUpdated") != null && request.getParameter("passwordUpdated").equals("true")) { %>
            <div class="message success-message">
                <i class="fas fa-check-circle message-icon"></i>
                <div>Password updated successfully!</div>
            </div>
        <% } %>

        <% if (request.getParameter("passwordError") != null && request.getParameter("passwordError").equals("true")) { %>
            <div class="message error-message">
                <i class="fas fa-exclamation-circle message-icon"></i>
                <div>Current password is incorrect!</div>
            </div>
        <% } %>

        <ul class="nav nav-tabs" id="profileTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true">
                    <i class="fas fa-user me-2"></i>Profile Information
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="password-tab" data-bs-toggle="tab" data-bs-target="#password" type="button" role="tab" aria-controls="password" aria-selected="false">
                    <i class="fas fa-lock me-2"></i>Change Password
                </button>
            </li>
        </ul>

        <div class="tab-content" id="profileTabsContent">
            <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                <div class="profile-form">
                    <h3 class="profile-form-title">Update Profile Information</h3>
                    <form action="profile" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <div class="input-group">
                                <i class="fas fa-user input-icon"></i>
                                <input type="text" id="name" name="name" class="form-control icon-input" value="<%= user.getName() %>" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="registerNumber" class="form-label">Register Number</label>
                            <div class="input-group">
                                <i class="fas fa-id-card input-icon"></i>
                                <input type="text" id="registerNumber" name="registerNumber" class="form-control icon-input" value="<%= user.getRegisterNumber() %>" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <div class="input-group">
                                <i class="fas fa-envelope input-icon"></i>
                                <input type="email" id="email" name="email" class="form-control icon-input" value="<%= user.getEmail() %>" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="phone" class="form-label">Phone Number</label>
                            <div class="input-group">
                                <i class="fas fa-phone input-icon"></i>
                                <input type="text" id="phone" name="phone" class="form-control icon-input" value="<%= user.getPhone() %>" required>
                            </div>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>Update Profile
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                <div class="profile-form">
                    <h3 class="profile-form-title">Change Password</h3>
                    <form action="profile" method="post">
                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">Current Password</label>
                            <div class="input-group">
                                <i class="fas fa-lock input-icon"></i>
                                <input type="password" id="currentPassword" name="currentPassword" class="form-control icon-input" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="newPassword" class="form-label">New Password</label>
                            <div class="input-group">
                                <i class="fas fa-key input-icon"></i>
                                <input type="password" id="newPassword" name="newPassword" class="form-control icon-input" required>
                            </div>
                            <div class="form-text">Password must be at least 8 characters long with letters and numbers.</div>
                        </div>
                        
                        <div class="mb-4">
                            <label for="confirmPassword" class="form-label">Confirm New Password</label>
                            <div class="input-group">
                                <i class="fas fa-check-circle input-icon"></i>
                                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control icon-input" required>
                            </div>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-key me-2"></i>Change Password
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    &copy; 2025 UniClubs. Designed by Students, for Students.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <a href="#" class="text-secondary me-3"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-secondary me-3"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-secondary me-3"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-secondary"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>