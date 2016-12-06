<%-- 
    Document   : history
    Created on : Dec 5, 2016, 11:05:22 PM
    Author     : SoN-TunG
--%>

<%@page import="com.dal.BookingContext"%>
<%@page import="com.entities.User"%>
<%@page import="com.entities.BookingHistory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>History</title>
      <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
   </head>
   <body>
      <%
         User u = (User) session.getAttribute("login");
         List<BookingHistory> bookings = new BookingContext().getBookingByUsername(u.getUsername());
      %>
      <div class="container">
         <table class="table table-hover">
            <thead>
               <tr>
                  <th>Flight name</th>
                  <th>Airline name</th>
                  <th>Route</th>
                  <th>Booking date</th>
                  <th>Departure date</th>
                  <th>Arrival date</th>
                  <th>Total price</th>
                  <th>Class</th>
                  <th></th>
               </tr>
            </thead>
            <tbody>
               <%
                  for (BookingHistory b : bookings) {
               %>
               <tr>
                  <td><%=b.getFlightName()%></td>
                  <td><%=b.getAirlineName()%></td>
                  <td><%=b.getRounte()%></td>
                  <td><%=b.getBookingDate()%></td>
                  <td><%=b.getDepartureDate()%></td>
                  <td><%=b.getArrivalDate()%></td>
                  <td><%=b.getPrice()%></td>
                  <td><%=b.getClassType()%></td>
                  <td>
                     <%
                        if (b.isBookingClose()) {
                     %>
                     <strong>Booking Closed</strong>
                     <%
                     } else {
                     %>
                     <a href="BookingController?action=cancel&id=<%=b.getBookingID()%>" class="btn btn-danger btn-sm">Cancel this booking</a>
                     <%}%>
                  </td>
               </tr>
               <%}%>
            </tbody>
         </table>
      </div>
   </body>
</html>
