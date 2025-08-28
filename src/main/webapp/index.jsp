<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Portal</title>
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
        text-align: center;
        color: #fff;
    }

    .welcome-card {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        max-width: 400px;
        width: 90%;
    }

    .welcome-card h2 {
        font-size: 28px;
        margin-bottom: 20px;
        color: #333;
    }

    .buttons {
        display: flex;
        gap: 20px;
        justify-content: center;
    }

    .btn {
        background-color: #5563DE;
        color: #fff;
        padding: 12px 24px;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .btn:hover {
        background-color: #4051b5;
        transform: scale(1.05);
    }
</style>
</head>
<body>

<div class="page-header">Online Job Portal</div>

<div class="content">
    <div class="welcome-card">
        <h2>Welcome to Job Portal</h2>
        <div class="buttons">
            <a href="register.jsp" class="btn">Register</a>
            <a href="login.jsp" class="btn">Login</a>
        </div>
    </div>
</div>

</body>
</html>
