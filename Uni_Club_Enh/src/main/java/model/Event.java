// Event.java
package model;

import java.sql.Timestamp;
import java.util.Date;

public class Event {
    private int id;
    private String title;
    private String description;
    private Date eventDate;
    private String venue;
    private Timestamp createdAt;
    
    // Constructors
    public Event() {}
    
    public Event(String title, String description, Date eventDate, String venue) {
        this.title = title;
        this.description = description;
        this.eventDate = eventDate;
        this.venue = venue;
    }
    
    // Getters and setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public Date getEventDate() {
        return eventDate;
    }
    
    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }
    
    public String getVenue() {
        return venue;
    }
    
    public void setVenue(String venue) {
        this.venue = venue;
    }
    
    public Timestamp getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
