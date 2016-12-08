<%-- 
    Document   : passenger
    Created on : Dec 3, 2016, 1:12:08 AM
    Author     : QuynhNguyen
--%>

<%@page import="com.entities.Passenger"%>
<%@page import="java.util.List"%>
<%@page import="com.dal.PassengerContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Passenger</title>
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
                    <li><a href="adminHome.jsp"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">PASSENGER</li>
                </ol>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2>Information of Passenger</h2>
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
                            <a href="adminFlight.jsp" class="btn btn-info">
                                <span class="glyphicon glyphicon-list-alt"></span> Show all 
                            </a>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover table-bordered" >
                                <thead>
                                    <tr class="bg-primary text-uppercase">
                                        <th>Passenger ID</th>
                                        <th>Booking ID</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Gender</th>
                                        <th>Country</th>
                                        <th>Tel.No</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>

                                <%                                    PassengerContext pc = new PassengerContext();
                                    List<Passenger> lstPassenger = pc.getAllPassenger();
                                    if (lstPassenger.size() > 0) {
                                        for (Passenger x : lstPassenger) {

                                %>
                                <tbody>
                                    <tr>
                                        <td><%=x.getPassengerID()%></td>
                                        <td><%=x.getBookingID()%></td>
                                        <td><%=x.getFirstName()%></td>
                                        <td><%=x.getLastName()%></td>
                                        <td><%=x.getGender() == 1 ? "Male" : "Female"%></td>
                                        <td><%=x.getCountry()%></td>
                                        <td><%=x.getTelNo()%></td>
                                        <td><%=x.getEmail()%></td>
                                    </tr>
                                    <%}
                                        }%>

                            </table>

                        </div>
                    </div>
                </div>
            </div><!--/.row-->	


        </div><!--/.main-->

        <% }
            if (!pageRedirect.isEmpty()) {
                response.sendRedirect(pageRedirect);
            }
        %>
    </body>
</html>
