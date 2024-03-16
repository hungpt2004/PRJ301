<%-- 
    Document   : forgetPass
    Created on : Feb 27, 2024, 9:59:18 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
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
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Forget Password</h1>
            <form action="forget" method="post">
                Enter username to find: <input type="text" name="name"/><br/>
                <input type="submit" value="Find"/>
            </form>
        </div>

    </body>
</html>
