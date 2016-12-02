/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import com.entities.FlightDetail;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
      PreparedStatement ps=getConnection().prepareStatement(sql);
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

   public List<FlightDetail> getAllFlightDetails() throws Exception{
      String sql="select * from FLIGHT_DETAILS";
      ResultSet rs=getConnection().prepareStatement(sql).executeQuery();
      ArrayList<FlightDetail> flightDetails=new ArrayList<>();
      while(rs.next()){
         FlightDetail detail=new FlightDetail();
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
//      FlightDetailContext fd = new FlightDetailContext();
////      FlightDetail d=new FlightDetail();
////      d.setFlightID("BAEJRU");
////      d.setDepartureDate(new Date(new java.util.Date().getTime()));
////      d.setArrivalDate(new Date(new java.util.Date().getTime()));
////      d.setFirstClassPrice(40000);
////      d.setBusinessPrice(20000);
////      d.setEconomyPrice(10000);
////      d.setAvailableFirstClassSeats(10);
////      d.setAvailableBusinessSeats(100);
////      d.setAvailableEconomySeats(1000);
////      fd.addFlightDetail(d);
//      //fd.removeFlight("TO301L");
//      System.out.println(fd.getAllFlightDetails().size());
//   }
}
