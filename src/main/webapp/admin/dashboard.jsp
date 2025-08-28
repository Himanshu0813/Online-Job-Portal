<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String email = (String) session.getAttribute("email");
    String role = (String) session.getAttribute("role");
    if (email == null || role == null || !"admin".equalsIgnoreCase(role)) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #74ABE2, #5563DE);
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    .page-header {
        background-color: rgba(0, 0, 0, 0.3);
        color: #fff;
        font-size: 36px;
        font-weight: bold;
        padding: 20px 0;
        text-align: center;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    .content {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }

    .card {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        max-width: 600px;
        width: 90%;
        text-align: center;
    }

    .card h2 {
        color: #333;
        margin-bottom: 10px;
    }

    .card p {
        color: #555;
        margin-bottom: 20px;
    }

    .options {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        justify-content: center;
    }

    .option {
        display: inline-block;
        text-decoration: none;
        color: #fff;
        background-color: #5563DE;
        padding: 15px 20px;
        border-radius: 5px;
        font-weight: bold;
        width: 250px; /* fixed width */
        text-align: center;
        transition: background-color 0.3s ease;
    }

    .option:hover {
        background-color: #4051b5;
    }

</style>
</head>
<body>

<div class="page-header">Online Job Portal - Admin Dashboard</div>

<div class="content">
    <div class="card">
        <h2>Welcome, Admin!</h2>    
        <p>Use the options below to manage the portal:</p>

        <div class="options">
            <a href="manage_employers.jsp" class="option">View & Manage Employers</a>
            <a href="manage_seekers.jsp" class="option">View & Manage Seekers</a>
            <a href="manage_jobs.jsp" class="option">View & Manage Jobs</a>
            <a href="view_applications.jsp" class="option">View Applications</a>
            <a href="reports.jsp" class="option">View Reports & Stats</a>
            <a href="../logout.jsp" class="option">Logout</a>
        </div>
    </div>
</div>

</body>
</html>
