// Registration.java
package model;

import java.sql.Timestamp;

public class Registration {
    private int id;
    private int userId;
    private int eventId;
    private String name;
    private String registerNumber;
    private String email;
    private String phoneNumber;
    private String branch;
    private String section;
    private Timestamp registrationDate;

    // Extra fields for joined data
    private String eventTitle;
    private java.util.Date eventDate;

    // Constructors
    public Registration() {}

    public Registration(int userId, int eventId, String name, String registerNumber, String email, String phoneNumber, String branch, String section) {
        this.userId = userId;
        this.eventId = eventId;
        this.name = name;
        this.registerNumber = registerNumber;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.branch = branch;
        this.section = section;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRegisterNumber() {
        return registerNumber;
    }

    public void setRegisterNumber(String registerNumber) {
        this.registerNumber = registerNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public Timestamp getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Timestamp registrationDate) {
        this.registrationDate = registrationDate;
    }

    // Getters and setters for joined data
    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public java.util.Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(java.util.Date eventDate) {
        this.eventDate = eventDate;
    }
}
