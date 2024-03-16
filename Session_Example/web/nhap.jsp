<%-- 
    Document   : nhap
    Created on : Feb 26, 2024, 10:12:11 AM
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
        <h1>Nhap danh sach</h1>
        <form action="NhapServlet">
            Ho va Ten: <input type="text" name="name" /><br/>
            <input type="submit" value="Nhap Du Lieu"/>
        </form>
        <h2>Danh Sach Nhap Vao</h2>
        <h3>
            <c:set var="i" value="0" />
            <c:forEach items="${sessionScope.names}" var="c">
                <c:set var="i" value="${(i+1)}"/>
                ${i}. ${c}</br>
            </c:forEach>
        </h3>
    </body>
</html>
