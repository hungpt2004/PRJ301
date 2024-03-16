<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%@page import="connection.AccountDAO"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Infor Account Student</h1>
        <form action="add" method="get">
            Email<input type="text" name="email" /></br>
            Password<input type="text" name="pass" /></br>
            <input type="submit"/>
        </form>
        <table border="1">
            <tr>
                <th>Email</th>
                <th>Password</th>  
            </tr>
            <jsp:useBean id="accountDAO" class="connection.AccountDAO" />
            <jsp:useBean id="account" class="model.Account" />
            <%
                List<Account> accountlist = accountDAO.getListAll();
                for(Account a : accountlist) {
            %>
            <tr>
                <jsp:setProperty name="account" property="email" value="<%= a.getEmail() %>"/>
                <jsp:setProperty name="account" property="pass" value="<%= a.getPass() %>"/>
                <td><jsp:getProperty name="account" property="email"/></td>
                <td><jsp:getProperty name="account" property="pass"/></td>        
            </tr> 
            <%
                }
            %>
        </table>
    </body>
</html>
