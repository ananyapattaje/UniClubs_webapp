// LoginServlet.java
package servlet;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final UserDAO userDAO = new UserDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Validate inputs
        if (email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            
            response.setContentType("text/html");
            response.getWriter().println("<html><body>");
            response.getWriter().println("<h2>Error</h2>");
            response.getWriter().println("<p>Email and password are required.</p>");
            response.getWriter().println("<a href='login'>Back to Login</a>");
            response.getWriter().println("</body></html>");
            return;
        }
        
        // Get user by email
        User user = userDAO.getUserByEmail(email);
        
        // Check if user exists and password is correct
        if (user != null && PasswordUtil.verifyPassword(password, user.getPassword())) {
            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getId());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userName", user.getName());
            
            // Redirect to dashboard
            response.sendRedirect("dashboard");
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<html><body>");
            response.getWriter().println("<h2>Error</h2>");
            response.getWriter().println("<p>Invalid email or password.</p>");
            response.getWriter().println("<a href='login'>Back to Login</a>");
            response.getWriter().println("</body></html>");
        }
    }
}