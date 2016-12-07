<%-- 
    Document   : adminFlight
    Created on : Dec 3, 2016, 10:48:14 PM
    Author     : QuynhNguyen
--%>

<%@page import="com.entities.FlightDetail"%>
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
                            <h2>Flight Detail Table</h2>
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
                                        <th>Detail ID</th>
                                        <th>Flight ID</th>
                                        <th>Departure date</th>
                                        <th>Arrival date</th>
                                        <th>First price</th>
                                        <th>Business price</th>
                                        <th>Economy price</th>
                                        <th>Avai First Seats</th>
                                        <th>Avai Business Seats</th>
                                        <th>Avai Economy Seats</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  List<FlightDetail> lstFlightDetails = (List<FlightDetail>) session.getAttribute("listFlightDetail");
                                        if (lstFlightDetails.size() > 0) {
                                            for (FlightDetail f : lstFlightDetails) {
                                    %>

                                    <tr>
                                        <td><a href="#"><%=f.getDetailID()%></a></td>
                                        <td><%=f.getFlightID()%></td>
                                        <td><%=f.getDepartureDate()%></td>
                                        <td><%=f.getArrivalDate()%></td>
                                        <td><%=String.format("%.2f", f.getFirstClassPrice())%></td>
                                        <td><%=String.format("%.2f", f.getBusinessPrice())%></td>
                                        <td><%=String.format("%.2f", f.getEconomyPrice())%></td>
                                        <td><%=f.getAvailableFirstClassSeats()%></td>
                                        <td><%=f.getAvailableBusinessSeats()%></td>
                                        <td><%=f.getAvailableEconomySeats()%></td>
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

                                </tbody>

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

