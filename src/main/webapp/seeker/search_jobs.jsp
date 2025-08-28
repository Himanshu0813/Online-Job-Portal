<%@ page import="java.sql.*, onlineJobPortal.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Jobs</title>
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

    .jobs-card {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        max-width: 1000px;
        width: 100%;
        overflow-x: auto;
    }

    h2 {
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

    .apply-btn {
        background-color: #5563DE;
        color: #fff;
        padding: 6px 12px;
        text-decoration: none;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s ease;
    }

    .apply-btn:hover {
        background-color: #4051b5;
    }
</style>
</head>
<body>

<div class="page-header">Online Job Portal</div>

<div class="content">
    <div class="jobs-card">
        <h2>Available Jobs</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Location</th>
                <th>Action</th>
            </tr>

            <%
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM jobs");
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
            %>
            <tr>
                <td><%=rs.getInt("id")%></td>
                <td><%=rs.getString("title")%></td>
                <td><%=rs.getString("description")%></td>
                <td><%=rs.getString("location")%></td>
                <td>
                    <form action="<%= request.getContextPath() %>/applyJobServlet" method="post">
                        <input type="hidden" name="jobId" value="<%=rs.getInt("id")%>"/>
                        <input type="submit" value="Apply" class="apply-btn"/>
                    </form>
                </td>
            </tr>
            <% } con.close(); %>

        </table>
    </div>
</div>

</body>
</html>
