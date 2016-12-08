/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dal.UserContext;
import com.entities.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SoN-TunG
 */
public class checkRegister extends HttpServlet {

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
      response.setCharacterEncoding("UTF-8");
      request.setCharacterEncoding("UTF-8");
      String btnSubmit = request.getParameter("btnSubmit");
      String firstName = request.getParameter("firstName");
      String lastName = request.getParameter("lastName");
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String email = request.getParameter("email");
      HttpSession session = request.getSession(true);
      String pageRedirect = "";
      if (btnSubmit != null) {
         User user = new User();
         user.setAdmin(false);
         user.setFirstName(firstName);
         user.setLastName(lastName);
         user.setUsername(username);
         user.setPassword(password);
         user.setEmail(email);
         try {
            UserContext uc = new UserContext();
            uc.addUser(user);
            session.setAttribute("login", user);
            pageRedirect = "index.jsp";
         } catch (Exception ex) {
            session.setAttribute("registerError", "Username or Email is already exists");
            session.setAttribute("preInfo", user);
            pageRedirect = "register.jsp";
         }
      } else {
         pageRedirect = "index.jsp";
      }
      response.sendRedirect(pageRedirect);
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
