<%@ page language="java" %>
<%
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logged Out</title>
<meta http-equiv="refresh" content="3;URL=<%=request.getContextPath()%>/login.jsp">
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #74ABE2, #5563DE);
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #fff;
    }

    .card {
        background-color: rgba(0,0,0,0.5);
        padding: 30px;
        border-radius: 10px;
        text-align: center;
        box-shadow: 0 4px 10px rgba(0,0,0,0.3);
    }

    h1 {
        font-size: 28px;
        margin-bottom: 10px;
    }

    p {
        font-size: 16px;
    }
</style>
</head>
<body>

<div class="card">
    <h1>You have been logged out.</h1>
    <p>Thank you for using the Online Job Portal.</p>
    <p>Redirecting to login page in a moment…</p>
</div>

</body>
</html>
