/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author SoN-TunG
 */
public class SearchResult implements Serializable{
   private String flightID, detailID, flightName, airlineName,departureTime,arrivalTime;
   private Date arrivalDate;
   private double price;
   private boolean available;

   public SearchResult() {
   }

   public String getFlightID() {
      return flightID;
   }

   public void setFlightID(String flightID) {
      this.flightID = flightID;
   }

   public String getDetailID() {
      return detailID;
   }

   public void setDetailID(String detailID) {
      this.detailID = detailID;
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

   public String getDepartureTime() {
      return departureTime;
   }

   public void setDepartureTime(String departureTime) {
      this.departureTime = departureTime;
   }

   public String getArrivalTime() {
      return arrivalTime;
   }

   public void setArrivalTime(String arrivalTime) {
      this.arrivalTime = arrivalTime;
   }

   public Date getArrivalDate() {
      return arrivalDate;
   }

   public void setArrivalDate(Date arrivalDate) {
      this.arrivalDate = arrivalDate;
   }

   public double getPrice() {
      return price;
   }

   public void setPrice(double price) {
      this.price = price;
   }

   public boolean isAvailable() {
      return available;
   }

   public void setAvailable(boolean available) {
      this.available = available;
   }
   
}
