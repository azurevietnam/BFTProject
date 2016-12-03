/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dal.FlightDetailContext;
import com.entities.SearchInfo;
import com.entities.SearchResult;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SoN-TunG
 */
public class FlightController extends HttpServlet {

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
      request.setCharacterEncoding("UTF-8");
      String btnSearch = request.getParameter("btnSearch");
      if (btnSearch != null) {
         String fromLocation = request.getParameter("fromLocation");
         String toLocation = request.getParameter("toLocation");
         int adults = Integer.parseInt(request.getParameter("adults"));
         int children = Integer.parseInt(request.getParameter("children"));
         int infants = Integer.parseInt(request.getParameter("infants"));
         SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
         Date departureDate = null;
         try {
            departureDate = new Date(df.parse(request.getParameter("departureDate")).getTime());
         } catch (ParseException ex) {
            response.sendRedirect("index.jsp");
         }
         String classType = request.getParameter("class");
         int firstClassBook = 0;
         int businessBook = 0;
         int economyBook = 0;
         switch (classType) {
            case "firstClass":
               firstClassBook = adults + children;
               break;
            case "business":
               businessBook = adults + children;
               break;
            default:
               economyBook = adults + children;
               break;
         }
         SearchInfo info = new SearchInfo(fromLocation, toLocation, departureDate, firstClassBook, businessBook, economyBook);
         List<SearchResult> results=new ArrayList<>();
         try {
            results=new FlightDetailContext().searchFlightDetails(info);
         } catch (Exception e) {
         }
         HttpSession session=request.getSession(true);
         session.setAttribute("info", info);
         session.setAttribute("results", results);
         session.setAttribute("adults", adults);
         session.setAttribute("children", children);
         session.setAttribute("infants", infants);
         response.sendRedirect("searchFlight.jsp");
      } else {
         response.sendRedirect("index.jsp");
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
