<%-- 
    Document   : adminFlight
    Created on : Dec 3, 2016, 10:48:14 PM
    Author     : QuynhNguyen
--%>

<%@page import="com.dal.FlightContext"%>
<%@page import="com.entities.Flight"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>F-Air - Users</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/datepicker3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <!--Icons-->
        <script src="js/lumino.glyphs.js"></script>
    </head>
    <body>
        <%@include file="adminHeader.jsp" %>
        <%@include file="adminLeftSide.jsp" %>
        <!--Content-->

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
                            <h2>Flight Table</h2>
                        </div>
                        <form action="adminFlight.jsp" method="POST" role="search" onsubmit="return valid();">
                            <br />
                            <div class="form-group col-md-3 col-md-offset-5">
                                <input type="text" name="txtSearch" class="form-control" placeholder="Search by Airline Name">
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
                                        <th>Flight ID</th>
                                        <th>Flight Name</th>
                                        <th>Airline Name</th>
                                        <th>From Location</th>
                                        <th>To Location</th>
                                        <th>Departure Time</th>
                                        <th>Arrival Time</th>
                                        <th>First</th>
                                        <th>Business</th>
                                        <th>Economy</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <%                                    String p = request.getParameter("p");
                                    FlightContext fc = null;
                                    fc = new FlightContext();
                                    //total row count

                                    int pageSize = 20; //20 rows per page
                                    int u = 1, v = pageSize;
                                    if (p != null) {
                                        int x = Integer.parseInt(p);
                                        u = (x - 1) * pageSize + 1;
                                        v = x * pageSize;
                                    }
                                    if (request.getParameter("btnSearch") == null) {
                                        int totalRow = fc.getRowCount();
                                        int totalPage = (int) Math.ceil((totalRow * 1.0) / pageSize);
                                        List<Flight> lstFlights = fc.getAllFlight(u, v, "");
                                        if (lstFlights.size() > 0) {
                                            for (Flight f : lstFlights) {
                                %>
                                <tbody>
                                    <tr>
                                        <td><a href="FlightController?action=showFlightDetail&flightID=<%=f.getFlightID()%>"><%=f.getFlightID()%></a></td>
                                        <td><%=f.getFlightName()%></td>
                                        <td><%=f.getAirlineName()%></td>
                                        <td><%=f.getFromLocation()%></td>
                                        <td><%=f.getToLocation()%></td>
                                        <td><%=f.getDepartureTime()%></td>
                                        <td><%=f.getArrivalTime()%></td>
                                        <td><%=f.getFirstClassSeats()%></td>
                                        <td><%=f.getBusinessSeats()%></td>
                                        <td><%=f.getEconomySeats()%></td>
                                        <td>
                                            <a href="FlightController?action=edit&flightID=<%=f.getFlightID()%>" class="btn btn-xs btn-primary">
                                                <span class="glyphicon glyphicon-edit"></span> Edit
                                            </a>
                                            <a href="FlightController?action=delete&flightID=<%=f.getFlightID()%>" class="btn btn-xs btn-warning">
                                                <span class="glyphicon glyphicon-remove"></span> Delete
                                            </a>
                                        </td>
                                    </tr>

                                    <%  }%>
                                    <tr>
                                        <td colspan="11">
                                            <ul class="pagination">
                                                <%    // previous button
                                                    int previous = Integer.parseInt(p != null ? p : "0") - 1;
                                                    previous = (previous < 1) ? 1 : previous;
                                                %>
                                                <li>
                                                    <a class="page-link" href="adminFlight.jsp?p=<%=previous%>" aria-label="Next">
                                                        <span aria-hidden="true">Previous</span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                </li>
                                                <% for (int i = 1; i <= totalPage; i++) {%>
                                                <li><a href="adminFlight.jsp?p=<%=i%>"><%=i%></a></li>
                                                    <% }
                                                        // Next button
                                                        int next = Integer.parseInt(p != null ? p : "0") + 1;
                                                        next = (next > totalPage) ? totalPage : next;
                                                    %>
                                                <li>
                                                    <a class="page-link" href="adminFlight.jsp?p=<%=next%>" aria-label="Next">
                                                        <span aria-hidden="true">Next</span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                                <%
                                    }
                                } else {
                                    String airlineName = request.getParameter("txtSearch");
                                    List<Flight> lstFlights = fc.searchFlight(airlineName);
                                    if (lstFlights.size() > 0) {
                                        for (Flight f : lstFlights) {

                                %>
                                <tbody>
                                    <tr>
                                        <td><%=f.getFlightID()%></td>
                                        <td><%=f.getFlightName()%></td>
                                        <td><%=f.getAirlineName()%></td>
                                        <td><%=f.getFromLocation()%></td>
                                        <td><%=f.getToLocation()%></td>
                                        <td><%=f.getDepartureTime()%></td>
                                        <td><%=f.getArrivalTime()%></td>
                                        <td><%=f.getFirstClassSeats()%></td>
                                        <td><%=f.getBusinessSeats()%></td>
                                        <td><%=f.getEconomySeats()%></td>
                                        <td>
                                            <a href="FlightController?action=edit&flightID=<%=f.getFlightID()%>" class="btn btn-xs btn-primary">
                                                <span class="glyphicon glyphicon-edit"></span> Edit
                                            </a>
                                            <a href="FlightController?action=delete&flightID=<%=f.getFlightID()%>" class="btn btn-xs btn-warning">
                                                <span class="glyphicon glyphicon-remove"></span> Delete
                                            </a>
                                        </td>
                                    </tr>


                                    <%}%>
                                </tbody>
                                <%
                                } else {
                                %>

                                <div class="alert alert-danger col-md-3">
                                    <strong>Not found!</strong> Flight by airlineName = <%=airlineName%>
                                </div>
                                <%
                                        }

                                    }
                                %>


                            </table>

                        </div>
                    </div>
                </div>
            </div><!--/.row-->	


        </div><!--/.main-->

        <script type="text/javascript">
            function valid() {
                var search = document.getElementsByName("txtSearch")[0].value.trim();
                if (search === "") {
                    return false;
                }
                return true;
            }
        </script>


        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/chart.min.js"></script>
        <script src="js/chart-data.js"></script>
        <script src="js/easypiechart.js"></script>
        <script src="js/easypiechart-data.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/bootstrap-table.js"></script>

    </body>
</html>

