<%-- 
    Document   : login
    Created on : Feb 26, 2024, 2:03:56 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login form</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 20px;
            }

            .container {
                max-width: 400px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.2);
            }

            .container h1 {
                margin-bottom: 20px;
                text-align: center;
            }

            form {
                display: grid;
                gap: 10px;
            }

            label {
                font-weight: bold;
            }

            .user-input,
            .pass-input,
            .submit-btn {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-sizing: border-box; /* Để padding không làm tăng kích thước nút */
                font-size: 16px;
            }

            .submit-btn {
                background-color: #007bff;
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .submit-btn:hover {
                background-color: #0056b3;
            }

            .error-message {
                background-color: #f8d7da;
                color: #721c24;
                padding: 10px;
                border-radius: 5px;
                margin-bottom: 10px;
            }

            .sub {
                display:flex;
                justify-content: space-between;
                margin-top: 10px;
            }

            .sub a {
                text-decoration: none;
                color: #333;
            }

            .sub button {
                background-color: transparent;
                border: none;
                cursor: pointer;
                padding: 0;
                font-size: 16px;
            }

            .sub button:hover {
                text-decoration: underline;
            }
            
            .header {
            text-align: center;
            margin-bottom: 20px;
            }
            
            .header img {
                width: 20%;
            }
            
            .error-message {
            display: none;
            color: red;
            font-size: 14px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
            <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook Logo" class="logo">
            </div>
            <div class="error-message">${requestScope.error}</div>
            <form action="login" method="post">
                <label for="user"><i class="fas fa-user"></i> Username:</label>
                <input type="text" id="user" name="user" class="user-input"/>

                <label for="pass"><i class="fas fa-lock"></i> Password:</label>
                <input type="password" id="pass" name="pass" class="pass-input"/>

                <button type="submit" class="submit-btn">Log in</button>
                <a href="forgetPass.jsp" style="text-align: center"><i class="fas fa-question-circle"></i> Forget Password ?</a>
            </form>
        </div>
        <div class="container sub">
            <button><a href="register.jsp"><i class="fas fa-user-plus"></i> Register</a></button>
        </div>
    </body>
</html>
