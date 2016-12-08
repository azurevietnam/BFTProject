<%-- 
    Document   : adminViewBooking
    Created on : Dec 5, 2016, 9:38:21 PM
    Author     : QuynhNguyen
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="com.entities.BookingHistory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.min_2.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap-confirmation.js"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            String pageRedirect = "";
            if (session.getAttribute("login") == null) {
                pageRedirect = "login.jsp";
                session.setAttribute("loginError", "You need login first");
            } else {

        %>
        <!--CONTENT-->

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">	

            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="adminFlight.jsp"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">FLIGHT</li>
                </ol>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2>Booking</h2>
                        </div>
                        <form action="adminFlight.jsp" method="POST" role="search">
                            <br />
                            <div class="form-group col-md-3 col-md-offset-5">
                                <input type="text" name="txtSearch" required="" class="form-control" placeholder="Search by Airline Name">
                            </div>
                            <div class="form-group col-md-1">
                                <button type="submit" name="btnSearch" class="btn btn-info" >
                                    <span class="glyphicon glyphicon-search"></span> Search
                                </button>
                            </div>
                        </form>
                        <div class="form-group col-md-1">
                            <a href="adminAddFlight.jsp" class="btn btn-info">
                                <span class="glyphicon glyphicon-plus-sign"></span> Add 
                            </a>
                        </div>
                        <div class="form-group col-md-1">
                            <a href="adminFlight.jsp" class="btn btn-info">
                                <span class="glyphicon glyphicon-list-alt"></span> Show all 
                            </a>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover table-bordered" >
                                <thead>
                                    <tr class="bg-primary text-uppercase">
                                        <th>Booking ID</th>
                                        <th>Flight Name</th>
                                        <th>Airline Name</th>
                                        <th>Route</th>
                                        <th>Booking Close</th>
                                        <th>Booking Date</th>
                                        <th>Class Type</th>
                                        <th>Price</th>
                                        <th>Departure Date</th>
                                        <th>Arrival Date</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <%                                    
                                    List<BookingHistory> lst = (LinkedList<BookingHistory>) request.getAttribute("lstBooking");
                                    if (lst.size() > 0) {
                                        for (BookingHistory x : lst) {

                                %>
                                <tbody>
                                    <tr>
                                        <td><%=x.getBookingID()%></td>
                                        <td><%=x.getFlightName()%></td>
                                        <td><%=x.getAirlineName()%></td>
                                        <td><%=x.getRoute()%></td>
                                        <td><%=x.isBookingClose()%></td>
                                        <td><%=x.getBookingDate()%></td>
                                        <td><%=x.getClassType()%></td>
                                        <td><%=x.getPrice()%></td>
                                        <td><%=x.getDepartureDate()%></td>
                                        <td><%=x.getArrivalDate()%></td>
                                        <td>
                                            <a href="#" class="btn btn-xs btn-primary">
                                                <span class="glyphicon glyphicon-edit"></span> Edit
                                            </a>
                                            <a href="#" class="btn btn-xs btn-warning">
                                                <span class="glyphicon glyphicon-remove"></span> Delete
                                            </a> 

                                        </td>
                                    </tr>

                                    <%  }
                                        }%>




                            </table>

                        </div>
                    </div>
                </div>
            </div><!--/.row-->	


        </div><!--/.main-->

        <%            }

            if (!pageRedirect.isEmpty()) {
                response.sendRedirect(pageRedirect);
            }
        %>
    </body>
</html>
