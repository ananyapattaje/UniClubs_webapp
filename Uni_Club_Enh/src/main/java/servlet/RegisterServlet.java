// RegisterServlet.java
package servlet;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final UserDAO userDAO = new UserDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.html").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String registerNumber = request.getParameter("registerNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        
        // Validate inputs
        if (name == null || name.trim().isEmpty() ||
            registerNumber == null || registerNumber.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty()) {
            
            response.setContentType("text/html");
            response.getWriter().println("<html><body>");
            response.getWriter().println("<h2>Error</h2>");
            response.getWriter().println("<p>All fields are required.</p>");
            response.getWriter().println("<a href='register'>Back to Registration</a>");
            response.getWriter().println("</body></html>");
            return;
        }
        
        // Check if email already exists
        if (userDAO.getUserByEmail(email) != null) {
            response.setContentType("text/html");
            response.getWriter().println("<html><body>");
            response.getWriter().println("<h2>Error</h2>");
            response.getWriter().println("<p>Email already registered.</p>");
            response.getWriter().println("<a href='register'>Back to Registration</a>");
            response.getWriter().println("</body></html>");
            return;
        }
        
        // Hash password
        String hashedPassword = PasswordUtil.hashPassword(password);
        
        // Create user object
        User user = new User(name, registerNumber, email, hashedPassword, phone);
        
        // Register user
        boolean registered = userDAO.registerUser(user);
        
        if (registered) {
            response.sendRedirect("login?registered=true");
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<html><body>");
            response.getWriter().println("<h2>Error</h2>");
            response.getWriter().println("<p>Registration failed. Please try again.</p>");
            response.getWriter().println("<a href='register'>Back to Registration</a>");
            response.getWriter().println("</body></html>");
        }
    }
}