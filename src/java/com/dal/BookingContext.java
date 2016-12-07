/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.Booking;
import com.entities.BookingHistory;
import com.entities.FlightDetail;
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
public class BookingContext extends DBContext {

   public BookingContext() throws Exception {
   }

   @Override
   protected void finalize() throws Throwable {
      super.close();
   }

   public String addBooking(Booking booking) {
      String sql = "INSERT INTO BOOKING VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
      String checkSql = "select * from BOOKING where booking_id=?";
      try {
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
         ps.setString(2, booking.getPassengerID());
         ps.setString(3, booking.getDetailID());
         int bookingClosed = booking.isBookingClosed() == true ? 1 : 0;
         ps.setInt(4, bookingClosed);
         ps.setDate(5, booking.getBookingDate());
         ps.setInt(6, booking.getAdults());
         ps.setInt(7, booking.getChildren());
         ps.setInt(8, booking.getInfants());
         ps.setInt(9, booking.getFirstClassBook());
         ps.setInt(10, booking.getBusinessClassBook());
         ps.setInt(11, booking.getEconomyClassBook());
         ps.setDouble(12, booking.getTotalPrice());
         ps.executeUpdate();

         return id;
      } catch (SQLException e) {
         return null;
      }
   }

   public Booking searchBooking(String bookingID) {
      String sql = "SELECT * FROM BOOKING WHERE booking_id='" + bookingID+"'";
      Booking booking = null;
      try {
         ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
         while (rs.next()) {
            booking = new Booking(rs.getString(1), rs.getString(2), rs.getString(3), (rs.getInt(4) == 1), rs.getDate(5),
                    rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getDouble(12));
         }
      } catch (SQLException ex) {
         Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
      }
      return booking;
   }

   public void removeBooking(String bookingID) throws Exception {
      //Change available seats in flight
      Booking b = searchBooking(bookingID);
      FlightDetail fd = new FlightDetailContext().searchFlightDetail(b.getDetailID());
      fd.setAvailableFirstClassSeats(fd.getAvailableFirstClassSeats() + b.getFirstClassBook());
      fd.setAvailableBusinessSeats(fd.getAvailableBusinessSeats() + b.getBusinessClassBook());
      fd.setAvailableEconomySeats(fd.getAvailableEconomySeats() + b.getEconomyClassBook());
      new FlightDetailContext().updateFlight(fd);
      //remove booking
      String sql = "DELETE FROM BOOKING WHERE booking_id = ?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, bookingID);
      ps.executeUpdate();
   }

   public void updateBooking(Booking booking) {
      String sql = "UPDATE BOOKING"
              + "SET booking_date=?";
      try {
         PreparedStatement ps = getConnection().prepareStatement(sql);
         ps.setDate(1, booking.getBookingDate());
         ps.executeUpdate();
      } catch (SQLException ex) {
         Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
      }
   }

   public List<Booking> getAllBooking() {
      List<Booking> b = new ArrayList<>();
      String sql = "SELECT * FROM BOOKING";
      try {
         Booking booking;
         ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
         while (rs.next()) {
            booking = new Booking(rs.getString(1), rs.getString(2), rs.getString(3), (rs.getInt(4) == 1), rs.getDate(5),
                    rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getDouble(12));
            b.add(booking);
         }
      } catch (SQLException ex) {
         Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
      }
      return b;
   }

   public List<BookingHistory> getBookingByUsername(String username) throws Exception {
      List<BookingHistory> bookings = new ArrayList<>();
      String sql = "SELECT booking_id, flight_name, airline_name, from_location+' to '+to_location as route, "
              + "	booking_closed,booking_date, departure_date, arrival_date,total_price, "
              + "	class=CASE  "
              + "			WHEN first_class_book>0 THEN 'First Class' "
              + "			WHEN business_book>0 THEN 'Business' "
              + "			ELSE 'Economy' "
              + "		END  "
              + "FROM BOOKING,FLIGHT_DETAILS,FLIGHT  "
              + "WHERE BOOKING.detail_id=FLIGHT_DETAILS.detail_id  "
              + "AND FLIGHT_DETAILS.flight_id=FLIGHT.flight_id "
              + "AND username=?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, username);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         BookingHistory bh = new BookingHistory();
         bh.setBookingID(rs.getString(1));
         bh.setFlightName(rs.getString(2));
         bh.setAirlineName(rs.getString(3));
         bh.setRoute(rs.getString(4));
         bh.setBookingClose(rs.getInt(5) == 1);
         bh.setBookingDate(rs.getDate(6));
         bh.setDepartureDate(rs.getDate(7));
         bh.setArrivalDate(rs.getDate(8));
         bh.setPrice(rs.getDouble(9));
         bh.setClassType(rs.getString(10));
         bookings.add(bh);
      }
      return bookings;
   }

}
