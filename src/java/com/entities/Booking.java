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
public class Booking implements Serializable{
   private String bookingID,passengerID,detailID;
   private boolean bookingClosed;
   private Date bookingDate;

   public Booking() {
   }

   public Booking(String bookingID, String passengerID, String detailID, boolean bookingClosed, Date bookingDate) {
      this.bookingID = bookingID;
      this.passengerID = passengerID;
      this.detailID = detailID;
      this.bookingClosed = bookingClosed;
      this.bookingDate = bookingDate;
   }

   public String getBookingID() {
      return bookingID;
   }

   public void setBookingID(String bookingID) {
      this.bookingID = bookingID;
   }

   public String getPassengerID() {
      return passengerID;
   }

   public void setPassengerID(String passengerID) {
      this.passengerID = passengerID;
   }

   public String getDetailID() {
      return detailID;
   }

   public void setDetailID(String detailID) {
      this.detailID = detailID;
   }

   public boolean isBookingClosed() {
      return bookingClosed;
   }

   public void setBookingClosed(boolean bookingClosed) {
      this.bookingClosed = bookingClosed;
   }

   public Date getBookingDate() {
      return bookingDate;
   }

   public void setBookingDate(Date bookingDate) {
      this.bookingDate = bookingDate;
   }
   
}
