<%@page import = "model.Student"%>
<%@page import = "java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td {
              
              padding-right: 30px; /* Tăng độ dày của đường viền để tạo ra khoảng trắng xung quanh nội dung */
            }
        </style>
    </head>
    
    <body>
        <form action="NewServlet" method="get" >
            <input type="hidden" name="get" value="add"/>
            <table>
                <tr>
                    <td>ID_Student</td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td>Name_Student</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>Male <input type="checkbox" name="gender" value="Male">
                        Female <input type="checkbox" name="gender" value="Female"></td>
                </tr>
            </table>
            <input type="submit" value="Add student">
        </form>
        <table>
        <%    
            Object flag = request.getAttribute("flag");
            if(flag != null){
                int num = Integer.parseInt(flag.toString());
                if(num == 1){
                    %><p style="color:red">Error. Failed add student.Please enter full information</p><%
                }else if(num == 0){
                    %><p style="color:green">Successfully add student</p><%
                }else if(num == 4){
                    %><p style="color:green">Successfully update student</p><%
                }else if(num == 5){
                    %><p style="color:red">Failed deleted.</p><%
                }else if(num == 6){
                    %><p style="color:green">Successfully deleted student</p><%
                }else{
                    %><p style="color:red">Error. Failed update student.Please enter full information</p><%
                }
            }

            ArrayList<Student> students = (ArrayList<Student>)request.getAttribute("students");
            int i=0;
            if(students != null){
                %><p style="color:black">Count student: <%=students.size()%></p><%
                for(Student student : students){
                    if(i==0){
                    %>
                    <tr>
                        <td>STT </td>
                        <td>Student_Code </td>
                        <td>Student_Name </td>
                        <td>Student_Gender </td>
                    </tr>
                <%    
                    }
                ++i;
                %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=student.getID()%></td>
                        <td><%=student.getName()%></td>
                        <td><%=student.getGender()%></td>
                        <td>
                            <form action="NewServlet" method="post">
                                <input type="hidden" name="index" value="<%=i%>"/>
                                <input type="submit" name="tinhNang" value="delete"/>
                            </form>
                        </td>
                        <td>
                            <button onclick="update(<%=i%>)"> Update</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan = "4">
                            <form action="NewServlet" method="get" id="update<%=i%>" style="display:none">
                                <input type="hidden" name="get" value="<%=i%>"/>
                                <div style="border: solid 1px black ; margin-bottom: 20px">
                                <table>
                                    <tr>
                                        <td>ID_Student</td>
                                        <td><input type="text" name="id_Up"></td>
                                    </tr>
                                    <tr>    
                                        <td>Name_Student</td>
                                        <td><input type="text" name="name_Up"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td>Male <input type="checkbox" name="gender_Up" value="Male">
                                            Female <input type="checkbox" name="gender_Up" value="Female"></td>
                                    </tr>
                                </table>
                                <input type="submit" value="Update student">
                            </form>
                        </td>
                    </tr>
                    
                <%}
            %>
            <%
            }
        %>
        </table>
        <script>
        function update(i) {
            // Lấy phần tử có id là "elementToHighlight"
            var element = document.getElementById("update"+i);
            if(element.style.display == "none"){
                element.style.display="block";
            }else{
                element.style.display="none";
            }
        }
        </script>
    </body>
</html>
