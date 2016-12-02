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
   private String passengerID,firstName,lastName,address,telNo,email;

   public Passenger() {
   }

   public Passenger(String passengerID, String firstName, String lastName, String address, String telNo, String email) {
      this.passengerID = passengerID;
      this.firstName = firstName;
      this.lastName = lastName;
      this.address = address;
      this.telNo = telNo;
      this.email = email;
   }

   public String getPassengerID() {
      return passengerID;
   }

   public void setPassengerID(String passengerID) {
      this.passengerID = passengerID;
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

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
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
