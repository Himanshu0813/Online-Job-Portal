# 🧑‍💼 Online Job Portal System
An Online Job Portal web application built using Java EE (JSP/Servlet), Oracle DB, and JDBC. The system facilitates job posting, job searching, and application management for three user roles: Admin, Employers, and Job Seekers.

📌 Table of Contents
📖 About the Project

🚀 Features

🗃️ Folder Structure

👥 User Roles

⚙️ Technologies Used

🛠️ Setup Instructions

📸 Screenshots (optional)

📄 License

📖 About the Project
This project is a web-based job portal system where:

Employers can post job vacancies.

Job seekers can register, search and apply for jobs.

Admins can manage users and monitor platform activity.

It is designed for learning enterprise web development with JSP/Servlets and backend integration with Oracle Database.

🚀 Features
✔️ User Registration & Login (Employer / Seeker / Admin)
✔️ Employers can post, view, and manage job listings
✔️ Job Seekers can search jobs, apply, and track their applications
✔️ Admin can view/manage users, jobs, and overall activity
✔️ Session management, role-based redirection
✔️ Clean, modular structure using MVC architecture

👥 User Roles
Role	Capabilities
👨‍💼 Employer	Login, Post Jobs, View Posted Jobs, View Applicants
👨‍🎓 Job Seeker	Register, Login, Search Jobs, Apply for Jobs, Track Applications
🛡️ Admin	Login, View all Users & Jobs, Moderate Platform Content

🗃️ Folder Structure
Project Root: /JobPortal/

pgsql
Copy
Edit
/JobPortal/
├── WebContent/
│   ├── index.jsp
│   ├── login.jsp
│   ├── register.jsp
│   ├── employer/
│   │   ├── dashboard.jsp
│   │   ├── post_job.jsp
│   │   ├── view_jobs.jsp
│   │   ├── applicants.jsp
│   ├── seeker/
│   │   ├── dashboard.jsp
│   │   ├── search_jobs.jsp
│   │   ├── applications.jsp
│   ├── admin/
│       ├── dashboard.jsp
│
├── src/
│   ├── db/
│   │   └── DBConnection.java
│   ├── servlets/
│       ├── RegisterServlet.java
│       ├── LoginServlet.java
│       ├── PostJobServlet.java
│       ├── ApplyJobServlet.java
│       ├── AdminServlet.java
⚙️ Technologies Used
💻 Frontend: JSP (Java Server Pages), HTML, CSS

☕ Backend: Java (Servlets)

🗃️ Database: Oracle 11g / 12c (JDBC)

🌐 Server: Apache Tomcat 9.0+

🔐 Session Management: HttpSession API

🛠️ Setup Instructions
🔧 Prerequisites:

JDK 8 or higher

Apache Tomcat 9 or 10

Oracle Database (11g or 12c)

IDE (Eclipse / IntelliJ / NetBeans)

Oracle JDBC Driver (ojdbc8.jar)

🔄 Steps:

Clone or download this repository.

Open the project in Eclipse (Dynamic Web Project) or other Java EE IDE.

Configure Oracle JDBC Driver in project build path.

Update DBConnection.java with your Oracle credentials:

java
Copy
Edit
con = DriverManager.getConnection(
  "jdbc:oracle:thin:@localhost:1521:xe", "username", "password");
Create required tables in Oracle DB:

users (name, email, password, role)

jobs (title, description, location, skills, salary)

applications (job_id, seeker_email)

Deploy the project to Apache Tomcat server.

Access the application at:
http://localhost:8080/JobPortal/

✅ Sample Users:

Role	Email	Password
Admin	admin@jp.com	admin123
Employer	emp1@jp.com	emp123
Seeker	seeker1@jp.com	seeker123
