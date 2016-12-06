/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.Passenger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SoN-TunG
 */
public class PassengerContext extends DBContext {

   public PassengerContext() throws Exception {
   }

   @Override
   protected void finalize() throws Throwable {
      super.close();
   }

   public void addPassenger(Passenger passenger) throws Exception {
      String sql = "INSERT INTO PASSENGER VALUES(?,?,?,?,?,?,?,?)";
      String checkSql = "select * from PASSENGER where passenger_id=?";
      PreparedStatement psCheck = getConnection().prepareStatement(checkSql);
      String id = "";
      while (true) {
         id = getPrimaryKey();
         psCheck.setString(1, id);
         ResultSet rs = psCheck.executeQuery();
         if (!rs.next()) {
            break;
         }
      }
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, id);
      ps.setString(2, passenger.getBookingID());
      ps.setString(3, passenger.getFirstName());
      ps.setString(4, passenger.getLastName());
      ps.setInt(5, passenger.getGender());
      ps.setString(6, passenger.getCountry());
      ps.setString(7, passenger.getTelNo());
      ps.setString(8, passenger.getEmail());
      ps.executeUpdate();
   }

   public Passenger searchPassenger(String passengerName) throws Exception {
      String sql = "SELECT * FROM PASSENGER WHERE passenger_id=" + passengerName;
      Passenger passenger = null;
      ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
      while (rs.next()) {
         String passenger_id = rs.getString(1);
         String bookingID = rs.getString(2);
         String firstName = rs.getString(3);
         String lastName = rs.getString(4);
         int gender = rs.getInt(5);
         String country = rs.getString(6);
         String telNo = rs.getString(7);
         String email = rs.getString(8);
         passenger = new Passenger(passenger_id, bookingID, firstName, lastName, gender, country, telNo, email);
      }

      return passenger;
   }

   public void removePassenger(String passengerID) throws Exception {
      String sql = "DELETE FROM PASSENGER WHERE passenger_id = ?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, passengerID);
      ps.executeUpdate();

   }
   public void removePassengerByBookingID(String bookingID) throws Exception{
      String sql="delete from PASSENGER where booking_id=?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, bookingID);
      ps.executeUpdate();
   }

   public void updatePassenger(Passenger passenger) {
      String sql = "UPDATE [dbo].[PASSENGER]"
              + "   SET [booking_id] = ?"
              + "      ,[first_name] = ?"
              + "      ,[last_name] = ?"
              + "      ,[gender] = ?"
              + "      ,[country] =?"
              + "      ,[tel_no] = ?"
              + "      ,[email] = ?"
              + " WHERE passenger_id=?";
      try {
         PreparedStatement ps = getConnection().prepareStatement(sql);
         ps.setString(1, passenger.getBookingID());
         ps.setString(2, passenger.getFirstName());
         ps.setString(3, passenger.getLastName());
         ps.setInt(4, passenger.getGender());
         ps.setString(5, passenger.getCountry());
         ps.setString(6, passenger.getTelNo());
         ps.setString(7, passenger.getEmail());
         ps.setString(8, passenger.getPassengerID());
         ps.executeUpdate();
      } catch (SQLException ex) {
         Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
      }
   }

   public List<Passenger> getAllPassenger() throws Exception {
      List<Passenger> p = new ArrayList<>();
      String sql = "SELECT * FROM PASSENGER";
      Passenger passenger = null;
      ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
      while (rs.next()) {
         passenger = new Passenger(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                 Integer.parseInt(rs.getString(5)), rs.getString(6), rs.getString(7), rs.getString(8));
         p.add(passenger);
      }
      return p;
   }

}
