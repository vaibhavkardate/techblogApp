/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlet;

import com.blog.DBUtil.Helper;
import com.blog.entity.Post;
import com.blog.entity.Users;
import com.blog.service_dao.PostDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author vaibh
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

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
            out.println("<title>Servlet AddPostServlet</title>");            
            out.println("</head>");
            out.println("<body>");
           // out.println("<h1>Servlet AddPostServlet at " + request.getContextPath() + "</h1>");
            
            int cid=Integer.parseInt(request.getParameter("cid"));
            
            String title=request.getParameter("title");
            String content=request.getParameter("content");
            String code=request.getParameter("code");
            Part image=request.getPart("image");
            String imageName=image.getSubmittedFileName();
            if(imageName=="")
            {
                imageName="null.jpg";
            }
            
            //gettting current userid
            HttpSession session=request.getSession();
            Users users=(Users)session.getAttribute("currentUser");
            int userid=users.getId();
             
            
            Post p=new Post(title, content, code,imageName, cid, userid);
         if(PostDAO.savePost(p))
         {
              String path=    request.getRealPath("/")+"blog_pics"+File.separator+imageName;
              Helper.saveFile(image.getInputStream(), path);
             out.println("Post Save Successfully");
             
         }else
         {
             out.println("Error in DB");
         }
            
          
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
        processRequest(request, response);
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
        processRequest(request, response);
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
