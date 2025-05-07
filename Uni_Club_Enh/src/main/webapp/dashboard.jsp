<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Event" %>
<%@ page import="model.Registration" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Club - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/uniclubs.css">
    <style>
        .stat-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 25px;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .stat-icon {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 15px;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: var(--secondary);
            font-size: 0.9rem;
        }
        
        .carousel-control-prev,
        .carousel-control-next {
            width: 40px;
            height: 40px;
            background-color: var(--primary);
            border-radius: 50%;
            top: 50%;
            transform: translateY(-50%);
            opacity: 0.7;
        }
        
        .carousel-control-prev {
            left: -20px;
        }
        
        .carousel-control-next {
            right: -20px;
        }
        
        .carousel-control-prev:hover,
        .carousel-control-next:hover {
            opacity: 1;
        }
        
        .carousel-indicators {
            bottom: -40px;
        }
        
        .carousel-indicators button {
            background-color: var(--primary);
            width: 10px;
            height: 10px;
            border-radius: 50%;
        }
        
        .quote-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
            text-align: center;
            position: relative;
        }
        
        .quote-card:before {
            content: '\201C';
            font-size: 80px;
            position: absolute;
            top: -20px;
            left: 20px;
            color: rgba(0, 102, 204, 0.1);
            font-family: Georgia, serif;
        }
        
        .blockquote {
            font-style: italic;
            margin-bottom: 20px;
        }
        
        .blockquote-footer {
            font-weight: 600;
            color: var(--primary);
        }
        
        .tips-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 25px;
        }
        
        .tips-card ul {
            padding-left: 20px;
        }
        
        .tips-card li {
            margin-bottom: 10px;
            position: relative;
            padding-left: 10px;
        }
        
        .tips-card li:before {
            content: '';
            position: absolute;
            left: -15px;
            top: 10px;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background-color: var(--primary);
        }
        
        .welcome-message {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 30px;
            display: flex;
            align-items: center;
        }
        
        .welcome-icon {
            color: var(--primary);
            margin-right: 15px;
            font-size: 2rem;
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
            <h1 class="display-5 fw-bold mb-3">Welcome to Your Dashboard</h1>
            <p class="lead mb-0">Manage and keep track of all your event registrations.</p>
        </div>
    </div>

    <div class="container mt-5">
        <div class="welcome-message">
            <i class="fas fa-hand-wave welcome-icon"></i>
            Hello, <%= session.getAttribute("userName") %>!
        </div>

        <div class="row mb-5">
            <div class="col-md-4 mb-4">
                <div class="stat-card">
                    <i class="fas fa-calendar-alt stat-icon"></i>
                    <div class="stat-number">
                        <% 
                        List<Event> upcomingEvents = (List<Event>) request.getAttribute("upcomingEvents");
                        out.print(upcomingEvents != null ? upcomingEvents.size() : 0);
                        %>
                    </div>
                    <div class="stat-label">Upcoming Events</div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="stat-card">
                    <i class="fas fa-clipboard-check stat-icon"></i>
                    <div class="stat-number">
                        <% 
                        List<Registration> registeredEvents = (List<Registration>) request.getAttribute("registeredEvents");
                        out.print(registeredEvents != null ? registeredEvents.size() : 0);
                        %>
                    </div>
                    <div class="stat-label">Registered Events</div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="stat-card">
                    <i class="fas fa-certificate stat-icon"></i>
                    <div class="stat-number">
                        <%= (registeredEvents != null ? registeredEvents.size() : 0) * 10 %>
                    </div>
                    <div class="stat-label">Achievement Points</div>
                </div>
            </div>
        </div>

        <div class="section">
            <h3 class="section-title">Upcoming Events</h3>

            <% 
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy HH:mm");

            if (upcomingEvents != null && !upcomingEvents.isEmpty()) {
            %>
                <div id="eventCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <%
                        for (int i = 0; i < upcomingEvents.size(); i++) {
                            Event event = upcomingEvents.get(i);
                        %>
                            <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
                                <div class="event-card mx-auto" style="max-width: 700px;">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <h4 class="mb-0"><%= event.getTitle() %></h4>
                                        <span class="event-date"><i class="far fa-calendar-alt me-2"></i><%= dateFormat.format(event.getEventDate()) %></span>
                                    </div>
                                    <div class="event-venue mb-3">
                                        <i class="fas fa-map-marker-alt"></i>
                                        <%= event.getVenue() %>
                                    </div>
                                    <p class="mb-4"><%= event.getDescription() != null ? (event.getDescription().length() > 150 ? event.getDescription().substring(0, 150) + "..." : event.getDescription()) : "" %></p>
                                    <div class="text-center">
                                        <a href="event-details?id=<%= event.getId() %>" class="view-button">
                                            <i class="fas fa-info-circle me-2"></i>View Details
                                        </a>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#eventCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#eventCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                    <div class="carousel-indicators">
                        <% for (int i = 0; i < upcomingEvents.size(); i++) { %>
                            <button type="button" data-bs-target="#eventCarousel" data-bs-slide-to="<%= i %>" <%= (i == 0) ? "class=\"active\" aria-current=\"true\"" : "" %> aria-label="Slide <%= i+1 %>"></button>
                        <% } %>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <a href="events" class="btn btn-primary">
                        <i class="fas fa-calendar-alt me-2"></i>View All Events
                    </a>
                </div>
            <% 
            } else {
            %>
                <div class="message error-message">
                    <i class="fas fa-info-circle message-icon"></i>
                    <div>No upcoming events at the moment. Check back soon!</div>
                </div>
                <div class="text-center mt-4">
                    <a href="events" class="btn btn-primary">
                        <i class="fas fa-calendar-alt me-2"></i>Browse Events Archive
                    </a>
                </div>
            <% } %>
        </div>

        <div class="section mt-5">
            <h3 class="section-title">My Registered Events</h3>

            <% 
            if (registeredEvents != null && !registeredEvents.isEmpty()) {
            %>
                <div class="row">
                    <% for (Registration reg : registeredEvents) { %>
                        <div class="col-md-6 mb-4">
                            <div class="event-card h-100">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <h4 class="mb-0"><%= reg.getEventTitle() %></h4>
                                    <span class="event-date"><i class="far fa-calendar-alt me-2"></i><%= dateFormat.format(reg.getEventDate()) %></span>
                                </div>
                                <div class="d-flex mb-2">
                                    <div class="me-4">
                                        <span class="text-muted"><i class="fas fa-code-branch me-2 text-primary"></i>Branch:</span>
                                        <span class="fw-medium"><%= reg.getBranch() %></span>
                                    </div>
                                    <div>
                                        <span class="text-muted"><i class="fas fa-layer-group me-2 text-primary"></i>Section:</span>
                                        <span class="fw-medium"><%= reg.getSection() %></span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <span class="text-muted"><i class="fas fa-clock me-2 text-primary"></i>Registered on:</span>
                                    <span class="fw-medium"><%= dateFormat.format(reg.getRegistrationDate()) %></span>
                                </div>
                                <div class="text-center mt-3">
                                    <a href="event-details?id=<%= reg.getEventId() %>" class="view-button">
                                        <i class="fas fa-info-circle me-2"></i>View Details
                                    </a>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
                <div class="text-center mt-3">
                    <a href="registered-events" class="btn btn-primary">
                        <i class="fas fa-clipboard-check me-2"></i>Manage My Registrations
                    </a>
                </div>
            <% 
            } else {
            %>
                <div class="message error-message">
                    <i class="fas fa-info-circle message-icon"></i>
                    <div>You haven't registered for any events yet.</div>
                </div>
                <div class="text-center mt-4">
                    <a href="events" class="btn btn-primary">
                        <i class="fas fa-calendar-alt me-2"></i>Browse Available Events
                    </a>
                </div>
            <% } %>
        </div>

        <div class="section mt-5">
            <h3 class="section-title">Motivational Corner</h3>
            <div id="motivationCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="quote-card mx-auto" style="max-width: 700px;">
                            <blockquote class="blockquote mb-0">
                                <p>"The best way to predict the future is to create it."</p>
                                <footer class="blockquote-footer">Peter Drucker</footer>
                            </blockquote>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="quote-card mx-auto" style="max-width: 700px;">
                            <blockquote class="blockquote mb-0">
                                <p>"Success is not final, failure is not fatal: It is the courage to continue that counts."</p>
                                <footer class="blockquote-footer">Winston Churchill</footer>
                            </blockquote>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="quote-card mx-auto" style="max-width: 700px;">
                            <blockquote class="blockquote mb-0">
                                <p>"Don't watch the clock; do what it does. Keep going."</p>
                                <footer class="blockquote-footer">Sam Levenson</footer>
                            </blockquote>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#motivationCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#motivationCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#motivationCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#motivationCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#motivationCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
            </div>
        </div>

        <div class="section mt-5">
            <h3 class="section-title">Event Participation Tips</h3>
            <div class="tips-card">
                <ul class="mb-0">
                    <li>Arrive 10-15 minutes early to check in and find your seat.</li>
                    <li>Bring your student ID or registration QR code for quick verification.</li>
                    <li>Engage actively during Q&A sessions to maximize your learning.</li>
                    <li>Network with speakers and other attendees during breaks.</li>
                    <li>Take notes on key points to review later.</li>
                    <li>Follow up by connecting with new contacts on LinkedIn or social media.</li>
                    <li>Share your feedback after the event to help improve future experiences.</li>
                </ul>
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