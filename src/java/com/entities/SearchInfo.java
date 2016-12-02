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
public class SearchInfo implements Serializable{
   private String fromLocation;
   private String toLocation;
   private Date departureDate;
   private int firstClassBook;
   private int businessBook;
   private int economyBook;
   
   public SearchInfo() {
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

   public Date getDepartureDate() {
      return departureDate;
   }

   public void setDepartureDate(Date departureDate) {
      this.departureDate = departureDate;
   }

   public int getFirstClassBook() {
      return firstClassBook;
   }

   public void setFirstClassBook(int firstClassBook) {
      this.firstClassBook = firstClassBook;
   }

   public int getBusinessBook() {
      return businessBook;
   }

   public void setBusinessBook(int businessBook) {
      this.businessBook = businessBook;
   }

   public int getEconomyBook() {
      return economyBook;
   }

   public void setEconomyBook(int economyBook) {
      this.economyBook = economyBook;
   }

}
