<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Event" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>University Club - Events</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/uniclubs.css">
    <style>
        .events-header {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 25px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .events-title {
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 0;
        }
        
        .filter-dropdown {
            min-width: 200px;
        }
        
        .event-category {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-bottom: 15px;
        }
        
        .category-tech {
            background-color: rgba(0, 102, 204, 0.1);
            color: var(--primary);
        }
        
        .category-culture {
            background-color: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }
        
        .category-career {
            background-color: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .category-workshop {
            background-color: rgba(255, 193, 7, 0.1);
            color: var(--warning);
        }
        
        .event-card {
            display: flex;
            flex-direction: column;
        }
        
        .event-actions {
            margin-top: auto;
            padding-top: 15px;
        }
        
        .no-events {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 40px;
            text-align: center;
        }
        
        .no-events-icon {
            font-size: 4rem;
            color: var(--primary-light);
            margin-bottom: 20px;
        }
        
        @media (max-width: 768px) {
            .events-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .filter-dropdown {
                margin-top: 15px;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
        <div class="container">
            <a class="navbar-brand" href="dashboard">UniClubs</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
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
            <h1 class="display-5 fw-bold mb-3">Upcoming Events</h1>
            <p class="lead mb-0">Discover and register for exciting events happening on campus</p>
        </div>
    </div>

    <div class="container mt-5">
        <div class="events-header">
            <h2 class="events-title">All Upcoming Events</h2>
            <div class="dropdown filter-dropdown">
                <button class="btn btn-outline-primary dropdown-toggle" type="button" id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-filter me-2"></i>Filter Events
                </button>
                <ul class="dropdown-menu" aria-labelledby="filterDropdown">
                    <li><a class="dropdown-item" href="#">All Events</a></li>
                    <li><a class="dropdown-item" href="#">This Week</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Tech Events</a></li>
                    <li><a class="dropdown-item" href="#">Cultural Events</a></li>
                    <li><a class="dropdown-item" href="#">Career Events</a></li>
                    <li><a class="dropdown-item" href="#">Workshops</a></li>
                </ul>
            </div>
        </div>

        <% 
        List<Event> upcomingEvents = (List<Event>) request.getAttribute("upcomingEvents");
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy HH:mm");
        
        if (upcomingEvents != null && !upcomingEvents.isEmpty()) {
        %>
            <div class="row">
                <% 
                for (int i = 0; i < upcomingEvents.size(); i++) {
                    Event event = upcomingEvents.get(i);
                    
                    // Assign random categories for demonstration
                    String[] categories = {"tech", "culture", "career", "workshop"};
                    String category = categories[i % categories.length];
                %>
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="event-card h-100">
                            <span class="event-category category-<%= category %>">
                                <% if (category.equals("tech")) { %>
                                    <i class="fas fa-laptop-code me-1"></i>Tech
                                <% } else if (category.equals("culture")) { %>
                                    <i class="fas fa-theater-masks me-1"></i>Culture
                                <% } else if (category.equals("career")) { %>
                                    <i class="fas fa-briefcase me-1"></i>Career
                                <% } else { %>
                                    <i class="fas fa-chalkboard-teacher me-1"></i>Workshop
                                <% } %>
                            </span>
                            
                            <h4><%= event.getTitle() %></h4>
                            
                            <div class="event-date mb-3">
                                <i class="far fa-calendar-alt me-2"></i><%= dateFormat.format(event.getEventDate()) %>
                            </div>
                            
                            <div class="event-venue mb-3">
                                <i class="fas fa-map-marker-alt"></i>
                                <%= event.getVenue() %>
                            </div>
                            
                            <p class="mb-4"><%= event.getDescription() != null ? (event.getDescription().length() > 100 ? event.getDescription().substring(0, 100) + "..." : event.getDescription()) : "" %></p>
                            
                            <div class="event-actions">
                                <a href="event-details?id=<%= event.getId() %>" class="view-button">
                                    <i class="fas fa-info-circle me-2"></i>View Details
                                </a>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } else { %>
            <div class="no-events">
                <i class="fas fa-calendar-times no-events-icon"></i>
                <h3 class="mb-3">No Upcoming Events</h3>
                <p class="text-muted mb-4">There are no upcoming events scheduled at the moment. Please check back later.</p>
                <a href="dashboard" class="btn btn-primary">
                    <i class="fas fa-home me-2"></i>Back to Dashboard
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