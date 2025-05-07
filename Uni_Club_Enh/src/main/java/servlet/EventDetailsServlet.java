// EventDetailsServlet.java
package servlet;

import dao.EventDAO;
import dao.RegistrationDAO;
import model.Event;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/event-details")
public class EventDetailsServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final EventDAO eventDAO = new EventDAO();
    private final RegistrationDAO registrationDAO = new RegistrationDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login");
            return;
        }
        
        String eventIdParam = request.getParameter("id");
        
        if (eventIdParam == null || eventIdParam.trim().isEmpty()) {
            response.sendRedirect("events");
            return;
        }
        
        try {
            int eventId = Integer.parseInt(eventIdParam);
            int userId = (int) session.getAttribute("userId");
            
            Event event = eventDAO.getEventById(eventId);
            
            if (event != null) {
                request.setAttribute("event", event);
                
                // Check if user is already registered for this event
                boolean isRegistered = registrationDAO.isUserRegisteredForEvent(userId, eventId);
                request.setAttribute("isRegistered", isRegistered);
                
                request.getRequestDispatcher("/event-details.jsp").forward(request, response);
            } else {
                response.sendRedirect("events");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("events");
        }
    }
}