<%-- 
    Document   : newjsp
    Created on : Jan 19, 2024, 9:45:39 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Student"%>
<%@page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="newservlet" method="get">
                Number of Students: <input type="number" placeholder="0" name="number">
                <input type="submit" value="generate">
        </form>
        <% 
            ArrayList<Student> students = (ArrayList<Student>)request.getAttribute("students");
            if(students != null){
            int i=0;
            for(Student student : students){
                if(i == 0){
        %>
        
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>DOB</th>
                </tr>
        
        <%
            }
        %>
        <tr>
            <th><%=student.getNumber()%></th>
            <th><%=student.getName()%></th>
            <th><%=student.isGender()%></th>
            <th><%=student.getDob()%></th>
            <th>
                <form action="newservlet" method="post">
                        <input type="hidden" name="index" value="<%= i %>">
                        <input type="submit" name="action" value="update_random" style="text-decoration: underline">
                </form>
           </th>
           <th>
                <form action="newservlet" method="post">
                        <input type="hidden" name="index" value="<%= i %>">
                        <input type="submit" name="action" value="update_tuchon" style="text-decoration: underline">
                </form>
           </th>
           <th>
                <form action="newservlet" method="post">
                        <input type="hidden" name="index" value="<%= i %>">
                        <input type="submit" name="action" value="delete" style="text-decoration: underline">
                </form>
           </th>
        </tr>
        <%
            i++;
            };
        }
        %>
        </table>
        
    </body>
</html>
