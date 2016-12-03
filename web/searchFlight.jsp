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
   </head>
   <body>
      <form action="FlightController">
         <p>From <input type="text" name="fromLocation"/></p>
         <p>To <input type="text" name="toLocation"/></p>
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
         if (results != null) {
      %>
      <table border="1" cellspacing="0">
         <th>Flight</th>
         <th>Airline</th>
         <th>From</th>
         <th>To</th>
         <th>Departure time</th>
         <th>Arrival time</th>
         <th>Price</th>
            <%
               for (int i = 0; i < results.size(); i++) {
                  SearchResult r = results.get(i);
            %>
         <tr>
            <td><%=r.getFlightName()%> </td>
            <td><%=r.getAirlineName()%> </td>
            <td><%=r.getFromLocation()%> </td>
            <td><%=r.getToLocation()%> </td>
            <td><%=r.getDepartureTime()%> </td>
            <td><%=r.getArrivalTime()%> </td>
            <td><%=r.getPrice()%> </td>
         </tr>
         <%}%>
      </table>
      <%}
         SearchInfo info = (SearchInfo) session.getAttribute("info");

         if (info != null) {
            int adults = (int) session.getAttribute("adults");
            int children = (int) session.getAttribute("children");
            int infants = (int) session.getAttribute("infants");
      %>
      <p>Detail cart</p>
      <p>Adults : <%=adults%></p>
      <p>Children : <%=children%></p>
      <p>Infants: <%=infants%></p>

      <%
         }

      %>


   </body>
</html>
