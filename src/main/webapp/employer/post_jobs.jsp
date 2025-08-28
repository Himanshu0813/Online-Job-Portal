<%@ page language="java" %>
<%
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
<title>Post Job</title>
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
        max-width: 500px;
        width: 90%;
        text-align: center;
    }

    .card h2 {
        margin-bottom: 20px;
        color: #333;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
        text-align: left;
    }

    input[type="text"], textarea {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    textarea {
        resize: vertical;
        min-height: 80px;
    }

    input[type="submit"] {
        background-color: #5563DE;
        color: #fff;
        padding: 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #4051b5;
    }
</style>
</head>
<body>

<div class="page-header">Online Job Portal</div>

<div class="content">
    <div class="card">
        <h2>Post a New Job</h2>
        <form method="post" action="../postJobServlet">
            <label>Title:</label>
            <input type="text" name="title" required />

            <label>Description:</label>
            <textarea name="description" required></textarea>

            <label>Location:</label>
            <input type="text" name="location" required />

            <input type="submit" value="Post Job" />
        </form>
    </div>
</div>

</body>
</html>
