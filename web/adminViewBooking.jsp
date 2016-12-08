<%-- 
    Document   : adminViewBooking
    Created on : Dec 5, 2016, 9:38:21 PM
    Author     : QuynhNguyen
--%>

<%@page import="com.dal.BookingContext"%>
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

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.min_2.js"></script>
        <link href="css/datepicker3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!--Icons-->
        <script src="js/lumino.glyphs.js"></script>
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
        <%@include file="adminHeader.jsp" %>
        <%@include file="adminLeftSide.jsp" %>

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">	

            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="adminUsers.jsp">
                            <svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> USERS</a></li>
                    <li class="active">VIEW BOOKING DETAIL</li>
                </ol>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2>Booking</h2>

                            <%  if (session.getAttribute("count") != null) {
                                    int count = (int) session.getAttribute("count");
                                    session.removeAttribute("count");
                            %>
                            <strong class="alert alert-success"><%=count%> booking status has been updated.</strong> 
                            <%}%>
                        </div>
                        <form action="adminViewBooking.jsp" method="POST" role="search">
                            <br />
                            <div class="form-group col-md-3 col-md-offset-4">
                                <input type="text" name="txtSearch" required="" class="form-control" placeholder="Search by Booking ID">
                            </div>
                            <div class="form-group col-md-1">
                                <button type="submit" name="btnSearch" class="btn btn-info" >
                                    <span class="glyphicon glyphicon-search"></span> Search
                                </button>
                            </div>
                        </form>

                        <div class="form-group col-md-1">
                            <a href="adminViewBooking.jsp" class="btn btn-info">
                                <span class="glyphicon glyphicon-list-alt"></span> Show all 
                            </a>
                        </div>
                        <div class="form-group col-md-1">
                            <a href="BookingController?action=updateStatus" class="btn btn-warning">
                                <span class="glyphicon glyphicon-edit"></span> Update Booking Status 
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
                                <%                                    String error = "";
                                    if (request.getParameter("btnSearch") != null) {
                                        String bookingID = request.getParameter("txtSearch");
                                        BookingHistory bh = new BookingContext().getBookingByID(bookingID);
                                        if (bh != null) {
                                %>
                                <tbody>
                                    <tr>
                                        <td><%=bh.getBookingID()%></td>
                                        <td><%=bh.getFlightName()%></td>
                                        <td><%=bh.getAirlineName()%></td>
                                        <td><%=bh.getRoute()%></td>
                                        <td><%=bh.isBookingClose() ? "Yes" : "No"%></td>
                                        <td><%=bh.getBookingDate()%></td>
                                        <td><%=bh.getClassType()%></td>
                                        <td><%=bh.getPrice()%></td>
                                        <td><%=bh.getDepartureDate()%></td>
                                        <td><%=bh.getArrivalDate()%></td>
                                        <td>
                                            <a href="#" class="btn btn-xs btn-primary">
                                                <span class="glyphicon glyphicon-edit"></span> Edit
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>

                                <%
                                    } else {
                                        error = "Not found Booking by Booking ID = " + bookingID;
                                    }
                                } else {
                                    List<BookingHistory> lst = (List<BookingHistory>) session.getAttribute("lstBooking");
                                    if (lst.size() > 0) {
                                        for (BookingHistory x : lst) {
                                %>
                                <tbody>
                                    <tr>
                                        <td><%=x.getBookingID()%></td>
                                        <td><%=x.getFlightName()%></td>
                                        <td><%=x.getAirlineName()%></td>
                                        <td><%=x.getRoute()%></td>
                                        <td><%=x.isBookingClose() ? "Yes" : "No"%></td>
                                        <td><%=x.getBookingDate()%></td>
                                        <td><%=x.getClassType()%></td>
                                        <td><%=x.getPrice()%></td>
                                        <td><%=x.getDepartureDate()%></td>
                                        <td><%=x.getArrivalDate()%></td>
                                        <td>
                                            <a href="#" class="btn btn-xs btn-primary">
                                                <span class="glyphicon glyphicon-edit"></span> Edit
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>

                                <%  }
                                        } else {
                                            error = "Not found Booking";
                                        }
                                    }%>
                            </table>
                            <%
                                if (!error.isEmpty()) {
                            %>
                            <strong class="alert alert-danger"><%=error%></strong>
                            <%}%>

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
