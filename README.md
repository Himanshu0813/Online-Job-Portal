# 🧑‍💼 Online Job Portal

An Online Job Portal web application built using Java Servlets, JSP, and JDBC with an Oracle Database. This platform allows job seekers to find and apply for jobs, and employers to post job openings and manage applications, offering a streamlined recruitment process.

---

## 🚀 Features

### 👤 Job Seeker
- Register and login
- Create and update profile
- Upload resume
- Search and apply for jobs
- View application status

### 🏢 Employer
- Register and login
- Post, edit, and delete job listings
- View applicants for posted jobs
- Manage company profile

### 🛡️ Admin
- Manage users and job listings
- Monitor application activity
- Delete inappropriate content

---

## 🛠️ Technologies Used

- **Frontend**: HTML5, CSS3, JavaScript
- **Backend**: Java Servlets, JSP
- **Database**: Oracle 11g/12c (via JDBC)
- **Server**: Apache Tomcat (v9+)
- **IDE**: Eclipse / IntelliJ IDEA

---

## 📁 Project Structure

Online-Job-Portal/
├── src/
│ ├── controller/ # Servlet classes
│ ├── dao/ # Data Access Objects (JDBC)
│ ├── model/ # Java Beans
├── WebContent/
│ ├── css/ # Stylesheets
│ ├── js/ # JavaScript files
│ ├── images/ # UI images
│ ├── jsp/ # JSP pages
│ └── WEB-INF/
│ └── web.xml # Deployment descriptor
├── lib/ # JDBC and other libraries
└── README.md

yaml
Copy code

---

## 🧰 Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/priti0123/Online-Job-Portal.git
cd Online-Job-Portal
2. Setup Oracle Database
Create a new Oracle DB user and schema.

Execute provided SQL scripts (if any) to create tables.

Update your DB credentials in the DAO classes.

java
Copy code
// Example in DBConnection.java
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String username = "your_db_username";
String password = "your_db_password";
3. Configure in Eclipse
Import the project as a Dynamic Web Project.

Add Oracle JDBC Driver (ojdbc8.jar) to lib/ and build path.

Ensure Apache Tomcat is configured.

4. Run the Application
Deploy to Tomcat Server in Eclipse.

Access the app at:
Copy code
http://localhost:8080/Online-Job-Portal/
