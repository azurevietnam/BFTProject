/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

import java.sql.Date;

/**
 *
 * @author SoN-TunG
 */
public class BookingHistory {
   private String bookingID, flightName, airlineName, route;
   private boolean bookingClose;
   private Date bookingDate;
   private String classType;
   private double price;
   private Date departureDate, arrivalDate;

   public BookingHistory() {
   }

   public BookingHistory(String bookingID, String flightName, String airlineName, String rounte, boolean bookingClose, Date bookingDate, String classType, double price, Date departureDate, Date arrivalDate) {
      this.bookingID = bookingID;
      this.flightName = flightName;
      this.airlineName = airlineName;
      this.route = rounte;
      this.bookingClose = bookingClose;
      this.bookingDate = bookingDate;
      this.classType = classType;
      this.price = price;
      this.departureDate = departureDate;
      this.arrivalDate = arrivalDate;
   }

   public String getBookingID() {
      return bookingID;
   }

   public void setBookingID(String bookingID) {
      this.bookingID = bookingID;
   }

   public String getFlightName() {
      return flightName;
   }

   public void setFlightName(String flightName) {
      this.flightName = flightName;
   }

   public String getAirlineName() {
      return airlineName;
   }

   public void setAirlineName(String airlineName) {
      this.airlineName = airlineName;
   }

   public String getRoute() {
      return route;
   }

   public void setRoute(String route) {
      this.route = route;
   }

   public boolean isBookingClose() {
      return bookingClose;
   }

   public void setBookingClose(boolean bookingClose) {
      this.bookingClose = bookingClose;
   }

   public Date getBookingDate() {
      return bookingDate;
   }

   public void setBookingDate(Date bookingDate) {
      this.bookingDate = bookingDate;
   }

   public String getClassType() {
      return classType;
   }

   public void setClassType(String classType) {
      this.classType = classType;
   }

   public double getPrice() {
      return price;
   }

   public void setPrice(double price) {
      this.price = price;
   }

   public Date getDepartureDate() {
      return departureDate;
   }

   public void setDepartureDate(Date departureDate) {
      this.departureDate = departureDate;
   }

   public Date getArrivalDate() {
      return arrivalDate;
   }

   public void setArrivalDate(Date arrivalDate) {
      this.arrivalDate = arrivalDate;
   }

   
}
