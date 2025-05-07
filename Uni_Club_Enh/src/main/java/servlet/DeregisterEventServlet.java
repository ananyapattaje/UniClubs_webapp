package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.RegistrationDAO;

@WebServlet("/deregister-event")
public class DeregisterEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the event ID from the request
        String eventId = request.getParameter("eventId");
        Object userIdObj = request.getSession().getAttribute("userId"); // Retrieve userId from session

        // Ensure userId is converted to String
        String userId = (userIdObj != null) ? userIdObj.toString() : null;

        if (eventId != null && userId != null) {
            // Call the DAO to remove the registration
            RegistrationDAO registrationDao = new RegistrationDAO();
            boolean success = registrationDao.deregisterFromEvent(userId, eventId);

            if (success) {
                // Redirect to the registered events page with a success message
                response.sendRedirect("registered-events?success=deregistered");
            } else {
                // Redirect to the registered events page with an error message
                response.sendRedirect("registered-events?error=deregistration_failed");
            }
        } else {
            // Redirect to the registered events page with an error message
            response.sendRedirect("registered-events?error=invalid_request");
        }
    }
}
