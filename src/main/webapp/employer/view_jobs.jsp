<%@ page import="java.sql.*, onlineJobPortal.DBConnection" %>

<%
    // session check BEFORE HTML output
    String email = (String) session.getAttribute("email");
    String role = (String) session.getAttribute("role");

    if (email == null || role == null || !"employer".equals(role)) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jobs You Posted</title>
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
        flex-direction: column;
        padding: 20px;
    }

    .card {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        max-width: 1000px;
        width: 95%;
        overflow-x: auto;
    }

    .card h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 12px;
        border: 1px solid #ccc;
        text-align: left;
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

    .empty {
        text-align: center;
        font-style: italic;
        color: #777;
    }

    .error {
        color: red;
        text-align: center;
    }

    a.btn {
        display: inline-block;
        margin-top: 20px;
        background-color: #5563DE;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        font-weight: bold;
        border-radius: 5px;
        transition: 0.3s;
    }

    a.btn:hover {
        background-color: #4051b5;
    }
</style>
</head>
<body>

<div class="page-header">Online Job Portal</div>

<div class="content">
    <div class="card">
        <h2>Jobs You Posted</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Location</th>
                <th>Applicants</th>
            </tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    con = DBConnection.getConnection();
    if (con == null) {
%>
<tr>
<td colspan="5" class="error">Error: Could not connect to the database.</td>
</tr>
<%
    } else {
        ps = con.prepareStatement("SELECT * FROM jobs WHERE posted_by = ?");
        ps.setString(1, email);
        rs = ps.executeQuery();

        boolean hasJobs = false;

        while (rs.next()) {
            hasJobs = true;
%>
<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("title") %></td>
<td><%= rs.getString("description") %></td>
<td><%= rs.getString("location") %></td>
<td><a href="applicants.jsp?jobId=<%= rs.getInt("id") %>">View Applicants</a></td>
</tr>
<%
        }

        if (!hasJobs) {
%>
<tr>
<td colspan="5" class="empty">You have not posted any jobs yet.</td>
</tr>
<%
        }
    }

} catch (Exception e) {
%>
<tr>
<td colspan="5" class="error">Error: <%= e.getMessage() %></td>
</tr>
<%
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (ps != null) ps.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>

        </table>

        <a href="dashboard.jsp" class="btn">⬅ Back to Dashboard</a>
    </div>
</div>

</body>
</html>
