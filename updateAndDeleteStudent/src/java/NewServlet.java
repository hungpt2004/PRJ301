/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Student;

/**
 *
 * @author HELLO
 */
public class NewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        private ArrayList<Student> students = new ArrayList<>();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String get = request.getParameter("get");
        if(get.equalsIgnoreCase("add")){
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            int flag = 1;
            if(id.equalsIgnoreCase("")  || name.equalsIgnoreCase("") || gender == null){
            }else{
                Student student = new Student(id,name,gender);
                students.add(student);
                flag = 0;
            }
            request.setAttribute("flag", flag);
            request.setAttribute("students", students);
            request.getRequestDispatcher("newjsp.jsp").forward(request, response);
        }else{
            int index = Integer.parseInt(get)-1;
            String id_Up = request.getParameter("id_Up");
            String name_Up = request.getParameter("name_Up");
            String gender_Up = request.getParameter("gender_Up");
            int flag = 3;
            if(id_Up.equalsIgnoreCase("")  || name_Up.equalsIgnoreCase("") || gender_Up == null){
            }else{
                Student student = new Student(id_Up,name_Up,gender_Up);
                students.set(index,student);
                flag = 4;
            }
            request.setAttribute("flag", flag);
            request.setAttribute("students", students);
            request.getRequestDispatcher("newjsp.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String index = request.getParameter("index");
        int num = Integer.parseInt(index);
        String tinhNang = request.getParameter("tinhNang");
        int flag = 5;
        if(students.size() != 0){
            flag = 6;
            request.setAttribute("flag", flag);
        }
        if(tinhNang.equalsIgnoreCase("delete")){
            students.remove(--num);
            request.setAttribute("students", students);
            request.getRequestDispatcher("newjsp.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
