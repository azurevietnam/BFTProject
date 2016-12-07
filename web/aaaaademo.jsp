<%-- 
    Document   : aaaaademo
    Created on : Dec 7, 2016, 11:56:22 PM
    Author     : SoN-TunG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
      <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="css/historyBooking.css" rel="stylesheet" type="text/css"/>
      
      <script src="js/jquery.min_2.js" type="text/javascript"></script>
      <script src="js/bootstrap.min.js" type="text/javascript"></script>
      
   </head>
   <body>
      <div class="container">
         <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

         <!-- Modal -->
         <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">Confirm Cancel Booking</h4>
                  </div>
                  <div class="modal-body">
                     <p>You sure want to cancel your booking flight?</p>
                  </div>
                  <div class="modal-footer">
                     <a href="index.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Cancel your booking</a>
                     <button type="button" class="btn btn-default" data-dismiss="modal">
                        Exit <span class="glyphicon glyphicon-log-out"></span>
                     </button>
                  </div>
               </div>

            </div>
         </div>
      </div>
   </body>
</html>
