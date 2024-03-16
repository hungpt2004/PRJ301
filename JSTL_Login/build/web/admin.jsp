<%-- 
    Document   : admin
    Created on : Feb 29, 2024, 10:32:23 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>Username</th>
                <th>Role</th>
            </tr>
            <tr>
                <td>${sessionScope.account.username}</td>
                <td>${sessionScope.account.role}</td>
            </tr>
    </table>
            <button><a href="show.jsp">Show Information</a></button>
    </body>
</html>
