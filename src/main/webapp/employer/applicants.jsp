<%@ page import="java.sql.*, onlineJobPortal.DBConnection" %>
<%
String jobIdParam = request.getParameter("jobId");
if (jobIdParam == null || jobIdParam.trim().isEmpty()) {
%>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style>
    body { font-family: Arial; background: #f4f4f4; text-align: center; padding: 50px; }
    .error { color: red; font-size: 20px; }
    a { text-decoration: none; color: #5563DE; font-weight: bold; }
</style>
</head>
<body>
<h3 class="error">Error: No Job ID provided.</h3>
<a href="view_jobs.jsp">⬅ Go Back</a>
</body>
</html>
<%
    return;
}

int jobId = 0;
try {
    jobId = Integer.parseInt(jobIdParam);
} catch (NumberFormatException e) {
%>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style>
    body { font-family: Arial; background: #f4f4f4; text-align: center; padding: 50px; }
    .error { color: red; font-size: 20px; }
    a { text-decoration: none; color: #5563DE; font-weight: bold; }
</style>
</head>
<body>
<h3 class="error">Error: Invalid Job ID.</h3>
<a href="view_jobs.jsp">⬅ Go Back</a>
</body>
</html>
<%
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Applicants for Job</title>
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
        max-width: 600px;
        width: 90%;
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

    .btn {
        margin-top: 20px;
        display: inline-block;
        background-color: #5563DE;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        font-weight: bold;
        border-radius: 5px;
        transition: 0.3s;
    }

    .btn:hover {
        background-color: #4051b5;
    }

    .empty {
        text-align: center;
        font-style: italic;
        color: #777;
    }

    .error {
        color: red;
        text-align: center;
        margin-top: 10px;
    }
</style>
</head>
<body>

<div class="page-header">Online Job Portal</div>

<div class="content">
    <div class="card">
        <h2>Applicants for Job ID: <%= jobId %></h2>

        <table>
            <tr><th>Email</th><th>Name</th></tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    con = DBConnection.getConnection();
    ps = con.prepareStatement(
      "SELECT u.email, u.name FROM applications a JOIN userss u ON a.seeker_email=u.email WHERE a.job_id=?");
    ps.setInt(1, jobId);
    rs = ps.executeQuery();

    boolean hasApplicants = false;

    while(rs.next()) {
        hasApplicants = true;
%>
<tr>
<td><%= rs.getString("email") %></td>
<td><%= rs.getString("name") %></td>
</tr>
<%
    }

    if (!hasApplicants) {
%>
<tr><td colspan="2" class="empty">No applicants found for this job.</td></tr>
<%
    }

} catch (Exception e) {
%>
<tr><td colspan="2" class="error">Error: <%= e.getMessage() %></td></tr>
<%
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (ps != null) ps.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}
%>

        </table>

        <a href="view_jobs.jsp" class="btn">⬅ Back to Jobs</a>
    </div>
</div>

</body>
</html>
