<p>
  <img src="https://placehold.co/1000x500/transparent/0089fe?text=UniClubs+Webapp+-\nServlet+and+JSP+Based\nWeb+Application&font=Poppins&font-weight=700" />
</p>

A simple **University Club Management** system built using **Java Servlets**, **JSP**, **JDBC**, and **MySQL**.  
Users can register, log in, view events, register for events, and manage their profiles.

---

## 🪼 **Project Structure**

Uni\_Club\_Enh/ <br>
├── src/ <br>
│   ├── main/ <br>
│   │   ├── java/<br>
│   │   │   ├── dao/<br>
│   │   │   ├── model/<br>
│   │   │   ├── servlet/<br>
│   │   │   └── util/<br>
│   │   └── webapp/<br>
│   │       ├── WEB-INF/<br>
│   │       │   ├── lib/        <-- Required JAR Libraries<br>
│   │       │   └── web.xml     <-- Servlet Mappings<br>
│   │       ├── styles/<br>
│   │       ├── \*.jsp<br>
│   │       └── \*.html<br>
└── build/<br>


<br>

## 🪼 **Required JAR Libraries**
Place these inside:  
```

src/main/webapp/WEB-INF/lib/

````
### 🐬 Mandatory Libraries:
- `javax.servlet-api-3.0.1.jar`
- `javax.activation-api-1.2.0.jar`
- `jaxb-api-2.3.1.jar`
- `jaxb-runtime-2.3.1.jar`
- `mysql-connector-j-8.0.xx.jar`

<br>

## 🪼 **How to Setup & Run Locally**

### 🐬 **Database Setup (MySQL)**  
Login to MySQL and run the following:  

```sql
CREATE DATABASE university_club;
USE university_club;

-- `events` table
CREATE TABLE events (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    event_date DATETIME NOT NULL,
    venue VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- `users` table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    register_number VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- `registrations` table
CREATE TABLE registrations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    register_number VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    branch VARCHAR(100) NOT NULL,
    section VARCHAR(50) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);
````

<br>

### 🐬 **Database Connection (JDBC Config in `DBConnection.java`)**

```java
private final String jdbcURL = "jdbc:mysql://localhost:3306/university_club";
private final String jdbcUsername = "root";
private final String jdbcPassword = "your_password";
```

<br>

### 🐬 **Run Locally**

> Ensure Tomcat 9.x is properly configured with Eclipse.

🐬**Steps:**

1. Clean Project (`Project > Clean`)
2. Right-click Project → **Run on Server** → Apache Tomcat
3. Visit: `http://localhost:8080/Uni_Club_Enh/`

<br>

## 🪼 **Features**

* Register/Login/Logout
* View Events
* Register/Deregister from Events
* View Registered Events
* User Profile Management
* Dashboard Overview

<br>

## 🪼 **How it Works**

* Servlets control logic and routes
* JSP renders views
* JDBC connects to MySQL database
* CSS for styling

<br>

## 🪼 **Acknowledgements**

* Apache Tomcat
* MySQL
* Java Servlet API
* Eclipse IDE

## 🪼 **Website Demo Preview**

![demo preview](assets/demovid.gif)

---
## **Author**
Ananya P S

