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
      <link href="css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>

      <script src="js/jquery.min_2.js" type="text/javascript"></script>
      <script src="js/bootstrap.min.js" type="text/javascript"></script>
      <script src="js/bootstrapValidator.min.js" type="text/javascript"></script>
      <script src="js/register.js" type="text/javascript"></script>
   </head>
   <body>
      <div id="wrapper">
         <%@include file="header.jsp" %>
         <div id="content">
            <div>
               <!--avasdadsf-->
               <fieldset>
                  <h3 class="text-primary">Forgot your password?</h3>
                  <p>Enter your email address and we'll help you reset your password.</p>
                  <hr>
                  <legend></legend>
                  <form action="LoginController" class="form-horizontal" id="forgot_password">
                     <div class="form-group">
                        <label class="col-xs-4 control-label">Email</label>
                        <div class="col-xs-4">
                           <input type="email" class="form-control" name="email" />
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-xs-4 control-label">Confirm Email</label>
                        <div class="col-xs-4">
                           <input type="text" class="form-control" name="confirmEmail" />
                        </div>
                     </div>
                     <!--Captcha-->
                     <div class="form-group">
                        <label class="col-xs-4 control-label" id="captchaOperation"></label>
                        <div class="col-xs-4">
                           <input type="text" class="form-control" name="captcha" />
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-xs-6 col-xs-offset-5">
                           <button type="submit" class="btn btn-primary" name="action" value="forgot">Send</button>
                        </div>
                     </div>
                  </form>
               </fieldset>
            </div>
         </div>
         <%@include file="footer.jsp" %>
      </div>
   </body>
</html>
