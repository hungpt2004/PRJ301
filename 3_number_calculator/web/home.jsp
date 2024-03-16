<%-- 
    Document   : home
    Created on : Jan 25, 2024, 4:29:17 AM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            Enter number 1: <input type="number" name="n1" value="" required><br/>
            Enter number 2: <input type="number" name="n2" value="" required><br/>
            Enter number 3: <input type="number" name="n3" value="" required><br/>
            <input type="submit" value="tinh_toan">
        </form>
        <c:set var="s" value="${requestScope.st}"/>
        <h2>Hello ${s.name}</h2>
        <img src="${(s.gender?'images/male.png':'images/female.png')}"/>
        <c:if test="${(s.mark >= 5)}"> 
            <h3>Pass</h3>
        </c:if>
        <c:if test="${(s.mark < 5)}">
            <h3>Fail</h3>
        </c:if>
    </body>
</html>
