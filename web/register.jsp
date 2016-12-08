<%-- 
    Document   : register
    Created on : Nov 28, 2016, 9:31:56 AM
    Author     : SoN-TunG
--%>

<%@page import="com.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Register</title>
      <link href="css/bootstrap.min.css" rel="stylesheet"/>
      <link href="css/bootstrapValidator.min.css" rel="stylesheet"/>


      <script src="js/jquery.min_2.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/bootstrapValidator.min.js"></script>   
      <script src="js/reCaptcha2.min.js" type="text/javascript"></script>
      <script src="js/register.js"></script>
   </head>
   <body>
      <div class="container">
         <fieldset class="well">
            <legend><h3 class="text-primary">Create Your Cheap Air account</h3></legend>
            <%
               User user = new User();
               if (session.getAttribute("preInfo") != null) {
                  user = (User) session.getAttribute("preInfo");
               }
               if (session.getAttribute("registerError") != null) {
                  String msg = (String) session.getAttribute("registerError");
            %>
            <div class="alert alert-danger alert-dismissable fade in text-center"><%=msg%></div>
            <%}%>
            <form action="checkRegister" class="form-horizontal" id="register_form" method="POST" >
               <!--first name-->
               <div class="form-group">
                  <label class="control-label col-md-4">First name</label>
                  <div class="col-md-4">
                     <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input class="form-control" type="text" name="firstName" value="<%=user.getFirstName()%>"/>
                     </div>
                  </div>
               </div>
               <!--last name-->
               <div class="form-group">
                  <label class="control-label col-md-4">Last name</label>
                  <div class="col-md-4">
                     <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input class="form-control" type="text" name="lastName" value="<%=user.getLastName()%>"/>
                     </div>
                  </div>
               </div>
               <!--username-->
               <div class="form-group">
                  <label class="control-label col-md-4">Username</label>
                  <div class="col-md-4">
                     <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input class="form-control" type="text" name="username" value="<%=user.getUsername()%>"/>

                     </div>
                  </div>
               </div>
               <!--password-->
               <div class="form-group">
                  <label class="control-label col-md-4">Password</label>
                  <div class="col-md-4">
                     <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input class="form-control" type="password" name="password" value="<%=user.getPassword()%>"/>
                     </div>
                  </div>
               </div>
               <!--comfirm password-->
               <div class="form-group">
                  <label class="control-label col-md-4">Confirm Password</label>
                  <div class="col-md-4">
                     <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input class="form-control" type="password" name="confirmPassword" value="<%=user.getPassword()%>"/>
                     </div>
                  </div>
               </div>
               <!--email-->
               <div class="form-group">
                  <label class="control-label col-md-4">Email</label>
                  <div class="col-md-4">
                     <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input class="form-control" type="text" name="email" value="<%=user.getEmail()%>"/>
                     </div>
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-xs-4 control-label" id="captchaOperation"></label>
                  <div class="col-xs-4">
                     <input type="text" class="form-control" name="captcha" />
                  </div>
               </div>
               <!--Register-->
               <div class="form-group">
                  <label class="col-md-4 control-label"></label>
                  <div class="col-md-4">
                     <button class="btn btn-warning" type="submit" name="btnSubmit">
                        Register <i class="glyphicon glyphicon-log-in"></i>
                     </button>
                  </div>
               </div>

            </form>
         </fieldset>
      </div>
   </body>
</html>
