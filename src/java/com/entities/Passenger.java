/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

import java.io.Serializable;

/**
 *
 * @author SoN-TunG
 */
public class Passenger implements Serializable{
   private String passengerID,bookingID,firstName,lastName;
   private int gender;
   private String country,telNo,email;

   public Passenger() {
   }

   public Passenger(String passengerID, String bookingID, String firstName, String lastName, int gender, String country, String telNo, String email) {
      this.passengerID = passengerID;
      this.bookingID = bookingID;
      this.firstName = firstName;
      this.lastName = lastName;
      this.gender = gender;
      this.country = country;
      this.telNo = telNo;
      this.email = email;
   }

   public String getPassengerID() {
      return passengerID;
   }

   public void setPassengerID(String passengerID) {
      this.passengerID = passengerID;
   }

   public String getBookingID() {
      return bookingID;
   }

   public void setBookingID(String bookingID) {
      this.bookingID = bookingID;
   }

   public String getFirstName() {
      return firstName;
   }

   public void setFirstName(String firstName) {
      this.firstName = firstName;
   }

   public String getLastName() {
      return lastName;
   }

   public void setLastName(String lastName) {
      this.lastName = lastName;
   }

   public int getGender() {
      return gender;
   }

   public void setGender(int gender) {
      this.gender = gender;
   }

   public String getCountry() {
      return country;
   }

   public void setCountry(String country) {
      this.country = country;
   }

   public String getTelNo() {
      return telNo;
   }

   public void setTelNo(String telNo) {
      this.telNo = telNo;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   
}
