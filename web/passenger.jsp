<%-- 
    Document   : passenger
    Created on : Dec 4, 2016, 5:01:11 PM
    Author     : SoN-TunG
--%>

<%@page import="com.dal.FlightDetailContext"%>
<%@page import="com.entities.SearchInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
      <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
   </head>
   <body>
      <%
         SearchInfo info = (SearchInfo) session.getAttribute("info");
         if (info == null) {
            response.sendRedirect("searchFlight.jsp");
         }
         int adults = (int) session.getAttribute("adults");
         int children = (int) session.getAttribute("children");
         int infants = (int) session.getAttribute("infants");
         int classType = 5;//index of first class in database
         if (info.getBusinessBook() > 0) {
            classType = 6;//index of business in database
         } else if (info.getEconomyBook() > 0) {
            classType = 7;//index of economy in database
         }
         String id = request.getParameter("id");
         double price = new FlightDetailContext().getPrice(id, classType);
         double total = price * adults + price * children * 0.75 + price * infants * 0.1;
         int passNum = 1;
      %>
      <div class="container">
         <div class="row">
            <div class="col-md-9">
               <form action="BookingController" method="GET">
                  <%                     for (int i = 1; i <= adults + children + infants; i++) {
                  %>
                  <fieldset>
                     <legend>PASSENGER <%=passNum++%></legend>
                     <p>First name <input type="text" name="<%="firstName" + i%>" value="" /></p>
                     <p>Last name <input type="text" name="<%="lastName" + i%>" value="" /></p>
                     <p>Gender 
                        <input type="radio" name="<%="gender" + i%>" value="1"/> Male
                        <input type="radio" name="<%="gender" + i%>" value="0"/> Female
                     </p>
                     <p>Country <input type="text" name="<%="country" + i%>" value="" /></p>
                  </fieldset>
                  <hr>
                  <%}%>
                  <fieldset>
                     <legend>Contact details</legend>
                     <p>Phone number <input type="text" name="telNo" value="" /></p>
                     <p>Email <input type="email" name="email" value="" /></p>
                  </fieldset>
                  <input class="hidden" type="text" name="id" value="<%=request.getParameter("id")%>" />
                  <input class="hidden" type="text" name="total" value="<%=total%>" />
                  <button name="action" value="add" type="submit">Submit</button>
               </form>
            </div>
            <div class="col-md-3">

               <p>Detail cart</p>
               <p>Adults : <%=adults + " - " + price * adults%> </p>
               <p>Children : <%=children + " - " + price * children * 0.75%></p>
               <p>Infants: <%=infants + " - " + price * infants * 0.1%></p>
               <hr>
               <p>Total price: <%=price * adults + price * children * 0.75 + price * infants * 0.1%></p>
            </div>
         </div>
      </div>
   </body>
</html>
