/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.BookingHistory;
import com.entities.Flight;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SoN-TunG
 */
public class FlightContext extends DBContext {

    public FlightContext() throws Exception {
    }

    @Override
    protected void finalize() throws Throwable {
        super.close();
    }

    public void addFlight(Flight flight) throws Exception {
        String sql = "insert into FLIGHT values(?,?,?,?,?,?,?,?,?,?)";
        String checkSql = "select * from FLIGHT where flight_id=?";
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
        ps.setString(2, flight.getFlightName());
        ps.setString(3, flight.getAirlineName());
        ps.setString(4, flight.getFromLocation());
        ps.setString(5, flight.getToLocation());
        ps.setString(6, flight.getDepartureTime());
        ps.setString(7, flight.getArrivalTime());
        ps.setInt(8, flight.getFirstClassSeats());
        ps.setInt(9, flight.getBusinessSeats());
        ps.setInt(10, flight.getEconomySeats());
        ps.executeUpdate();
    }

    /**
     * Search flight by flightID
     *
     * @param flightID
     * @return
     * @throws Exception
     */
    public Flight searchFlightByID(String flightID) throws Exception {
        String sql = "select * from FLIGHT where [flight_id]='" + flightID + "'";
        ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
        while (rs.next()) {
            Flight f = new Flight(rs.getString(1), rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                    rs.getInt(8), rs.getInt(9), rs.getInt(10));
            return f;
        }
        return null;
    }

    /**
     * Search flight by airlineName
     *
     * @param airlineName
     * @return
     * @throws Exception
     */
    public List<Flight> searchFlight(String airlineName) throws Exception {
        List<Flight> flights = new ArrayList<>();
        String sql = "select * from FLIGHT where [airline_name]='" + airlineName + "'";
        ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
        while (rs.next()) {
            Flight f = new Flight(rs.getString(1), rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                    rs.getInt(8), rs.getInt(9), rs.getInt(10));
            flights.add(f);
        }
        return flights;
    }

    /**
     * Remove flight by flightID
     *
     * @param flightID
     * @throws Exception
     */
    public void removeFlight(String flightID) throws Exception {
        String sql = "delete from FLIGHT where flight_id='" + flightID + "'";
        getConnection().prepareStatement(sql).executeUpdate();
    }

    /**
     * Update Flight
     *
     * @param flight
     * @throws Exception
     */
    public void updateFlight(Flight flight) throws Exception {
        String sql = "UPDATE [dbo].[FLIGHT]"
                + "   SET "
                + "      [flight_name] = ?"
                + "      ,[airline_name] = ?"
                + "      ,[from_location] = ?"
                + "      ,[to_location] = ?"
                + "      ,[departure_time] = ?"
                + "      ,[arrival_time] = ?"
                + "      ,[first_class_seats] = ?"
                + "      ,[business_seats] = ?"
                + "      ,[economy_seats] = ?"
                + " WHERE flight_id=?";
        PreparedStatement ps = getConnection().prepareStatement(sql);
        ps.setString(1, flight.getFlightName());
        ps.setString(2, flight.getAirlineName());
        ps.setString(3, flight.getFromLocation());
        ps.setString(4, flight.getToLocation());
        ps.setString(5, flight.getDepartureTime());
        ps.setString(6, flight.getArrivalTime());
        ps.setInt(7, flight.getFirstClassSeats());
        ps.setInt(8, flight.getBusinessSeats());
        ps.setInt(9, flight.getEconomySeats());
        ps.setString(10, flight.getFlightID());
        ps.executeUpdate();
    }

    /**
     *
     * @return number of rows in Product table
     * @throws Exception
     */
    public int getRowCount() throws Exception {
        String sql = "select count(*) from FLIGHT";
        PreparedStatement ps = getConnection().prepareStatement(sql);
        int n = 0;
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            n = rs.getInt(1);
        }
        rs.close();
        return n;
    }

    public int getRowCount(String airlineName) throws Exception {
        String sql = "select count(*) from FLIGHT where airline_name='" + airlineName + "'";
        PreparedStatement ps = getConnection().prepareStatement(sql);
        int n = 0;
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            n = rs.getInt(1);
        }
        rs.close();
        return n;
    }

    public List<Flight> getAllFlight(int a, int b, String airlineName) throws Exception {
        ArrayList<Flight> flights = new ArrayList<>();
        // call store GetProducts with two param (?,?)
        CallableStatement cs = getConnection().prepareCall("{call GetFlights(?,?,?)}");
        cs.setInt(1, a);
        cs.setInt(2, b);
        cs.setString(3, airlineName);
        ResultSet rs = cs.executeQuery();
        while (rs.next()) {
            Flight f = new Flight();
            f.setFlightID(rs.getString(1));
            f.setFlightName(rs.getString(2));
            f.setAirlineName(rs.getString(3));
            f.setFromLocation(rs.getString(4));
            f.setToLocation(rs.getString(5));
            f.setDepartureTime(rs.getString(6));
            f.setArrivalTime(rs.getString(7));
            f.setFirstClassSeats(rs.getInt(8));
            f.setBusinessSeats(rs.getInt(9));
            f.setEconomySeats(rs.getInt(10));
            flights.add(f);
        }
        return flights;
    }

    //get all  location for auto complete
    public ArrayList<String> getLocations() throws Exception {
        ArrayList<String> list = new ArrayList<>();
        String sql = "select DISTINCT from_location from FLIGHT";
        ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
        while (rs.next()) {
            list.add(rs.getString(1));
        }
        sql = "select DISTINCT to_location from FLIGHT";
        rs = getConnection().prepareStatement(sql).executeQuery();
        while (rs.next()) {
            if (!list.contains(rs.getString(1))) {
                list.add(rs.getString(1));
            }
        }
        return list;
    }

    public BookingHistory getBookingHistory(String flightID, BookingHistory bh) throws Exception {
        String sql = "select * from FLIGHT where flight_id='" + flightID + "'";
        ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
        while (rs.next()) {
        }
        return bh;
    }

//   public static void main(String[] args) throws Exception {
//      FlightContext fc = new FlightContext();
////      Flight f = new Flight();
////      f.setAirlineName("Vietnam Airline");
////      f.setFlightName("VN 190");
////      f.setFromLocation("Ha Noi");
////      f.setToLocation("TP Ho Chi Minh");
////      f.setDepartureTime(new Date(new java.util.Date().getTime()));
////      f.setArrivalTime(new Date(new java.util.Date().getTime()));
////      f.setBusinessSeats(100);
////      f.setEconomySeats(1000);
////      f.setFirstClassSeats(10);
////      fc.addFlight(f);
////      Flight search=fc.searchFlight("WQ9Y2E");
////      System.out.println(search.getFlightID());
////      fc.removeFlight("WQ9Y2E");
////      Flight f = new Flight();
////      f.setAirlineName("Vietnam Airline");
////      f.setFlightName("VN 300");
////      f.setFromLocation("Hà Nội");
////      f.setToLocation("TP Ho Chi Minh");
////      f.setDepartureTime(new Date(new java.util.Date().getTime()));
////      f.setArrivalTime(new Date(new java.util.Date().getTime()));
////      f.setBusinessSeats(100);
////      f.setEconomySeats(1000);
////      f.setFirstClassSeats(10);
////      f.setFlightID("BAEJRU");
////      fc.updateFlight(f);
//      System.out.println(fc.getAllFlight().size());
//   }
}
