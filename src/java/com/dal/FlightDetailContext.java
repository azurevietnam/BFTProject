/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.BookingHistory;
import com.entities.FlightDetail;
import com.entities.SearchInfo;
import com.entities.SearchResult;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SoN-TunG
 */
public class FlightDetailContext extends DBContext {

   public FlightDetailContext() throws Exception {
   }

   @Override
   protected void finalize() throws Throwable {
      super.close();
   }

   public void addFlightDetail(FlightDetail detail) throws Exception {
      String checksql = "select * from FLIGHT_DETAILS where detail_id=?";
      PreparedStatement psCheck = getConnection().prepareStatement(checksql);
      String id = "";
      while (true) {
         id = getPrimaryKey();
         psCheck.setString(1, id);
         ResultSet rs = psCheck.executeQuery();
         if (!rs.next()) {
            break;
         }
      }
      String sql = "insert into FLIGHT_DETAILS values(?,?,?,?,?,?,?,?,?,?)";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, id);
      ps.setString(2, detail.getFlightID());
      ps.setDate(3, detail.getDepartureDate());
      ps.setDate(4, detail.getArrivalDate());
      ps.setDouble(5, detail.getFirstClassPrice());
      ps.setDouble(6, detail.getBusinessPrice());
      ps.setDouble(7, detail.getEconomyPrice());
      ps.setInt(8, detail.getAvailableFirstClassSeats());
      ps.setInt(9, detail.getAvailableBusinessSeats());
      ps.setInt(10, detail.getAvailableEconomySeats());
      ps.executeUpdate();
   }

   /**
    * Search flight by from, to location and departure date
    *
    * @param info search info
    * @return
    * @throws Exception
    */
   public List<SearchResult> searchFlightDetails(SearchInfo info) throws Exception {
      ArrayList<SearchResult> results = new ArrayList<>();
      String sql = "SELECT flight_details.flight_id, detail_id,flight_name,airline_name,"
              + "	departure_time,arrival_time,arrival_date,"
              + "	first_class_price,business_price,economy_price,"
              + "	avai_first_class_seats,avai_business_seats,avai_economy_seats"
              + "   FROM FLIGHT_DETAILS,FLIGHT "
              + "   WHERE "
              + "	FLIGHT.flight_id=FLIGHT_DETAILS.flight_id"
              + "       AND Flight.flight_id IN"
              + "		( SELECT flight_id FROM FLIGHT"
              + "		  WHERE from_location= ? AND to_location= ? "
              + "		)"
              + "	AND departure_date=?"
              + "	";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, info.getFromLocation());
      ps.setString(2, info.getToLocation());
      ps.setDate(3, info.getDepartureDate());
      //get class type- index in sql result
      int classType = 8;
      if (info.getBusinessBook() > 0) {
         classType = 9;
      } else if (info.getEconomyBook() > 0) {
         classType = 10;
      }
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         SearchResult sr = new SearchResult();
         sr.setFlightID(rs.getString(1));
         sr.setDetailID(rs.getString(2));
         sr.setFlightName(rs.getString(3));
         sr.setAirlineName(rs.getString(4));
         sr.setDepartureTime(rs.getString(5));
         sr.setArrivalTime(rs.getString(6));
         sr.setArrivalDate(rs.getDate(7));
         sr.setPrice(rs.getDouble(classType));
         int availableFirstClass = Integer.parseInt(rs.getString(11));
         int availableBusiness = Integer.parseInt(rs.getString(12));
         int availableEconomy = Integer.parseInt(rs.getString(13));
         sr.setAvailable(availableFirstClass >= info.getFirstClassBook()
                 && availableBusiness >= info.getBusinessBook()
                 && availableEconomy >= info.getEconomyBook());
         results.add(sr);
      }
      return results;
   }

   public boolean checkAvailable(String detailID, int firstClassBook, int businessBook, int economyBook)
           throws Exception {
      String sql = "select avai_first_class_seats,avai_business_seats,avai_economy_seats\n"
              + " from FLIGHT_DETAILS where detail_id=?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, detailID);
      ResultSet rs = ps.executeQuery();
      if (rs.next()) {
         return rs.getInt(1) >= firstClassBook
                 && rs.getInt(2) >= businessBook
                 && rs.getInt(3) >= economyBook;
      } else {
         return false;
      }
   }

   public FlightDetail searchFlightDetail(String detailID) throws Exception {
      String sql = "select * from FLIGHT_DETAILS where detail_id='" + detailID + "'";
      ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
      while (rs.next()) {
         FlightDetail detail = new FlightDetail();
         detail.setDetailID(detailID);
         detail.setFlightID(rs.getString(2));
         detail.setDepartureDate(rs.getDate(3));
         detail.setArrivalDate(rs.getDate(4));
         detail.setFirstClassPrice(rs.getDouble(5));
         detail.setBusinessPrice(rs.getDouble(6));
         detail.setEconomyPrice(rs.getDouble(7));
         detail.setAvailableFirstClassSeats(rs.getInt(8));
         detail.setAvailableBusinessSeats(rs.getInt(9));
         detail.setAvailableEconomySeats(rs.getInt(10));
         return detail;
      }
      return null;
   }

   public void removeFlight(String detailID) throws Exception {
      String sql = "delete from FLIGHT_DETAILS where detail_id='" + detailID + "'";
      getConnection().prepareStatement(sql).executeUpdate();
   }

   public void updateFlight(FlightDetail detail) throws Exception {
      String sql = "UPDATE [dbo].[FLIGHT_DETAILS]"
              + "   SET "
              + "      [flight_id] = ?"
              + "      ,[departure_date] = ?"
              + "      ,[arrival_date] = ?"
              + "      ,[first_class_price] = ?"
              + "      ,[business_price] = ?"
              + "      ,[economy_price] = ?"
              + "      ,[avai_first_class_seats] = ?"
              + "      ,[avai_business_seats] = ?"
              + "      ,[avai_economy_seats] = ?"
              + " WHERE detail_id=?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, detail.getFlightID());
      ps.setDate(2, detail.getDepartureDate());
      ps.setDate(3, detail.getArrivalDate());
      ps.setDouble(4, detail.getFirstClassPrice());
      ps.setDouble(5, detail.getBusinessPrice());
      ps.setDouble(6, detail.getEconomyPrice());
      ps.setInt(7, detail.getAvailableFirstClassSeats());
      ps.setInt(8, detail.getAvailableBusinessSeats());
      ps.setInt(9, detail.getAvailableEconomySeats());
      ps.setString(10, detail.getDetailID());
      ps.executeUpdate();
   }

   public List<FlightDetail> getAllFlightDetails() throws Exception {
      String sql = "select * from FLIGHT_DETAILS";
      ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
      ArrayList<FlightDetail> flightDetails = new ArrayList<>();
      while (rs.next()) {
         FlightDetail detail = new FlightDetail();
         detail.setDetailID(rs.getString(1));
         detail.setFlightID(rs.getString(2));
         detail.setDepartureDate(rs.getDate(3));
         detail.setArrivalDate(rs.getDate(4));
         detail.setFirstClassPrice(rs.getDouble(5));
         detail.setBusinessPrice(rs.getDouble(6));
         detail.setEconomyPrice(rs.getDouble(7));
         detail.setAvailableFirstClassSeats(rs.getInt(8));
         detail.setAvailableBusinessSeats(rs.getInt(9));
         detail.setAvailableEconomySeats(rs.getInt(10));
         flightDetails.add(detail);
      }
      return flightDetails;
   }

   /**
    * get price of tickets by class type
    *
    * @param detail_id detail_id of flight details
    * @param classType 5-first class, 6-business, 7-economy
    * @return price of ticket
    * @throws java.lang.Exception
    */
   public double getPrice(String detail_id, int classType) throws Exception {
      String sql = "select * from FLIGHT_DETAILS where detail_id=?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, detail_id);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         return rs.getDouble(classType);
      }
      return -1;
   }

   public BookingHistory getBookingHistory(String detailID, BookingHistory bh) throws Exception {
      String sql = "select * from FLIGHT_DETAILS where detail_id=?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, detailID);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         bh.setDepartureDate(rs.getDate(3));
         bh.setArrivalDate(rs.getDate(4));
      }
      return bh;
   }
//   public static void main(String[] args) throws Exception {
//      FlightDetailContext fdc = new FlightDetailContext();
//      List<FlightDetail> details=fdc.getAllFlightDetails();
//      for (FlightDetail d:details){
//         System.out.println(d.getDepartureDate().toString());
//      }
//   }
}
