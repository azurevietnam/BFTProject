<%-- 
    Document   : searchFlight
    Created on : Dec 3, 2016, 11:24:35 AM
    Author     : SoN-TunG
--%>

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
      <link href="css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
      <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
      <link href="css/searchFlight.css" rel="stylesheet" type="text/css"/>
      <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Lobster" />
      <script src="js/jquery-ui.min.js" type="text/javascript"></script>
      <script src="js/autocomplete-search.js" type="text/javascript"></script>
      <script src="js/jquery.min_2.js" type="text/javascript"></script>
      <script src="js/bootstrap.min.js" type="text/javascript"></script>
      <script src="js/bootstrapValidator.min.js" type="text/javascript"></script>
      <script src="js/searchFlightValidation.js" type="text/javascript"></script>

   </head>
   <body>
      <div class="container img-background">
         <div class="col-md-10 col-md-offset-1 opacity-img-bg">
            <form action="FlightController" id="search_flight" class="form-horizontal">

               <div class="form-group">
                  <label class="col-md-2 control-label">From</label>
                  <div class="col-md-4">
                     <input type="text" class="form-control" name="fromLocation" id="from_location"/>
                  </div>
                  <label class="col-md-2 control-label">To</label>
                  <div class="col-md-4">
                     <input type="text" class="form-control" name="toLocation" id="to_location"/>
                  </div>
               </div>

               <div class="form-group">
                  <label class="col-md-2 control-label">Departure date</label>
                  <div class="col-md-4">
                     <input type="date" class="form-control" name="departureDate"/>
                  </div>
                  <label class="col-md-2 control-label">Class</label>
                  <div class="col-md-4 selectContainer">
                     <select name="class" class="form-control">
                        <option value="firstClass">First Class</option>
                        <option value="business">Business</option>
                        <option value="economy">Economy</option>
                     </select>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-md-2 control-label">Adults</label>
                  <div class="col-md-2 selectContainer">
                     <select name="adults" class="form-control" >
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                     </select>
                  </div>
                  <label class="col-md-2 control-label child-lable">Children<br>Under 12</label>
                  <div class="col-md-2 selectContainer">
                     <select name="children" class="form-control">
                        <option value="0">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                     </select>
                  </div>
                  <label class="col-md-2 control-label child-lable">Infants<br>Under 2</label>
                  <div class="col-md-2 selectContainer">
                     <select name="infants" class="form-control">
                        <option value="0">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                     </select>
                  </div>
               </div>
               
               <div class="col-md-4 col-md-offset-4" >
                  <button class="btn btn-success btn-block btn-lg" type="submit" name="btnSearch" value="Search">
                     <span class="glyphicon glyphicon-search"></span> Search flights
                  </button>
               </div>
               
            </form>
         </div>
         <% List<SearchResult> results = (List<SearchResult>) session.getAttribute("results");
            SearchInfo info = (SearchInfo) session.getAttribute("info");
            if (results != null) {
               if (session.getAttribute("bookingStatus") != null) {
         %>
         <p style="color: red"><%=session.getAttribute("bookingStatus")%></p>
         <%}%>
         <table border="1" cellspacing="0">
            <tr>
               <th>Flight</th>
               <th>Airline</th>
               <th>From</th>
               <th>To</th>
               <th>Departure time</th>
               <th>Arrival time</th>
               <th>Price</th>
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
               <td><%=r.getPrice()%> </td>
               <td>
                  <%
                     if (r.isAvailable()) {
                  %>
                  <a href="passenger.jsp?id=<%=r.getDetailID()%>" class="btn btn-success">Continue</a>
                  <%
                  } else {
                  %>
                  <strong>Out of tickets</strong> 
                  <%}%>
               </td>
            </tr>
            <%}%>
         </table>
         <%}%>

      </div>
   </body>
</html>
