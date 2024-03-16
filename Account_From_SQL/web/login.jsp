<%-- 
    Document   : login
    Created on : Jan 29, 2024, 11:12:33 PM
    Author     : Acer
--%>

<%@ page import="java.util.List" %>
<%@page import="entity.*" %>
<%@page import="context.*" %>
<%@page import="controller.*" %>
<%@page import="load.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Account</h1>
        <table border="1px" width="40%"> 
            <tr>
                <th>USERNAME</th>
                <th>PASSWORD</th>
            </tr>
            <% 
                List<Account> accountlist = AccountDB.listAll();
                for (Account a : accountlist) {
            %>
            <tr>
                <td><%= a.getUsername() %></td>
                <td><%= a.getPassword() %></td>
            </tr>
            <% 
                } 
            %>
        </table>
    </body>
</html>
