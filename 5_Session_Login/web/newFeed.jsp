<%-- 
    Document   : newFeed
    Created on : Mar 3, 2024, 11:44:18 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.admin" %>
<%@page import="model.adminDAO" %>
<%@page import="java.util.*" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="<https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css>">
        <link href='<https://unpkg.com/css.gg@2.0.0/icons/css/menu.css>' rel='stylesheet'>
        <title>NewFeedFaceBook</title>
        <style>
            .logout-btn {
                background-color: grey;
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
            }

            .logout-btn:hover {
                background-color: #d32f2f;
            }
            .taskbar-header{
                display: flex;
                justify-content: center;
            }
            .logout {
                padding-left: 40%;
            }
            .first-content {
                width: 100%;
                background-color: rgb(8, 175, 253);
            }
            .content__header {
                background-color: #4267B2;
                padding: 10px 20px;
                color: white;
                align-items: center;
            }

            .logo img {
                vertical-align: middle;
            }

            .search {
                text-align: center;
            }

            .search .form-group {
                position: relative;
            }

            .search .form-control-feedback {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                left: 10px;
            }

            .search input[type="text"] {
                width: 100%;
                padding-left: 35px;
                border-radius: 20px;
            }

            .user-section {
                text-align: right;
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }

            .user-info {
                margin-right: 2px;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 20px;
            }

            .container {
                max-width: 600px;
                margin: 0 auto;
            }

            .post {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                padding: 20px;
            }

            .post-header {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .post-header img {
                border-radius: 50%;
                margin-right: 10px;
                width: 50px;
                height: 50px;
            }

            .post-header h3 {
                margin: 0;
            }

            .post-content p {
                margin-bottom: 10px;
            }

            .post-content img {
                max-width: 100%;
                border-radius: 8px;
            }

            .post-actions button {
                background-color: #f0f2f5;
                color: #65676b;
                border: none;
                padding: 8px 16px;
                margin-right: 10px;
                border-radius: 20px;
                cursor: pointer;
            }

            .post-actions button:hover {
                background-color: #e3e6e9;
            }
            .content__header{
                display: flex;
                justify-content: space-between;
            }
            .logo {
                width: 15%;
                margin-left: -10px;
            }
            .search {
                margin-left: -86%;
                margin-top: 4px;
            }
            .main-content {
                margin-top: 20px;
            }
            .middle {
                display: flex;
                justify-content: center;
            }
            .post-actions {
                display: flex;
                justify-content: start;
                padding-top: 10px;
            }
            .header-button {
                width: 45px;
                height: 45px;
                margin-right: 10px;
                border: 0px solid white;
                border-radius: 25px;
            }
            .header-taskbar {
                padding-bottom: 5px;
                padding-right: 20px;
            }

        </style>
    </head>
    <body>
        <div class="content__header row"> <!--content header-->
            <div class="col-md-3 logo">
                <img style="width: 17%;" src="<https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg>" alt="Facebook Logo" class="logo">
            </div>

            <div class="col-md-5 search" style="margin-top: 5px;margin-left: -40%">
                <!-- Actual search box -->
                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="text" class="form-control sizesearch" placeholder="Tìm kiếm trên facebook" style="height: 30px;
                       padding-left: 15px;"/>
            </div>
            <div class="col-md-4 user-section" style="margin-top: 10px;">
                <div class="header-taskbar">
                    <button class="header-button"><i class="fas-fa-th" ></i></button>
                    <button class="header-button"><i class="fa fa-commenting"></i></button>
                    <button class="header-button"><i class="fas fa-user" ></i></button>
                </div>
                <div class="user-info">
                    <a>${sessionScope.account.username}</a>
                </div>
                <a href="login.jsp"><i style="color: white" class="fas fa-sign-out"></i></a>
            </div>
        </div>

        <div class="main-content row">
            <div class="col-md-3 left">
                <div class="taskbar">
                    <div class="post-header">
                        <img src="<https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/359447017_1475948263156000_5672425803864087405_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeFDkEEn9j1g4MiC1D7Qr3orpS8EteETP8mlLwS14RM_yR345PFLwMefKzJCUv0MKtub7s7mJth5Rk7HGLa6cGHt&_nc_ohc=yhiass3cP44AX_wIHtG&_nc_ht=scontent.fdad2-1.fna&oh=00_AfBc-Zg4ZJ4cSwmHtKcOe7VYJiaWXjtrLMIBcFB3x2tyyA&oe=65E90A92>" alt="User Avatar">
                        <h3>${sessionScope.account.username}</h3>
                    </div>
                    <ul style="list-style: none; margin-left: -55px">
                        <li><a class="list-group-item" href="#"><i class="fa fa-home fa-fw" aria-hidden="true"></i>&nbsp; Home</a></li>
                        <li><a class="list-group-item" href="#"><i class="fa fa-book fa-fw" aria-hidden="true"></i>&nbsp; Library</a></li>
                        <li><a class="list-group-item" href="#"><i class="fa fa-pencil fa-fw" aria-hidden="true"></i>&nbsp; Applications</a></li>
                        <li><a class="list-group-item" href="#"><i class="fa fa-cog fa-fw" aria-hidden="true"></i>&nbsp; Settings</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6 middle">
                <div class="post">
                    <div class="post-header">
                        <img src="<https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/359447017_1475948263156000_5672425803864087405_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeFDkEEn9j1g4MiC1D7Qr3orpS8EteETP8mlLwS14RM_yR345PFLwMefKzJCUv0MKtub7s7mJth5Rk7HGLa6cGHt&_nc_ohc=yhiass3cP44AX_wIHtG&_nc_ht=scontent.fdad2-1.fna&oh=00_AfBc-Zg4ZJ4cSwmHtKcOe7VYJiaWXjtrLMIBcFB3x2tyyA&oe=65E90A92>" alt="User Avatar">
                        <h3>${sessionScope.account.username}</h3>
                    </div>
                    <div class="post-content">
                        <p>This is a sample post on the Facebook news feed.</p>
                        <img src="<https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/333560907_740566200961372_2471819290289715113_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=9c7eae&_nc_eui2=AeFcfdJtgjFv_IPL5AcQwu2R068nbUhV_CbTrydtSFX8Jse-Yac8YqjDaIUNXXrZCBoML6E4YDG4klo0wSngmHzV&_nc_ohc=A9nVxLLQIcwAX8kpZ5S&_nc_ht=scontent.fdad1-4.fna&oh=00_AfBuSejWjGVWcgfw6f6mzgM4tnV_0vKZOCnqbklZt5mlWg&oe=65EB002C>" alt="Post Image">
                    </div>
                    <div class="post-actions">
                        <button>Like</button>
                        <button>Comment</button>
                        <button>Share</button>
                    </div>
                </div>
            </div>
            <div class="col-md-3 right">
            </div>
        </div>

        <script>
            // Assume user is logged in and their name is stored in this variable
            const loggedInUser = "<%= session.getAttribute("username") %>";

            // Function to display the logged in user's name
            function displayUsername() {
                const usernameElement = document.getElementById("username");
                usernameElement.textContent = `Welcome, ${loggedInUser}!`;
            }

            // Function to logout (for demonstration purposes)
            function logout() {
                // For this example, simply refresh the page
                location.href = "login.jsp";
            }

            // Call function to display username when page loads
            displayUsername();
        </script>
    </body>

</html>
