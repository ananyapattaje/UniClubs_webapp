// ProfileServlet.java
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

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final UserDAO userDAO = new UserDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login");
            return;
        }
        
        int userId = (int) session.getAttribute("userId");
        User user = userDAO.getUserById(userId);
        
        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("logout");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login");
            return;
        }
        
        int userId = (int) session.getAttribute("userId");
        User user = userDAO.getUserById(userId);
        
        if (user != null) {
            String name = request.getParameter("name");
            String registerNumber = request.getParameter("registerNumber");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            
            // Update basic info
            if (name != null && !name.trim().isEmpty()) {
                user.setName(name);
            }
            if (registerNumber != null && !registerNumber.trim().isEmpty()) {
                user.setRegisterNumber(registerNumber);
            }
            if (email != null && !email.trim().isEmpty()) {
                user.setEmail(email);
            }
            if (phone != null && !phone.trim().isEmpty()) {
                user.setPhone(phone);
            }
            
            userDAO.updateUser(user);
            
            // Update session with new values
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userName", user.getName());
            
            // Update password if provided
            if (currentPassword != null && !currentPassword.trim().isEmpty() && 
                newPassword != null && !newPassword.trim().isEmpty()) {
                
                if (PasswordUtil.verifyPassword(currentPassword, user.getPassword())) {
                    String hashedNewPassword = PasswordUtil.hashPassword(newPassword);
                    userDAO.updatePassword(userId, hashedNewPassword);
                    response.sendRedirect("profile?passwordUpdated=true");
                    return;
                } else {
                    response.sendRedirect("profile?passwordError=true");
                    return;
                }
            }
            
            response.sendRedirect("profile?updated=true");
        } else {
            response.sendRedirect("logout");
        }
    }
}
