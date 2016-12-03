/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

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

   public List<SearchResult> searchFlightDetails(SearchInfo info) throws Exception {
      ArrayList<SearchResult> results = new ArrayList<>();
      String sql = "select FLIGHT.flight_id,detail_id,flight_name,airline_name,from_location,to_location\n"
              + "	,departure_time,arrival_time,first_class_price,business_price,economy_price\n"
              + "from FLIGHT_DETAILS,FLIGHT \n"
              + "where Flight.flight_id in( select flight_id from FLIGHT\n"
              + "					where from_location=? and to_location=?\n"
              + "					)\n"
              + "	and departure_date=?\n"
              + "	and avai_first_class_seats >=?\n"
              + "	and avai_business_seats  >=?\n"
              + "	and avai_economy_seats >=?";
      PreparedStatement ps = getConnection().prepareStatement(sql);
      ps.setString(1, info.getFromLocation());
      ps.setString(2, info.getToLocation());
      ps.setDate(3, info.getDepartureDate());
      ps.setInt(4, info.getFirstClassBook());
      ps.setInt(5, info.getBusinessBook());
      ps.setInt(6, info.getEconomyBook());
      //get class type- index in sql result
      int classType = 9;
      if (info.getBusinessBook() > 0) {
         classType = 10;
      } else if (info.getEconomyBook() > 0) {
         classType = 11;
      }
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
         SearchResult sr = new SearchResult();
         sr.setFlightID(rs.getString(1));
         sr.setDetailID(rs.getString(2));
         sr.setFlightName(rs.getString(3));
         sr.setAirlineName(rs.getString(4));
         sr.setFromLocation(rs.getString(5));
         sr.setToLocation(rs.getString(6));
         sr.setDepartureTime(rs.getString(7));
         sr.setArrivalTime(rs.getString(8));
         sr.setPrice(rs.getDouble(classType));
         results.add(sr);
      }
      return results;
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

//   public static void main(String[] args) throws Exception {
//      FlightDetailContext fdc = new FlightDetailContext();
//      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//      Date d = new Date(df.parse("2016-10-10").getTime());
//      SearchInfo info = new SearchInfo("Hà Nội HAN", "TP Hồ Chí Minh", d, 1, 0, 0);
//      System.out.println(fdc.searchFlightDetails(info).size());
//   }
}
