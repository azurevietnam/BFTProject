<%-- 
    Document   : adminAddFlight
    Created on : Dec 7, 2016, 12:18:57 AM
    Author     : QuynhNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>F-Air - Users</title>
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/datepicker3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!--Icons-->
        <script src="js/lumino.glyphs.js"></script>
        <link href="css/bootstrapValidator.min.css" rel="stylesheet"/>
        <script src="js/jquery.min_2.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrapValidator.min.js"></script>      
        <script src="js/addFlightValidator.js"></script>

    </head>
    <body>
        <%
            String pageRedirect = "";
            if (session.getAttribute("login") == null) {
                pageRedirect = "login.jsp";
                session.setAttribute("loginError", "You need login first");
            } else {

                %>
        <%@include file="adminHeader.jsp" %>
        <%@include file="adminLeftSide.jsp" %>

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="adminFlight.jsp">
                            <svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> FLIGHT</a></li>
                    <li class="active">ADD FLIGHT</li>
                </ol>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Informations of FLIGHT</div>
                        <div class="panel-body">

                            <div class="col-md-8">

                                <form action="FlightController" class="form-horizontal" id="add_flight_form" method="POST">
                                    <!--first name-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Flight name</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="flightName" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--last name-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Airline name</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="airlineName" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--username-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">From Location</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="fromLocation" value=""/>

                                            </div>
                                        </div>
                                    </div>
                                    <!--password-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">To Location</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="toLocation" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--comfirm password-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Departure time</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <input class="form-control" type="time" name="departure" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--email-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Arrival time</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <input class="form-control" type="time" name="arrival" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">First class seats</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="fSeat" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Business class seats</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="bSeat" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Economy class seats</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="eSeat" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Add-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label"></label>
                                        <div class="col-md-8">
                                            <button type="submit" name="action" value="Add" class="btn btn-warning"><span class="fa fa-plane"></span> Add</button>
                                        </div>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div><!-- /.col-->
                </div><!-- /.row -->

            </div><!--/.main-->
            <%            }
                if (!pageRedirect.isEmpty()) {
                    response.sendRedirect(pageRedirect);
                }
            %>
    </body>
</html>
