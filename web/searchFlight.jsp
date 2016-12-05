<%-- 
    Document   : searchFlight
    Created on : Dec 3, 2016, 11:24:35 AM
    Author     : SoN-TunG
--%>

<%@page import="com.entities.SearchInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.SearchResult"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
      <script src="js/jquery.min_2.js" type="text/javascript"></script>
      <script src="js/jquery-ui.min.js" type="text/javascript"></script>
      <script src="js/autocomplete-search.js" type="text/javascript"></script>
      <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
      <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

   </head>
   <body>
      <form action="FlightController">
         <p>From <input type="text" name="fromLocation" id="from_location"/></p>
         <p>To <input type="text" name="toLocation" id="to_location"/></p>
         <p>Departure date <input type="date" name="departureDate"/></p>
         <p>Adults
            <select name="adults">
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
               <option value="6">6</option>
            </select>
         </p>
         <p>Children
            <select name="children">
               <option value="0">0</option>
               <option value="1">1</option>
               <option value="2">2</option>
            </select>
         </p>
         <p>Infants
            <select name="infants">
               <option value="0">0</option>
               <option value="1">1</option>
               <option value="2">2</option>
            </select>
         </p>
         <p>Class
            <select name="class">
               <option value="firstClass">First Class</option>
               <option value="business">Business</option>
               <option value="economy">Economy</option>
            </select>
         </p>
         <p><input type="submit" name="btnSearch" value="Search"/></p>
      </form>

      <% List<SearchResult> results = (List<SearchResult>) session.getAttribute("results");
         SearchInfo info = (SearchInfo) session.getAttribute("info");
         if (results != null) {
      %>
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
         <%
            for (int i = 0; i < results.size(); i++) {
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
               <%
                  }
               %>
            </td>
         </tr>
         <%}%>
      </table>
      <%}

         if (info != null) {
            int adults = (int) session.getAttribute("adults");
            int children = (int) session.getAttribute("children");
            int infants = (int) session.getAttribute("infants");
      %>
      <p>Detail cart</p>
      <p>Adults : <%=adults%></p>
      <p>Children : <%=children%></p>
      <p>Infants: <%=infants%></p>
      <%}%>
   </body>
</html>
