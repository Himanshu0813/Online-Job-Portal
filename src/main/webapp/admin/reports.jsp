<%@ page import="java.sql.*, onlineJobPortal.DBConnection" %>
<%
if (!"admin".equals(session.getAttribute("role"))) {
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports & Stats</title>
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
        font-size: 30px;
        font-weight: bold;
        padding: 15px 0;
        text-align: center;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    .content {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        padding: 20px;
    }

    .card {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        max-width: 600px;
        width: 100%;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    ul {
        list-style: none;
        padding: 0;
        margin: 20px 0;
    }

    li {
        margin: 10px 0;
        font-size: 18px;
        background: #f9f9f9;
        padding: 10px;
        border-radius: 6px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    }

    .back-link {
        display: inline-block;
        margin-top: 20px;
        background-color: #5563DE;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .back-link:hover {
        background-color: #4051b5;
    }
</style>
</head>
<body>

<div class="page-header">Reports & States</div>

<div class="content">
    <div class="card">
        <h2>Portal Statistics</h2>

        <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        int totalJobs = 0, totalUsers = 0, totalApplications = 0;

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            rs = stmt.executeQuery("SELECT COUNT(*) FROM jobs");
            if (rs.next()) totalJobs = rs.getInt(1);

            rs = stmt.executeQuery("SELECT COUNT(*) FROM userss");
            if (rs.next()) totalUsers = rs.getInt(1);

            rs = stmt.executeQuery("SELECT COUNT(*) FROM applications");
            if (rs.next()) totalApplications = rs.getInt(1);

        } catch (Exception e) {
        %>
            <p style="color:red;">Error: <%= e.getMessage() %></p>
        <%
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
        %>

        <ul>
            <li>Total Jobs: <%= totalJobs %></li>
            <li>Total Users: <%= totalUsers %></li>
            <li>Total Applications: <%= totalApplications %></li>
        </ul>

        <a href="dashboard.jsp" class="back-link">⬅ Back to Dashboard</a>
    </div>
</div>

</body>
</html>
