/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.Passenger;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author SoN-TunG
 */
public class PassengerContext extends DBContext{

   public PassengerContext() throws Exception {
   }

   @Override
   protected void finalize() throws Throwable {
      super.close();
   }
   public void addPassenger(Passenger passenger){
      
   }
   public Passenger searchPassenger(String passengerName){
      return new Passenger();
   }
   public void removePassenger(Passenger passenger){
      
   }
   public void updatePassenger(Passenger passenger){
      
   }
   public List<Passenger> getAllPassenger(){
      return null;
   }
}
