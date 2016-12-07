/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dal.FlightContext;
import com.dal.FlightDetailContext;
import com.entities.Flight;
import com.entities.FlightDetail;
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
        HttpSession session = request.getSession(true);
        String pageRedirect = "";
        try {
            // search flight by SonTung
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            String btnSearch = request.getParameter("btnSearch");
            String action = request.getParameter("action");
            FlightContext fc = new FlightContext();
            if (action.equals("Search")) {
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
                    pageRedirect = "index.jsp";
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
                List<SearchResult> results = new ArrayList<>();
                try {
                    results = new FlightDetailContext().searchFlightDetails(info);
                } catch (Exception e) {
                }

                session.setAttribute("info", info);
                session.setAttribute("results", results);
                session.setAttribute("adults", adults);
                session.setAttribute("children", children);
                session.setAttribute("infants", infants);
                pageRedirect = "searchFlight.jsp";
            } // Add flight by QuynhNguyen
            else if (action.equals("Add")) {
                String flightName = request.getParameter("flightName");
                String airlineName = request.getParameter("airlineName");
                String fromLocation = request.getParameter("fromLocation");
                String toLocation = request.getParameter("toLocation");
                String departure = request.getParameter("departure");
                String arrival = request.getParameter("arrival");
                String fSeat = request.getParameter("fSeat");
                String eSeat = request.getParameter("eSeat");
                String bSeat = request.getParameter("bSeat");
                fc.addFlight(new Flight(flightName, flightName, airlineName, fromLocation, toLocation,
                        departure, arrival, Integer.parseInt(fSeat), Integer.parseInt(bSeat), Integer.parseInt(eSeat)));
                pageRedirect = "adminFlight.jsp";

            } else if (action.equals("showFlightDetail")) {
                String flightID = request.getParameter("flightID");
                FlightDetailContext fdc = new FlightDetailContext();
                List<FlightDetail> lst = fdc.searchFlightDetailByFlightID(flightID);
                session.setAttribute("listFlightDetail", lst);
                pageRedirect = "adminFlightDetail.jsp";
            } else if (action.equals("delete")) {
                String flightID = request.getParameter("flightID");
                fc.removeFlight(flightID);
                pageRedirect = "adminFlight.jsp";
            } else if (action.equals("edit")) {
                String flightID = request.getParameter("flightID");
                Flight f = fc.searchFlightByID(flightID);
                session.setAttribute("flight", f);
                pageRedirect = "adminEditFlight.jsp";
            } else if (action.equals("Update")) {
                String flightName = request.getParameter("flightName");
                String airlineName = request.getParameter("airlineName");
                String fromLocation = request.getParameter("fromLocation");
                String toLocation = request.getParameter("toLocation");
                String departure = request.getParameter("departure");
                String arrival = request.getParameter("arrival");
                String fSeat = request.getParameter("fSeat");
                String eSeat = request.getParameter("eSeat");
                String bSeat = request.getParameter("bSeat");
                String flightID = request.getParameter("flightID");
                Flight f = new Flight(flightID, flightName, airlineName, fromLocation, toLocation,
                        departure, arrival, Integer.parseInt(fSeat), Integer.parseInt(bSeat), Integer.parseInt(eSeat));
                fc.updateFlight(f);
                pageRedirect = "adminFlight.jsp";
            }
        } catch (Exception ex) {
            Logger.getLogger(FlightController.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("addError", "Add fail!");
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
