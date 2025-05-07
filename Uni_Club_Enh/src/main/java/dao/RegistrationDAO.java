// RegistrationDAO.java
package dao;

import model.Registration;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RegistrationDAO {

    public boolean registerForEvent(Registration registration) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO registrations (user_id, event_id, name, register_number, email, phone_number, branch, section) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, registration.getUserId());
            pstmt.setInt(2, registration.getEventId());
            pstmt.setString(3, registration.getName());
            pstmt.setString(4, registration.getRegisterNumber());
            pstmt.setString(5, registration.getEmail());
            pstmt.setString(6, registration.getPhoneNumber());
            pstmt.setString(7, registration.getBranch());
            pstmt.setString(8, registration.getSection());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Registration> getRegisteredEventsByUserId(int userId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Registration> registrations = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT r.*, e.title as event_title, e.event_date FROM registrations r " +
                         "JOIN events e ON r.event_id = e.id " +
                         "WHERE r.user_id = ? ORDER BY e.event_date ASC";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Registration registration = new Registration();
                registration.setId(rs.getInt("id"));
                registration.setUserId(rs.getInt("user_id"));
                registration.setEventId(rs.getInt("event_id"));
                registration.setName(rs.getString("name"));
                registration.setRegisterNumber(rs.getString("register_number"));
                registration.setEmail(rs.getString("email"));
                registration.setPhoneNumber(rs.getString("phone_number"));
                registration.setBranch(rs.getString("branch"));
                registration.setSection(rs.getString("section"));
                registration.setRegistrationDate(rs.getTimestamp("registration_date"));
                registration.setEventTitle(rs.getString("event_title"));
                registration.setEventDate(rs.getTimestamp("event_date"));
                registrations.add(registration);
            }

            return registrations;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
 // RegistrationDAO.java
    public boolean deregisterFromEvent(String userId, String eventId) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "DELETE FROM registrations WHERE user_id = ? AND event_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.valueOf(userId));
            pstmt.setInt(2, Integer.valueOf(eventId));

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public boolean isUserRegisteredForEvent(int userId, int eventId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM registrations WHERE user_id = ? AND event_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, eventId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                DBConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
