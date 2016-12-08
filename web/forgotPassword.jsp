<%-- 
    Document   : forgotPassword
    Created on : Dec 8, 2016, 11:07:30 AM
    Author     : SoN-TunG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Forgot password</title>
      <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="css/headerStyle.css" rel="stylesheet" type="text/css"/>
      <link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>

   </head>
   <body>
      <div id="wrapper">
         <%@include file="header.jsp" %>
         <div id="content">
            <h3 class="text-primary">Enter your Email and we will send you new password</h3>
            <fieldset>
               <legend></legend>
               <form action="LoginController" class="form-horizontal">
                  <div class="form-group">
                     <label class="col-xs-3 control-label">Email</label>
                     <div class="col-xs-5">
                        <input type="email" class="form-control" name="email" />
                     </div>
                  </div>
                  <div class="form-group">
                     <label class="col-xs-3 control-label">Confirm Email</label>
                     <div class="col-xs-5">
                        <input type="email" class="form-control" name="confirm" />
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-xs-9 col-xs-offset-3">
                        <button type="submit" class="btn btn-primary" name="action" value="forgot">Send</button>
                     </div>
                  </div>
               </form>
            </fieldset>
         </div>
         <%@include file="footer.jsp" %>
      </div>
   </body>
</html>
