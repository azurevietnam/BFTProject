<%-- 
    Document   : searchFlight
    Created on : Dec 3, 2016, 11:24:35 AM
    Author     : SoN-TunG
--%>

<%@page import="com.entities.User"%>
<%@page import="com.entities.SearchInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.SearchResult"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
      <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="css/searchFlight.css" rel="stylesheet" type="text/css"/>
      <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Lobster" />

      <script src="js/bootstrap.min.js" type="text/javascript"></script>

   </head>
   <body>
      <%
         String pageRedirect = "";

         if (session.getAttribute("results") == null) {
            pageRedirect = "index.jsp";
         } else {
            List<SearchResult> results = (List<SearchResult>) session.getAttribute("results");
            SearchInfo info = (SearchInfo) session.getAttribute("info");

      %>

      <div class="container">
         <div class="row search-info">
            <a href="index.jsp">
               <h3 class="col-md-3"><%=info.getFromLocation()%></h3>
               <h3 class="col-md-1"><span class="glyphicon glyphicon-arrow-right"></span></h3>
               <h3 class="col-md-3"><%=info.getToLocation()%></h3>
               <h3 class="col-md-3"><%=info.getDepartureDate()%> </h3>
               <h3 class="col-md-2"><span class="glyphicon glyphicon-pencil"></span> Modify search</h3>
            </a>
         </div>
         <hr>
         <%if (results != null) {
               if (session.getAttribute("bookingStatus") != null) {
         %>
         <p style="color: red"><%=session.getAttribute("bookingStatus")%></p>
         <%}%>
         <div class="well">
            <%
               if (results.size() == 0) {
            %>
            <div class="alert alert-warning">
               <h3 class="text-danger"><strong>No flight found!</strong></h3> <br>
               <h4> We can not found any flights . Let try later or choose other day.</h4>
            </div>
            <%
            } else {
            %>
            <table class="table table-bordered">
               <tr class="bg-primary">
                  <th>Flight</th>
                  <th>Airline</th>
                  <th>From</th>
                  <th>To</th>
                  <th>Departure time</th>
                  <th>Arrival time</th>
                  <th>Price (VND)</th>
                  <th>Book</th>
               </tr>
               <%            for (int i = 0; i < results.size(); i++) {
                     SearchResult r = results.get(i);
               %>
               <tr>
                  <td><%=r.getFlightName()%> </td>
                  <td><%=r.getAirlineName()%> </td>
                  <td><%=info.getFromLocation()%> </td>
                  <td><%=info.getToLocation()%> </td>
                  <td><%=r.getDepartureTime()%> </td>
                  <td><%=r.getArrivalTime()%> </td>
                  <td><%=String.format("%1$,.0f", r.getPrice())%> </td>
                  <td>
                     <%
                        if (r.isAvailable()) {
                     %>
                     <a href="passenger.jsp?id=<%=r.getDetailID()%>" class="btn btn-success">Continue Booking</a>
                     <%
                     } else {
                     %>
                     <strong>Out of tickets</strong> 
                     <%}%>
                  </td>
               </tr>
               <%}%>
            </table>
            <%
               }
            %>
         </div>
         <%}
            }

            if (!pageRedirect.isEmpty()) {
               response.sendRedirect(pageRedirect);
            }
         %>

      </div>
   </body>
</html>
