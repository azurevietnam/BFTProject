<%-- 
    Document   : demoConfirm
    Created on : Dec 6, 2016, 11:59:19 PM
    Author     : QuynhNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-confirmation.js"></script>
    <body>
        <button class="btn btn-default" data-toggle="confirmation">Confirmation</button>
        <a class="btn btn-large btn-primary" data-toggle="confirmation" data-title="Open Google?"
           href="https://google.com" target="_blank">Confirmation</a>
    </body>
</html>
