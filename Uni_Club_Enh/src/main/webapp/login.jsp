<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>University Club - Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="styles/uniclubs.css">
</head>
<body class="bg-image-overlay">
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand" href="home">UniClubs</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home"><i class="fas fa-home me-1"></i>Home</a></li>
                <li class="nav-item"><a class="nav-link" href="login"><i class="fas fa-sign-in-alt me-1"></i>Login</a></li>
                <li class="nav-item"><a class="nav-link" href="register"><i class="fas fa-user-plus me-1"></i>Register</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="login-container">
        <h2 class="mb-4 text-center">Welcome Back</h2>
        <p class="text-center text-muted mb-4">Sign in to access your UniClubs account</p>

        <%-- Check if user just registered --%>
        <% if (request.getParameter("registered") != null && request.getParameter("registered").equals("true")) { %>
            <div class="message success-message">
                <i class="fas fa-check-circle message-icon"></i>
                <div>
                    <strong>Registration successful!</strong> Please login with your credentials.
                </div>
            </div>
        <% } %>

        <form action="login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <div class="input-group">
                    <i class="fas fa-envelope input-icon"></i>
                    <input type="email" class="form-control icon-input" id="email" name="email" placeholder="Enter your email" required>
                </div>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label">Password</label>
                <div class="input-group">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" class="form-control icon-input" id="password" name="password" placeholder="Enter your password" required>
                </div>
            </div>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="remember">
                    <label class="form-check-label" for="remember">Remember me</label>
                </div>
                <a href="#" class="text-primary">Forgot password?</a>
            </div>

            <div class="d-grid mb-4">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-sign-in-alt me-2"></i>Login
                </button>
            </div>
        </form>

        <div class="divider">
            <span class="divider-text">or continue with</span>
        </div>

        <div class="social-login">
            <a href="#" class="social-btn google">
                <i class="fab fa-google"></i>
            </a>
            <a href="#" class="social-btn facebook">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#" class="social-btn twitter">
                <i class="fab fa-twitter"></i>
            </a>
        </div>

        <p class="text-center mt-4">Don't have an account? <a href="register" class="text-primary fw-bold">Register here</a></p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>