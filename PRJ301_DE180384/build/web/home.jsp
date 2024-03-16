<%-- 
    Document   : home
    Created on : Jan 30, 2024, 7:32:44 AM
    Author     : Acer
--%>

<%@page import="java.util.List" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Class Information</title>
    </head>
    <body>
        <h1>All children that has age large than 5</h1>
        <form action="NewServlet" method="get">
            <table border="1" width="40%">
            <tr>
                <th>Child ID</th>
                <th>Name</th>
                <th>Age</th>
            </tr>
            <c:if test="${requestScope.data == null}">
                <%
                    request.getRequestDispatcher("NewServlet").forward(request, response);
                %>
            </c:if> 
            <c:forEach items="${requestScope.data}" var="u">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.name}</td>
                    <td>${u.age}</td>
                </tr>
            </c:forEach>
        </table>
        </form>
    </body>
</html>
