/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.admin;
import model.adminDAO;

/**
 *
 * @author Acer
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        String u = request.getParameter("user");
        String p = request.getParameter("pass");
        adminDAO d = new adminDAO();
        admin a = d.check(u, p);
        HttpSession session = request.getSession();
        if (a == null) {
            //Chưa có TK => Truyền về trang đăng nhập
            request.setAttribute("error", "U and P invalid !");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            //Có TK => Tạo Session
            //Role 1 => admin
            if (a.getRole() == 1) {
                // Tạo cookie
                Cookie adminCookie = new Cookie("userType", "admin");
                // Thiết lập thời gian sống của cookie (ví dụ: 1 giờ)
                adminCookie.setMaxAge(60 * 60); // 60 phút * 60 giây = 1 giờ
                // Thêm cookie vào response
                response.addCookie(adminCookie);
                session.setAttribute("account", a);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else {
                //Role 2 => welcome
                // Tạo cookie
                Cookie userCookie = new Cookie("userType", "normal");
                // Thiết lập thời gian sống của cookie (ví dụ: 1 giờ)
                userCookie.setMaxAge(60 * 60); // 60 phút * 60 giây = 1 giờ
                // Thêm cookie vào response
                response.addCookie(userCookie);
                session.setAttribute("account", a);
                request.getRequestDispatcher("newFeed.jsp").forward(request, response);
            }
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
