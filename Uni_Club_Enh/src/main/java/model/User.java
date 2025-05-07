// User.java
package model;

import java.sql.Timestamp;

public class User {
    private int id;
    private String name;
    private String registerNumber;
    private String email;
    private String password;
    private String phone;
    private Timestamp createdAt;
    
    // Constructors
    public User() {}
    
    public User(String name, String registerNumber, String email, String password, String phone) {
        this.name = name;
        this.registerNumber = registerNumber;
        this.email = email;
        this.password = password;
        this.phone = phone;
    }
    
    // Getters and setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
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
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public Timestamp getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
