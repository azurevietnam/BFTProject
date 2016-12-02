/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.Booking;
import java.util.List;

/**
 *
 * @author SoN-TunG
 */
public class BookingContext extends DBContext{

   public BookingContext() throws Exception {
   }

   @Override
   protected void finalize() throws Throwable {
      super.close();
   }
   public void addBooking(Booking booking){
      
   }
   public Booking searchBooking(String bookingID){
      return new Booking();
   }
   public void removeBooking(Booking booking){
      
   }
   public void updateBooking(Booking booking){
      
   }
   public List<Booking> getAllBooking(){
      return null;
   }
}
