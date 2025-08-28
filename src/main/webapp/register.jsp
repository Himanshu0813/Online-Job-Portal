<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - Job Portal</title>
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
    }

    .register-card {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        max-width: 400px;
        width: 90%;
        text-align: center;
    }

    .register-card h2 {
        font-size: 28px;
        margin-bottom: 20px;
        color: #333;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    select {
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input[type="submit"] {
        background-color: #5563DE;
        color: #fff;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #4051b5;
    }

    select {
        background-color: #fff;
    }
</style>
</head>
<body>

<div class="page-header">Online Job Portal</div>

<div class="content">
    <div class="register-card">
        <h2>Register</h2>
        <form action="registerServlet" method="post">
            <input type="text" name="name" placeholder="Name" required/>
            <input type="email" name="email" placeholder="Email" required/>
            <input type="password" name="password" placeholder="Password" required/>
            <select name="role">
                <option value="employer">Employer</option>
                <option value="seeker">Job Seeker</option>
            </select>
            <input type="submit" value="Register"/>
        </form>
    </div>
</div>

</body>
</html>
