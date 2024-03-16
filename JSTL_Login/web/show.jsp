<%-- 
    Document   : show
    Created on : Feb 29, 2024, 10:45:10 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List of Admins with Role 1</h1>
            <table border="1">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="admin" items="${adminList}">
                    <tr>
                        <td>${admin.username}</td>
                        <td>${admin.password}</td>
                        <td>${admin.role}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
    </body>
</html>
