/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlet;

import com.blog.DBUtil.Helper;
import com.blog.entity.ErrorMessage;
import com.blog.entity.Users;
import com.blog.service_dao.UsersDAO;
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
public class EditProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProfileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String email=request.getParameter("email");
             String name=request.getParameter("name");
              String password=request.getParameter("password");
             String about=request.getParameter("about"); 
            String gender=request.getParameter("optradio");
             
             Part image=request.getPart("image");
             String imageName=image.getSubmittedFileName();
             
            
            
    
            
            HttpSession httpSession=request.getSession();
            Users users=(Users) httpSession.getAttribute("currentUser");
            boolean imagepath=true; 
            if(imageName==null)
             {
                 imageName=users.getImage();
                 imagepath=false;
                
             }
            if(gender==null)
            {
               gender= users.getGender();
            }
                users.setEmail(email);
                users.setName(name);
                users.setAbout(about);
                users.setGender(gender);
                users.setPassword(password);
                String old=users.getImage();
                        
                users.setImage(imageName);
                
                
       
            boolean b= UsersDAO.UpdateUser(users);
            if(b)
            {
                
                
            String path=    request.getRealPath("/")+"pics"+File.separator+users.getImage();
           
               if(!old.equals("default.jpg") && imagepath!=false){
                 String path1=    request.getRealPath("/")+"pics"+File.separator+old;
                 Helper.deleteFile(path1);
               }
               if( Helper.saveFile(image.getInputStream(), path) )
               {
                 //  out.println("/n profile update succesfully done");
                   
                     ErrorMessage e=new ErrorMessage("profile update succesfully", "Success Message" , "alert-success");
                     httpSession.setAttribute("error", e);
               
               }
             else
               {
                   ErrorMessage e=new ErrorMessage("profile not  update succesfully", "UnSuccess Message" , "alert-danger");
                     httpSession.setAttribute("error", e);
               }
            }
            
            else
            {
                  ErrorMessage e=new ErrorMessage("profile not  update succesfully", "UnSuccess Message" , "alert-danger");
                     httpSession.setAttribute("error", e);
                
            }
            response.sendRedirect("profile.jsp");
            out.println("<h1>Servlet EditProfileServlet at " + request.getContextPath() + "</h1>");
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
