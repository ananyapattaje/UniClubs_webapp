<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Registration" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Club - My Registered Events</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/uniclubs.css">
    <style>
        .registration-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 25px;
            margin-bottom: 30px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .registration-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .registration-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background-color: var(--primary);
        }
        
        .registration-title {
            color: var(--primary);
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .registration-meta {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }
        
        .registration-meta-item {
            display: flex;
            align-items: center;
            margin-right: 30px;
            margin-bottom: 15px;
        }
        
        .registration-meta-icon {
            color: var(--primary);
            margin-right: 10px;
            font-size: 1.1rem;
        }
        
        .registration-meta-label {
            font-size: 0.9rem;
            color: var(--secondary);
            margin-bottom: 2px;
        }
        
        .registration-meta-value {
            font-weight: 600;
            color: var(--dark);
        }
        
        .registration-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .registration-status {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            background-color: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .registration-status.upcoming {
            background-color: rgba(0, 102, 204, 0.1);
            color: var(--primary);
        }
        
        .registration-status.completed {
            background-color: rgba(108, 117, 125, 0.1);
            color: var(--secondary);
        }
        
        .no-registrations {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 40px;
            text-align: center;
        }
        
        .no-registrations-icon {
            font-size: 4rem;
            color: var(--primary-light);
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
        <div class="container">
            <a class="navbar-brand" href="home">UniClubs</a>
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

    <div class="hero">
        <div class="container hero-content">
            <h1 class="display-5 fw-bold mb-3">My Registered Events</h1>
            <p class="lead mb-0">Track and manage all your event registrations</p>
        </div>
    </div>

    <div class="container mt-5">
        <% 
        List<Registration> registrations = (List<Registration>) request.getAttribute("registrations");
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy HH:mm");
        
        if (registrations != null && !registrations.isEmpty()) { 
        %>
            <% for (Registration reg : registrations) { 
                // Determine if event is upcoming, active, or completed
                java.util.Date now = new java.util.Date();
                String status = "active";
                if (reg.getEventDate().after(now)) {
                    status = "upcoming";
                } else if (reg.getEventDate().before(new java.util.Date(now.getTime() - 86400000))) { // 24 hours ago
                    status = "completed";
                }
            %>
                <div class="registration-card">
                    <h3 class="registration-title"><%= reg.getEventTitle() %></h3>
                    
                    <div class="registration-meta">
                        <div class="registration-meta-item">
                            <div class="registration-meta-icon">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <div>
                                <div class="registration-meta-label">Event Date</div>
                                <div class="registration-meta-value"><%= dateFormat.format(reg.getEventDate()) %></div>
                            </div>
                        </div>
                        
                        <div class="registration-meta-item">
                            <div class="registration-meta-icon">
                                <i class="fas fa-code-branch"></i>
                            </div>
                            <div>
                                <div class="registration-meta-label">Branch</div>
                                <div class="registration-meta-value"><%= reg.getBranch() %></div>
                            </div>
                        </div>
                        
                        <div class="registration-meta-item">
                            <div class="registration-meta-icon">
                                <i class="fas fa-layer-group"></i>
                            </div>
                            <div>
                                <div class="registration-meta-label">Section</div>
                                <div class="registration-meta-value"><%= reg.getSection() %></div>
                            </div>
                        </div>
                        
                        <div class="registration-meta-item">
                            <div class="registration-meta-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div>
                                <div class="registration-meta-label">Registration Date</div>
                                <div class="registration-meta-value"><%= dateFormat.format(reg.getRegistrationDate()) %></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="registration-actions">
                        <div class="registration-status <%= status %>">
                            <% if (status.equals("upcoming")) { %>
                                <i class="fas fa-hourglass-half me-1"></i>Upcoming
                            <% } else if (status.equals("active")) { %>
                                <i class="fas fa-check-circle me-1"></i>Active
                            <% } else { %>
                                <i class="fas fa-flag-checkered me-1"></i>Completed
                            <% } %>
                        </div>
                        
                        <div>
                            <a href="event-details?id=<%= reg.getEventId() %>" class="btn btn-outline-primary btn-sm me-2">
                                <i class="fas fa-info-circle me-1"></i>View Details
                            </a>
                            
                            <% if (!status.equals("completed")) { %>
                                <form action="deregister-event" method="post" class="d-inline">
                                    <input type="hidden" name="eventId" value="<%= reg.getEventId() %>">
                                    <button type="submit" class="btn btn-outline-danger btn-sm">
                                        <i class="fas fa-times-circle me-1"></i>Deregister
                                    </button>
                                </form>
                            <% } %>
                        </div>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <div class="no-registrations">
                <i class="fas fa-calendar-times no-registrations-icon"></i>
                <h3 class="mb-3">No Registered Events</h3>
                <p class="text-muted mb-4">You haven't registered for any events yet. Browse our upcoming events and join the ones that interest you!</p>
                <a href="events" class="btn btn-primary">
                    <i class="fas fa-calendar-alt me-2"></i>Browse Available Events
                </a>
            </div>
        <% } %>
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