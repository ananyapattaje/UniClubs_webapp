// EventRegistrationServlet.java
package servlet;

import dao.RegistrationDAO;
import model.Registration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register-event")
public class EventRegistrationServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final RegistrationDAO registrationDAO = new RegistrationDAO();
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(false);

	    if (session == null || session.getAttribute("userId") == null) {
	        response.sendRedirect("login");
	        return;
	    }

	    int userId = (int) session.getAttribute("userId");
	    String eventIdParam = request.getParameter("eventId");
	    String name = request.getParameter("name");
	    String registerNumber = request.getParameter("registerNumber");
	    String email = request.getParameter("email");
	    String phoneNumber = request.getParameter("phoneNumber");
	    String branch = request.getParameter("branch");
	    String section = request.getParameter("section");

	    // Validate inputs
	    if (eventIdParam == null || eventIdParam.trim().isEmpty() ||
	        name == null || name.trim().isEmpty() ||
	        registerNumber == null || registerNumber.trim().isEmpty() ||
	        email == null || email.trim().isEmpty() ||
	        phoneNumber == null || phoneNumber.trim().isEmpty() ||
	        branch == null || branch.trim().isEmpty() ||
	        section == null || section.trim().isEmpty()) {

	        response.sendRedirect("event-details?id=" + eventIdParam + "&error=missingFields");
	        return;
	    }

	    try {
	        int eventId = Integer.parseInt(eventIdParam);

	        // Check if already registered
	        if (registrationDAO.isUserRegisteredForEvent(userId, eventId)) {
	            response.sendRedirect("event-details?id=" + eventId + "&error=alreadyRegistered");
	            return;
	        }

	        // Create registration
	        Registration registration = new Registration(userId, eventId, name, registerNumber, email, phoneNumber, branch, section);
	        boolean registered = registrationDAO.registerForEvent(registration);

	        if (registered) {
	            response.sendRedirect("event-details?id=" + eventId + "&success=true");
	        } else {
	            response.sendRedirect("event-details?id=" + eventId + "&error=failed");
	        }
	    } catch (NumberFormatException e) {
	        response.sendRedirect("events");
	    }
	}
}
