<%-- 
    Document   : index2
    Created on : Dec 7, 2016, 6:52:17 PM
    Author     : SoN-TunG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>F-AIR</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style4.css" />
        <link href="css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Lobster" />
        <link href="css/headerStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>


        <script src="js/jquery.min_2.js" type="text/javascript"></script>
        <script src="js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/bootstrapValidator.min.js" type="text/javascript"></script>
        <script src="js/searchFlightValidation.js" type="text/javascript"></script>
        <script src="js/autocomplete-search.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/modernizr.custom.86080.js"></script>
    </head>
    <body id="page">
        <ul class="cb-slideshow">
            <li><span>Image 01</span><div><h3>relaxation</h3></div></li>
            <li><span>Image 02</span><div><h3>convenient</h3></div></li>
            <li><span>Image 03</span><div><h3>adventure</h3></div></li>
            <li><span>Image 04</span><div><h3>cheap</h3></div></li>
            <li><span>Image 05</span><div><h3>security</h3></div></li>
            <li><span>Image 06</span><div><h3>F-AIR</h3></div></li>
        </ul>
        <%@include file="header.jsp" %>
        <div class="container2">
            <!-- Codrops top bar -->
            <div class="container img-background">
                <div class="col-md-10 col-md-offset-1 opacity-img-bg">
                    <h1 class="text-center title-web">F-AIR</h1>
                    <h2 class="text-center">Smart search</h2>
                    <hr>
                    <form action="FlightController" id="search_flight" class="form-horizontal">

                        <div class="form-group">
                            <label class="col-md-2 control-label">From</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="fromLocation" id="from_location"/>
                            </div>
                            <label class="col-md-2 control-label">To</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="toLocation" id="to_location"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">Departure date</label>
                            <div class="col-md-4">
                                <input type="date" class="form-control" name="departureDate"/>
                            </div>
                            <label class="col-md-2 control-label">Class</label>
                            <div class="col-md-4 selectContainer">
                                <select name="class" class="form-control">
                                    <option value="firstClass">First Class</option>
                                    <option value="business">Business</option>
                                    <option value="economy">Economy</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Adults</label>
                            <div class="col-md-2 selectContainer">
                                <select name="adults" class="form-control" >
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                </select>
                            </div>
                            <label class="col-md-2 control-label child-lable">Children<br>Under 12</label>
                            <div class="col-md-2 selectContainer">
                                <select name="children" class="form-control">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                            <label class="col-md-2 control-label child-lable">Infants<br>Under 2</label>
                            <div class="col-md-2 selectContainer">
                                <select name="infants" class="form-control">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-4 col-md-offset-4" >
                            <button class="btn btn-success btn-block btn-lg" type="submit" name="action" value="Search">
                                <span class="glyphicon glyphicon-search"></span> Search flights
                            </button>
                        </div>

                    </form>
                </div>
            </div>
    </body>
</html>
