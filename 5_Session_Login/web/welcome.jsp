<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.admin" %>
<%@page import="model.adminDAO" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Styles for the table */
            .styled-table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 0.9em;
                font-family: sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            }

            .styled-table thead tr {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
            }

            .styled-table th,
            .styled-table td {
                padding: 12px 15px;
            }

            .styled-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .styled-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .styled-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }
        </style>
    </head>
    <body>
        <h1>Normal</h1>
        <table border="1px" class="styled-table">
            <tr>
                <th>Username</th>
                <th>Role</th>
            </tr>
            <c:if test="${empty list}">
                <tr>
                    <td colspan="2">List is null</td>
                </tr>
            </c:if>
            <%-- Nếu list không null, thực hiện vòng lặp để in ra dữ liệu --%>
            <c:if test="${requestScope.list == null}">
                <%
                    request.getRequestDispatcher("welcome").forward(request, response);
                %>
            </c:if> 
            <c:forEach items="${requestScope.list}" var="u">
                <tr>
                    <td>${u.username}</td>
                    <td>${u.role}</td>
                </tr>
            </c:forEach>
        </table>
        <button><a href="login.jsp">Back to Login</a></button>

    </body>
</html>
