/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dal.BookingContext;
import com.dal.FlightDetailContext;
import com.dal.PassengerContext;
import com.entities.Booking;
import com.entities.FlightDetail;
import com.entities.Passenger;
import com.entities.SearchInfo;
import com.entities.SearchResult;
import com.entities.User;
import java.io.IOException;
import java.sql.Date;
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
public class BookingController extends HttpServlet {

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
      HttpSession session = request.getSession(true);
      String action = request.getParameter("action");
      if (action != null) {
         //add new booking
         if (action.equals("add")) {
            SearchInfo info = (SearchInfo) session.getAttribute("info");
            if (info != null) {// user has searched before
               String detailID = request.getParameter("id");
               //check seat available
               boolean available = true;
               try {
                  available = new FlightDetailContext().checkAvailable(detailID,
                          info.getFirstClassBook(), info.getBusinessBook(), info.getEconomyBook());
               } catch (Exception ex) {
                  available = false;
               }
               if (!available) {
                  List<SearchResult> results = new ArrayList<>();
                  try {
                     results = new FlightDetailContext().searchFlightDetails(info);
                  } catch (Exception e) {
                  }
                  session.setAttribute("results", results);
                  session.setAttribute("bookingStatus", "You are late. Your tickets has been taken.");
               }
               int adults = (int) session.getAttribute("adults");
               int children = (int) session.getAttribute("children");
               int infants = (int) session.getAttribute("infants");
               User user = (User) session.getAttribute("login");
               Date bookingDate = new Date(new java.util.Date().getTime());
               double totalPrice = Double.parseDouble(request.getParameter("total"));
               Booking booking = new Booking("", user.getUsername(), detailID, false, bookingDate, adults, children,
                       infants, info.getFirstClassBook(), info.getBusinessBook(), info.getEconomyBook(), totalPrice);
               String bookingId = "";
               try {
                  bookingId = new BookingContext().addBooking(booking);

                  // update available seats in flight details
                  FlightDetailContext fdContext = new FlightDetailContext();
                  FlightDetail fd = fdContext.searchFlightDetail(detailID);
                  fd.setAvailableFirstClassSeats(fd.getAvailableFirstClassSeats() - info.getFirstClassBook());
                  fd.setAvailableBusinessSeats(fd.getAvailableBusinessSeats() - info.getBusinessBook());
                  fd.setAvailableEconomySeats(fd.getAvailableEconomySeats() - info.getEconomyBook());
                  fdContext.updateFlight(fd);
                  session.removeAttribute("bookingStatus");
               } catch (Exception ex) {
               }

               //add passenger
               String telNo = request.getParameter("telNo");
               String email = request.getParameter("email");

               try {
                  PassengerContext pc = new PassengerContext();
                  for (int i = 1; i <= adults + children + infants; i++) {
                     String firstName = request.getParameter("firstName" + i);
                     String lastName = request.getParameter("lastName" + i);
                     int gender = Integer.parseInt(request.getParameter("gender" + i));
                     String country = request.getParameter("country" + i);
                     Passenger passenger = new Passenger("", bookingId, firstName, lastName, gender, country, telNo, email);
                     pc.addPassenger(passenger);
                  }
               } catch (Exception ex) {
               }
               response.sendRedirect("index.jsp");
            } else {
               //go back searchFlight.jsp to search
               response.sendRedirect("searchFlight.jsp");
            }
         } else if (action.equals("cancel")) {// cancel booking
            String bookingID=request.getParameter("id");
            try {
               new PassengerContext().removePassengerByBookingID(bookingID);
               new BookingContext().removeBooking(bookingID);
               response.sendRedirect("history.jsp");
            } catch (Exception ex) {
            }
         }
      } else {//go back to index.jsp
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
