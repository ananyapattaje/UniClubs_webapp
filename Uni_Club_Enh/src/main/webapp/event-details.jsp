<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Event" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Club - Event Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/uniclubs.css">
    <style>
        .event-detail-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-bottom: 30px;
        }
        
        .event-title {
            color: var(--primary);
            font-weight: 700;
            margin-bottom: 20px;
        }
        
        .event-meta {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }
        
        .event-meta-item {
            display: flex;
            align-items: center;
            margin-right: 30px;
            margin-bottom: 15px;
        }
        
        .event-meta-icon {
            width: 40px;
            height: 40px;
            background-color: var(--primary-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: var(--primary);
        }
        
        .event-meta-label {
            font-size: 0.9rem;
            color: var(--secondary);
            margin-bottom: 2px;
        }
        
        .event-meta-value {
            font-weight: 600;
            color: var(--dark);
        }
        
        .event-description {
            margin-bottom: 30px;
            line-height: 1.8;
        }
        
        .registration-form {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }
        
        .form-title {
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 25px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .form-title:after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            background-color: var(--primary);
            bottom: 0;
            left: 0;
        }
        
        .deregister-btn {
            background-color: var(--danger);
            color: white;
            border: none;
            border-radius: 30px;
            padding: 12px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .deregister-btn:hover {
            background-color: #c82333;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
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
            <h1 class="display-5 fw-bold mb-3">Event Details</h1>
            <p class="lead mb-0">Learn more and register for this exciting event</p>
        </div>
    </div>

    <div class="container mt-5">
        <%
        Event event = (Event) request.getAttribute("event");
        boolean isRegistered = (boolean) request.getAttribute("isRegistered");
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy HH:mm");
        
        if (request.getParameter("success") != null) {
        %>
            <div class="message success-message mb-4">
                <i class="fas fa-check-circle message-icon"></i>
                <div>Successfully registered for the event! We look forward to seeing you there.</div>
            </div>
        <% } else if (request.getParameter("error") != null) { %>
            <div class="message error-message mb-4">
                <i class="fas fa-exclamation-circle message-icon"></i>
                <div>Error registering for the event. Please try again or contact support.</div>
            </div>
        <% } %>

        <div class="row">
            <div class="col-lg-8">
                <div class="event-detail-card">
                    <h2 class="event-title"><%= event.getTitle() %></h2>
                    
                    <div class="event-meta">
                        <div class="event-meta-item">
                            <div class="event-meta-icon">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <div>
                                <div class="event-meta-label">Date & Time</div>
                                <div class="event-meta-value"><%= dateFormat.format(event.getEventDate()) %></div>
                            </div>
                        </div>
                        
                        <div class="event-meta-item">
                            <div class="event-meta-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div>
                                <div class="event-meta-label">Venue</div>
                                <div class="event-meta-value"><%= event.getVenue() %></div>
                            </div>
                        </div>
                        
                        <div class="event-meta-item">
                            <div class="event-meta-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div>
                                <div class="event-meta-label">Status</div>
                                <div class="event-meta-value"><%= isRegistered ? "Registered" : "Open for Registration" %></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="event-description">
                        <h5 class="mb-3">About This Event</h5>
                        <p><%= event.getDescription() %></p>
                    </div>
                    
                    <% if (isRegistered) { %>
                        <div class="message success-message">
                            <i class="fas fa-check-circle message-icon"></i>
                            <div>You are already registered for this event. We look forward to seeing you there!</div>
                        </div>
                        <form action="deregister-event" method="post" class="mt-4 text-center">
                            <input type="hidden" name="eventId" value="<%= event.getId() %>">
                            <button type="submit" class="deregister-btn">
                                <i class="fas fa-times-circle me-2"></i>Deregister from Event
                            </button>
                        </form>
                    <% } %>
                </div>
            </div>
            
            <div class="col-lg-4">
                <% if (!isRegistered) { %>
                    <div class="registration-form">
                        <h3 class="form-title">Register for this Event</h3>
                        <form action="register-event" method="post">
                            <input type="hidden" name="eventId" value="<%= event.getId() %>">
                            
                            <div class="mb-3">
                                <label for="name" class="form-label">Full Name</label>
                                <div class="input-group">
                                    <i class="fas fa-user input-icon"></i>
                                    <input type="text" id="name" name="name" class="form-control icon-input" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="registerNumber" class="form-label">Register Number</label>
                                <div class="input-group">
                                    <i class="fas fa-id-card input-icon"></i>
                                    <input type="text" id="registerNumber" name="registerNumber" class="form-control icon-input" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <div class="input-group">
                                    <i class="fas fa-envelope input-icon"></i>
                                    <input type="email" id="email" name="email" class="form-control icon-input" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="phoneNumber" class="form-label">Phone Number</label>
                                <div class="input-group">
                                    <i class="fas fa-phone input-icon"></i>
                                    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control icon-input" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="branch" class="form-label">Branch</label>
                                <div class="input-group">
                                    <i class="fas fa-code-branch input-icon"></i>
                                    <input type="text" id="branch" name="branch" class="form-control icon-input" required>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="section" class="form-label">Section</label>
                                <div class="input-group">
                                    <i class="fas fa-layer-group input-icon"></i>
                                    <input type="text" id="section" name="section" class="form-control icon-input" required>
                                </div>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-check-circle me-2"></i>Register Now
                                </button>
                            </div>
                        </form>
                    </div>
                <% } %>
                
                <div class="card mt-4">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-share-alt me-2 text-primary"></i>Share This Event</h5>
                        <div class="d-flex justify-content-around mt-3">
                            <a href="#" class="btn btn-outline-primary btn-sm rounded-circle p-2">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="btn btn-outline-info btn-sm rounded-circle p-2">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="btn btn-outline-success btn-sm rounded-circle p-2">
                                <i class="fab fa-whatsapp"></i>
                            </a>
                            <a href="#" class="btn btn-outline-secondary btn-sm rounded-circle p-2">
                                <i class="fas fa-envelope"></i>
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="card mt-4">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-question-circle me-2 text-primary"></i>Need Help?</h5>
                        <p class="card-text">If you have any questions about this event, please contact us:</p>
                        <div class="d-flex align-items-center mb-2">
                            <i class="fas fa-envelope text-primary me-2"></i>
                            <span>events@uniclubs.edu</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <i class="fas fa-phone text-primary me-2"></i>
                            <span>+1 (123) 456-7890</span>
                        </div>
                    </div>
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