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

      <link href="css/historyBooking.css" rel="stylesheet" type="text/css"/>

      <script src="js/jquery.min_2.js" type="text/javascript"></script>
      <script src="js/bootstrap.min.js" type="text/javascript"></script>
   </head>
   <body>
      <%
         String pageRedirect = "";
         if (session.getAttribute("login") == null) {
            pageRedirect = "login.jsp";
            session.setAttribute("loginError", "You need login first");
         } else {

            User u = (User) session.getAttribute("login");
            List<BookingHistory> bookings = new BookingContext().getBookingByUsername(u.getUsername());
      %>
      <%@include file="header.jsp" %>
      <div class="container">
         <%
            if (session.getAttribute("bookingStatus") != null) {
               String type = "alert-success";
               String status = (String) session.getAttribute("bookingStatus");
               if (status.startsWith("Y")) {
                  type = "alert-danger";
               }
         %>
         <div class="col-md-4 col-md-offset-4">
            <div class="alert alert-success alert-dismissible ">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <strong></strong>
            </div>
         </div>
         <%
            }
         %>


         <table class="table table-hover">
            <thead class="bg-primary">
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
                  <td><%=b.getRoute()%></td>
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
                     <button onclick="changelink('BookingController?action=cancel&id=<%=b.getBookingID()%>')" 
                             type="button" class="btn btn-danger btn-smc" data-toggle="modal" data-target="#myModal">
                        Cancel this booking
                     </button>
                     <%}%>
                  </td>
                  <td>

                  </td>
               </tr>
               <%}%>
            </tbody>
         </table>
         <!-- Modal -->
         <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">Confirm Cancel Booking</h4>
                  </div>
                  <div class="modal-body">
                     <p>You sure want to cancel your booking flight?</p>
                  </div>
                  <div class="modal-footer">
                     <a id="cancel_link" href="#" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Cancel your booking</a>
                     <button type="button" class="btn btn-default" data-dismiss="modal">
                        Exit <span class="glyphicon glyphicon-log-out"></span>
                     </button>
                  </div>
               </div>

            </div>
         </div>
      </div>
      <script type="text/javascript">
         function changelink(link) {
            document.getElementById("cancel_link").href = link;
         }
      </script>
      <%
         }
         if (!pageRedirect.isEmpty()) {
            response.sendRedirect(pageRedirect);
         }
      %>
   </body>
</html>
