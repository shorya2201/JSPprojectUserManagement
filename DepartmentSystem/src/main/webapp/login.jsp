<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
       body {
    font-family: Arial, sans-serif;
    background-color: #581845;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.login-container {
    background-color: #154360;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 300px;
}

h2 {
    text-align: center;
    color: #EBF5FB;
    margin-bottom: 20px; /* Added margin for spacing */
}

P {
    text-align: center;
    color: #EBF5FB;
    margin-bottom: 20px; /* Added margin for spacing */
}

input[type="text"],
input[type="password"],
select {
    width: 100%;
    padding: 12px; /* Increased padding for better visual */
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px; /* Increased font size for better readability */
}

select {
    appearance: none; /* Remove default select arrow */
}

input[type="submit"] {
    width: 100%;
    background-color: #4caf50;
    color: #fff;
    padding: 12px; /* Increased padding for better visual */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px; /* Increased font size for better readability */
}

input[type="submit"]:hover {
    background-color: #45a049;
}
       
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="verifyLogin" method="post">
            <input type="text" name="user" placeholder="Username">
            <input type="password" name="pass" placeholder="Password">
            <select name="role">
                <option value="legal">Legal</option>
                <option value="finance">Finance</option>
                <option value="management">Management</option>
            </select>
            <input type="submit" value="Login">
        </form>
        <p> &#169 2024 <strong>QueryDept.</strong> All rights reserved.</p>
    </div>
</body>
</html>