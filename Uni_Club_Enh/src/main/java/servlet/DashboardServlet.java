// DashboardServlet.java
package servlet;

import dao.EventDAO;
import dao.RegistrationDAO;
import model.Event;
import model.Registration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    
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
        
        int userId = (int) session.getAttribute("userId");
        
        // Get upcoming events
        List<Event> upcomingEvents = eventDAO.getAllUpcomingEvents();
        request.setAttribute("upcomingEvents", upcomingEvents);
        
        // Get user's registered events
        List<Registration> registeredEvents = registrationDAO.getRegisteredEventsByUserId(userId);
        request.setAttribute("registeredEvents", registeredEvents);
        
        request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
    }
}
