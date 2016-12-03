<%-- 
    Document   : addFlight
    Created on : Dec 2, 2016, 11:16:02 PM
    Author     : QuynhNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="FlightController" method="POST">
            <table border="0">
                <tr>
                    <td>Flight Name</td>
                    <td><input type="text" name="flightName" value="" /></td>
                </tr>
                <tr>
                    <td>Airline Name</td>
                    <td><input type="text" name="airlineName" value="" /></td>
                </tr>
                <tr>
                    <td>From location</td>
                    <td><input type="text" name="fromLocation" value="" /></td>
                </tr>
                <tr>
                    <td>To location</td>
                    <td><input type="text" name="toLocation" value="" /></td>
                </tr>
                <tr>
                    <td>Departure</td>
                    <td><input type="time" name="departure" value="" /></td>
                </tr>
                <tr>
                    <td>Arrival</td>
                    <td><input type="time" name="arrival" value="" /></td>
                </tr>
                <tr>
                    <td>First class seats</td>
                    <td><input type="text" name="fSeat" value="" /></td>
                </tr>
                <tr>
                    <td>Business seats</td>
                    <td><input type="text" name="bSeat" value="" /></td>
                </tr>
                <tr>
                    <td>Economy seats</td>
                    <td><input type="text" name="eSeat" value="" /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="btnAdd" value="Add Flight" /></td>
                </tr>
            </table>
        </form>

    </body>
</html>
