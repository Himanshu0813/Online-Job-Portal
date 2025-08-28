<%@ page import="java.sql.*, onlineJobPortal.DBConnection" %>
<%
    String email = (String) session.getAttribute("email");
    String role = (String) session.getAttribute("role");

    if (email == null || role == null || (!"admin".equalsIgnoreCase(role) && !"employer".equalsIgnoreCase(role))) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Applications</title>
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
        background-color: rgba(0,0,0,0.3);
        color: #fff;
        font-size: 30px;
        font-weight: bold;
        padding: 15px 0;
        text-align: center;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    .content {
        flex: 1;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: flex-start;
    }

    .card {
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        width: 90%;
        max-width: 1000px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
        font-size: 14px;
    }

    th {
        background-color: #5563DE;
        color: #fff;
    }

    td {
        background-color: #f9f9f9;
    }

    tr:hover td {
        background-color: #e0e7ff;
    }

    .no-data {
        color: gray;
        text-align: center;
        font-style: italic;
        padding: 20px;
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

<div class="page-header">Applications</div>

<div class="content">
<div class="card">
<h2>Applications Submitted</h2>

<table>
<tr>
<th>ID</th>
<th>Job Title</th>
<th>Job ID</th>
<th>Seeker Name</th>
<th>Seeker Email</th>
<th>Applied On</th>
</tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    con = DBConnection.getConnection();

    String query = 
    	    "SELECT a.id AS app_id, a.applied_on, " +
    	    "u.name AS seeker_name, u.email AS seeker_email, " +
    	    "j.title AS job_title, j.id AS job_id, j.posted_by " +
    	    "FROM applications a " +
    	    "JOIN jobs j ON a.job_id = j.id " +
    	    "JOIN userss u ON a.seeker_email = u.email " +
    	    "WHERE u.role = 'seeker' ";

    	if ("employer".equalsIgnoreCase(role)) {
    	    query += "AND j.posted_by = ? ";
    	}

    	query += "ORDER BY a.applied_on DESC";

    ps = con.prepareStatement(query);

    if ("employer".equalsIgnoreCase(role)) {
        ps.setString(1, email);
    }

    rs = ps.executeQuery();

    boolean hasResults = false;

    while (rs.next()) {
        hasResults = true;
%>
<tr>
<td><%= rs.getInt("app_id") %></td>
<td><%= rs.getString("job_title") %></td>
<td><%= rs.getInt("job_id") %></td>
<td><%= rs.getString("seeker_name") %></td>
<td><%= rs.getString("seeker_email") %></td>
<td><%= rs.getDate("applied_on") %></td>
</tr>
<%
    }

    if (!hasResults) {
%>
<tr>
<td colspan="6" class="no-data">No applications found.</td>
</tr>
<%
    }

} catch (Exception e) {
%>
<tr>
<td colspan="6" style="color:red;"><%= e.getMessage() %></td>
</tr>
<%
} finally {
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (ps != null) try { ps.close(); } catch (Exception e) {}
    if (con != null) try { con.close(); } catch (Exception e) {}
}
%>
</table>

<div style="text-align:center;">
    <a href="dashboard.jsp" class="back-link">⬅ Back to Dashboard</a>
</div>
</div>
</div>

</body>
</html>
