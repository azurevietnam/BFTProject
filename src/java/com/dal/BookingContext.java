/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.Booking;
import java.sql.Date;
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

    public void addBooking(Booking booking) {
        String sql = "INSERT INTO BOOKING VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, booking.getBookingID());
            ps.setString(2, booking.getPassengerID());
            ps.setString(3, booking.getDetailID());
            int bookingClosed = booking.isBookingClosed() == true ? 1 : 0;
            ps.setInt(4, bookingClosed);
            ps.setDate(5, booking.getBookingDate());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Booking searchBooking(String bookingID) {
        String sql = "SELECT * FROM BOOKING WHERE booking_id=" + bookingID;
        Booking booking = null;
        try {
            ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
            while (rs.next()) {
                String booking_id = rs.getString(1);
                String passenger_id = rs.getString(2);
                String detail_id = rs.getString(3);
                int booking_closed = rs.getInt(4);
                Date booking_date = rs.getDate(5);
                booking = new Booking(bookingID, passenger_id, detail_id, true, booking_date);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return booking;
    }

    public void removeBooking(Booking booking) {
        String sql = "DELETE FROM BOOKING WHERE booking_id = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, booking.getBookingID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
        }

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
            Booking booking = null;
            ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
            while (rs.next()) {
                booking = new Booking(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4) == 1 ? true : false, rs.getDate(5));
                b.add(booking);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }
}
