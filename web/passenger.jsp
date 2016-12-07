<%@page import="java.util.List"%>
<%@page import="com.entities.SearchResult"%>
<%@page import="com.dal.FlightDetailContext"%>
<%@page import="com.entities.SearchInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" uri="/WEB-INF/tlds/my_tag" %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Passenger Information</title>
      <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="css/passenger.css" rel="stylesheet" type="text/css"/>
      <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>


      <script src="js/jquery.min_2.js" type="text/javascript"></script>
      
      
   </head>
   <body>

      <%
         String pageRedirect = "";
         if (session.getAttribute("login") == null) {
            pageRedirect = "login.jsp";
            session.setAttribute("loginError", "You need login first");
         } else {
            if (session.getAttribute("info") == null) {
               pageRedirect = "index.jsp";
            } else {

               SearchInfo info = (SearchInfo) session.getAttribute("info");
               int adults = (int) session.getAttribute("adults");
               int children = (int) session.getAttribute("children");
               int infants = (int) session.getAttribute("infants");
               int classType = 5;//index of first class in database
               String classString = "First class";
               if (info.getBusinessBook() > 0) {
                  classType = 6;//index of business in database
                  classString = "Business";
               } else if (info.getEconomyBook() > 0) {
                  classType = 7;//index of economy in database
                  classString = "Economy";
               }
               String id = request.getParameter("id");
               double price = new FlightDetailContext().getPrice(id, classType);
               double total = price * adults + price * children * 0.75 + price * infants * 0.1;

      %>
      <div class="container">
         <hr>
         <div class="row">
            <div class="col-md-9">
               <form action="BookingController" method="GET" class="form-horizontal" id="passenger_form  ">

                  <%for (int i = 1; i <= adults + children + infants; i++) {%>
                  <div class="well" >
                     <div class="passenger_header">
                        <h4 >PASSENGER <%=i%> <span class="fa fa-toggle-down"></span></h4>
                     </div>
                     <div class="hidden_content">
                        <!--First name-->
                        <div class="form-group">
                           <label class="col-md-3 control-label">First name</label>
                           <div class="col-md-5">
                              <input type="text" name="<%="firstName" + i%>" class="form-control" required/>
                           </div>
                        </div>
                        <!--Last name-->
                        <div class="form-group">
                           <label class="col-md-3 control-label">Last name</label>
                           <div class="col-md-5">
                              <input type="text" name="<%="lastName" + i%>" class="form-control" required />
                           </div>
                        </div>
                        <!--Gender-->
                        <div class="form-group">
                           <label class="col-md-3 control-label">Gender</label>
                           <span class="col-md-3"><input type="radio" name="<%="gender" + i%>" value="1" checked/> Male</span>
                           <span class="col-md-3"><input type="radio" name="<%="gender" + i%>" value="0"/> Female</span>
                        </div>
                        <!--country-->
                        <div class="form-group">
                           <label class="col-md-3 control-label">Country</label>
                           <div class="col-md-5">
                              <input type="text" name="<%="country" + i%>" class="form-control" required/>
                           </div>
                        </div>
                     </div>
                  </div>
                  <hr>
                  <%}%>
                  <div class="well">
                     <div >
                        <h3>Contact details</h3>
                     </div>
                     <!--Phone number-->
                     <div class="form-group">
                        <label class="col-md-3 control-label">Phone number</label>
                        <div class="col-md-5">
                           <input type="tel" name="telNo" class="form-control" required/>
                        </div>
                     </div>

                     <!--Email-->
                     <div class="form-group">
                        <label class="col-md-3 control-label">Email</label>
                        <div class="col-md-5">
                           <input type="email" name="email" class="form-control" required/>
                        </div>
                     </div>

                  </div>
                  <input class="hidden" type="text" name="id" value="<%=request.getParameter("id")%>" />
                  <input class="hidden" type="text" name="total" value="<%=total%>" />
                  <div class="col-md-4 col-md-offset-4">
                     <button type="submit" name="action" value="add" class="btn btn-lg btn-warning btn-block">
                        Continue <span class="glyphicon glyphicon-circle-arrow-right"></span>
                     </button>
                  </div>
               </form>
            </div>
            <div class="col-md-3 well">
               <div>
                  <button class="btn btn-primary btn-block btn-xs details_header" >
                     <h3>Flight details <span class="fa fa-toggle-right"></span></h3>
                  </button>
                  <div id="list_flight_deatils">
                     <ul class="list-group">
                        <li class="list-group-item"><strong>From</strong> : <%=info.getFromLocation()%></li>
                        <li class="list-group-item"><strong>To</strong> : <%=info.getToLocation()%></li>
                        <li class="list-group-item"><strong>Departure</strong> : <%=info.getDepartureDate()%></li>
                        <li class="list-group-item"><strong>Class</strong> : <%=classString%></li>
                     </ul>
                  </div>
               </div>
               <div>
                  <button class="btn btn-block btn-primary btn-xs title_header">
                     <h3>Cart details <span class="glyphicon glyphicon-list text-right"> </h3>
                  </button>
                  <div id="table_cart_details">
                     <table class="table table-bordered">
                        <thead>
                           <tr>
                              <th></th>
                              <th>Number of people</th>
                              <th>Price(VND)</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td><strong>Adults</strong></td>
                              <td><%=adults%></td>
                              <td><%=String.format("%1$,.0f", price * adults)%></td>
                           </tr>
                           <tr>
                              <td><strong>Children</strong></td>
                              <td><%=children%></td>
                              <td><%=String.format("%1$,.0f", price * children * 0.75)%></td>
                           </tr>
                           <tr>
                              <td><strong>Infants</strong></td>
                              <td><%=infants%></td>
                              <td><%=String.format("%1$,.0f", price * infants * 0.1)%></td>
                           </tr>
                           <tr>
                              <td><strong>Total</strong></td>
                              <td><%=adults + children + infants%></td>
                              <td><strong><%=String.format("%1$,.0f", total)%></strong></td>
                           </tr>
                        </tbody>
                     </table>
                  </div>

               </div>
            </div>
         </div>
         <hr>
      </div>
      <script type="text/javascript">
         $(document).ready(function () {
            $("#list_flight_deatils").hide();
            $(".passenger_header, .details_header").click(function () {
               $(this).next().toggle(500);
            });
         });
      </script>
      <%}
         }
         if (!pageRedirect.isEmpty()) {
            response.sendRedirect(pageRedirect);
         }
      %>
   </body>
</html>
