package dao;

import model.Event;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {

    public List<Event> getAllUpcomingEvents() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Event> events = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();
            
            // ✅ MySQL-compatible date comparison using CURDATE()
            String sql = "SELECT * FROM events WHERE event_date >= CURDATE() ORDER BY event_date ASC";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getInt("id"));
                event.setTitle(rs.getString("title"));
                event.setDescription(rs.getString("description"));
                event.setEventDate(rs.getTimestamp("event_date"));
                event.setVenue(rs.getString("venue"));
                event.setCreatedAt(rs.getTimestamp("created_at"));
                events.add(event);
            }

            // Debug log
            System.out.println("Number of upcoming events retrieved: " + events.size());
            for (Event event : events) {
                System.out.println("Event: " + event.getTitle() + ", Date: " + event.getEventDate());
            }

            return events;

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

    public Event getEventById(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Event event = null;

        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT * FROM events WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                event = new Event();
                event.setId(rs.getInt("id"));
                event.setTitle(rs.getString("title"));
                event.setDescription(rs.getString("description"));
                event.setEventDate(rs.getTimestamp("event_date"));
                event.setVenue(rs.getString("venue"));
                event.setCreatedAt(rs.getTimestamp("created_at"));
            }

            return event;

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

    public boolean addEvent(Event event) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnection.getConnection();

            String sql = "INSERT INTO events (title, description, event_date, venue) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, event.getTitle());
            pstmt.setString(2, event.getDescription());
            pstmt.setTimestamp(3, new Timestamp(event.getEventDate().getTime()));
            pstmt.setString(4, event.getVenue());

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
}
