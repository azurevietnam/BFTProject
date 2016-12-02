/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.Passenger;
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
public class PassengerContext extends DBContext {

    public PassengerContext() throws Exception {
    }

    @Override
    protected void finalize() throws Throwable {
        super.close();
    }

    public void addPassenger(Passenger passenger) {
        String sql = "INSERT INTO PASSENGER VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, passenger.getPassengerID());
            ps.setString(2, passenger.getFirstName());
            ps.setString(3, passenger.getLastName());
            ps.setString(4, passenger.getAddress());
            ps.setString(5, passenger.getTelNo());
            ps.setString(6, passenger.getEmail());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PassengerContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Passenger searchPassenger(String passengerName) {
        String sql = "SELECT * FROM PASSENGER WHERE passenger_id=" + passengerName;
        Passenger passenger = null;
        try {
            ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
            while (rs.next()) {
                String passenger_id = rs.getString(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String address = rs.getString(4);
                String telNo = rs.getString(5);
                String emali = rs.getString(6);
                passenger = new Passenger(passenger_id, firstName, lastName, address, telNo, emali);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return passenger;
    }

    public void removePassenger(Passenger passenger) {
        String sql = "DELETE FROM PASSENGER WHERE passenger_id = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, passenger.getPassengerID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePassenger(Passenger passenger) {
        String sql = "UPDATE [dbo].[PASSENGER]"
                + "   SET [first_name] = ?"
                + "      ,[last_name] = ?"
                + "      ,[address] = ?"
                + "      ,[tel_no] = ?"
                + "      ,[email] = ?"
                + " WHERE [passenger_id] = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, passenger.getFirstName());
            ps.setString(2, passenger.getLastName());
            ps.setString(3, passenger.getAddress());
            ps.setString(4, passenger.getTelNo());
            ps.setString(5, passenger.getEmail());
            ps.setString(6, passenger.getPassengerID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Passenger> getAllPassenger() {
        List<Passenger> p = new ArrayList<>();
        String sql = "SELECT * FROM PASSENGER";
        try {
            Passenger passenger = null;
            ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
            while (rs.next()) {
                passenger = new Passenger(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                p.add(passenger);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
}
