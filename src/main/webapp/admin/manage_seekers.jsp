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
<title>Manage Job Seekers</title>
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
        max-width: 800px;
        width: 100%;
    }

    .msg {
        color: green;
        text-align: center;
        margin-bottom: 10px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
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

    .delete-btn {
        display: inline-block;
        text-decoration: none;
        color: #fff;
        background-color: #d9534f;
        padding: 8px 12px;
        border-radius: 4px;
        font-size: 14px;
        font-weight: bold;
        transition: background-color 0.3s ease;
        border: none;
        cursor: pointer;
    }

    .delete-btn:hover {
        background-color: #c9302c;
    }

    .back-link {
        margin-top: 20px;
        display: inline-block;
        background-color: #5563DE;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        font-weight: bold;
    }

    .back-link:hover {
        background-color: #4051b5;
    }
</style>
</head>
<body>

<div class="page-header">Manage Job Seekers</div>

<div class="content">
    <div class="card">
        <% String msg = request.getParameter("msg");
           if (msg != null) { %>
            <p class="msg"><%= msg %></p>
        <% } %>

        <table>
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Action</th>
            </tr>

        <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            ps = con.prepareStatement("SELECT email, name FROM userss WHERE role='seeker'");
            rs = ps.executeQuery();

            boolean hasSeekers = false;
            while (rs.next()) {
                hasSeekers = true;
                String email = rs.getString("email");
                String name = rs.getString("name");
        %>
            <tr>
                <td><%= email %></td>
                <td><%= name %></td>
                <td>
                    <form action="../adminServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="deleteSeeker">
                        <input type="hidden" name="email" value="<%= email %>">
                        <button type="submit" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
        <%
            }

            if (!hasSeekers) {
        %>
            <tr><td colspan="3" style="text-align:center; font-style:italic;">No job seekers found.</td></tr>
        <%
            }

        } catch (Exception e) {
        %>
            <tr>
                <td colspan="3" style="color:red; text-align:center;">Error: <%= e.getMessage() %></td>
            </tr>
        <%
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (ps != null) try { ps.close(); } catch (Exception e) {}
            if (con != null) try { con.close(); } catch (Exception e) {}
        }
        %>
        </table>

        <a href="dashboard.jsp" class="back-link">⬅ Back to Dashboard</a>
    </div>
</div>

</body>
</html>
