// RegisteredEventsServlet.java
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
import java.util.List;

@WebServlet("/registered-events")
public class RegisteredEventsServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final RegistrationDAO registrationDAO = new RegistrationDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login");
            return;
        }
        
        int userId = (int) session.getAttribute("userId");
        
        List<Registration> registrations = registrationDAO.getRegisteredEventsByUserId(userId);
        request.setAttribute("registrations", registrations);
        
        request.getRequestDispatcher("/registered-events.jsp").forward(request, response);
    }
}