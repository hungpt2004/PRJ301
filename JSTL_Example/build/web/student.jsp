<%-- 
    Document   : student
    Created on : Mar 2, 2024, 12:05:06 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Student"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Information</title>
</head>
<body>
    <h1>Student Information</h1>
    <c:set var="s" value="${requestScope.std}" />
    <h2>Hello ${s.name}</h2>
</body>
</html>
