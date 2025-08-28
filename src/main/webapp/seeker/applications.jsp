<%@ page import="java.sql.*, onlineJobPortal.DBConnection" %>
<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("../login.jsp?msg=Please+login+first");
        return;
    }

    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Applications</title>
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

    .applications-card {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        max-width: 800px;
        width: 90%;
        overflow-x: auto;
    }

    .applications-card h2 {
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

    .msg {
        color: green;
        text-align: center;
        margin-bottom: 10px;
        font-weight: bold;
    }

    .error {
        color: red;
        text-align: center;
        margin-top: 10px;
    }

    .empty {
        text-align: center;
        font-style: italic;
        color: #777;
    }
</style>
</head>
<body>

<div class="page-header">Online Job Portal</div>

<div class="content">
    <div class="applications-card">
        <h2>My Applications</h2>

        <% if (msg != null) { %>
            <p class="msg"><%= msg %></p>
        <% } %>

        <table>
            <tr><th>Job ID</th><th>Title</th><th>Location</th></tr>

            <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                con = DBConnection.getConnection();
                ps = con.prepareStatement(
                    "SELECT j.id, j.title, j.location " +
                    "FROM jobs j JOIN applications a ON j.id = a.job_id " +
                    "WHERE a.seeker_email = ?"
                );
                ps.setString(1, email);
                rs = ps.executeQuery();

                boolean hasRows = false;
                while(rs.next()) {
                    hasRows = true;
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("location") %></td>
            </tr>
            <%
                }
                if (!hasRows) {
            %>
            <tr>
                <td colspan="3" class="empty">You have not applied to any jobs yet.</td>
            </tr>
            <%
                }
            } catch(Exception e) {
            %>
            <tr>
                <td colspan="3" class="error">Error: <%= e.getMessage() %></td>
            </tr>
            <%
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
                if (con != null) try { con.close(); } catch (SQLException ignore) {}
            }
            %>
        </table>
    </div>
</div>

</body>
</html>
