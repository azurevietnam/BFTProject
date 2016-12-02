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
public class Flight implements Serializable {

   private String flightID, flightName, airlineName, fromLocation, toLocation;
   private Date departureTime, arrivalTime;
   private int firstClassSeats, businessSeats, economySeats;

   public Flight() {
   }

   public String getFlightID() {
      return flightID;
   }

   public void setFlightID(String flightID) {
      this.flightID = flightID;
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

   public String getFromLocation() {
      return fromLocation;
   }

   public void setFromLocation(String fromLocation) {
      this.fromLocation = fromLocation;
   }

   public String getToLocation() {
      return toLocation;
   }

   public void setToLocation(String toLocation) {
      this.toLocation = toLocation;
   }

   public Date getDepartureTime() {
      return departureTime;
   }

   public void setDepartureTime(Date departureTime) {
      this.departureTime = departureTime;
   }

   public Date getArrivalTime() {
      return arrivalTime;
   }

   public void setArrivalTime(Date arrivalTime) {
      this.arrivalTime = arrivalTime;
   }

   public int getFirstClassSeats() {
      return firstClassSeats;
   }

   public void setFirstClassSeats(int firstClassSeats) {
      this.firstClassSeats = firstClassSeats;
   }

   public int getBusinessSeats() {
      return businessSeats;
   }

   public void setBusinessSeats(int businessSeats) {
      this.businessSeats = businessSeats;
   }

   public int getEconomySeats() {
      return economySeats;
   }

   public void setEconomySeats(int economySeats) {
      this.economySeats = economySeats;
   }
   
   
}
