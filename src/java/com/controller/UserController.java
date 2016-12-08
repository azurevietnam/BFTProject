/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dal.UserContext;
import com.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author QuynhNguyen
 */
public class UserController extends HttpServlet {

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
        HttpSession session = request.getSession();
        String redirectPage = "";
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            UserContext uc = new UserContext();
            User u = uc.searchUser(username);
            if (action.equals("edit")) {
                session.setAttribute("user", u);
                response.sendRedirect("adminEditUser.jsp");
//                RequestDispatcher rd = request.getRequestDispatcher("adminEditUser.jsp");
//                rd.forward(request, response);
            } else if (action.equals("delete")) {
                uc.removeUser(u);
                response.sendRedirect("adminUsers.jsp");
            } else if (action.equals("Update")) {
                String password = u.getPassword();
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String facebookID = request.getParameter("facebookID");
                String facebookLink = request.getParameter("facebookLink");
                String isAdmin = request.getParameter("isAdmin");
                if (isAdmin == null) {
                    isAdmin = "0";
                }
                //for comit
                User user = new User(username, password, firstName, lastName, email,
                        facebookID, facebookLink, Integer.parseInt(isAdmin) == 1 ? true : false);
                uc.updateUser(user);
                session.setAttribute("updateUserOK", 1);
                session.setAttribute("user", null);
                response.sendRedirect("adminEditUser.jsp");
            } else if (action.equals("Add")) {
                String usr = request.getParameter("username");
                String password = request.getParameter("password");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String facebookID = request.getParameter("facebookID");
                String facebookLink = request.getParameter("facebookLink");
                String isAdmin = request.getParameter("isAdmin");
                if (isAdmin == null) {
                    isAdmin = "0";
                }
                User user = new User(usr, password, firstName, lastName, email,
                        facebookID, facebookLink, Integer.parseInt(isAdmin) == 1 );
                uc.addUser(user);
//                redirectPage = "adminUser.jsp";
                RequestDispatcher rd = request.getRequestDispatcher("adminUsers.jsp");
                rd.forward(request, response);
            } else if (action.equals("Save")) {
                String usr = request.getParameter("username");
                String password = request.getParameter("password");
                uc.changePassword(usr, password);
                session.setAttribute("saveOK", "Change password successful!");
                RequestDispatcher rd = request.getRequestDispatcher("adminChgPassword.jsp");
                rd.forward(request, response);
            }
        } catch (Exception ex) {
            session.setAttribute("updateUserError", 1);
            response.sendRedirect("adminEditUser.jsp");
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
