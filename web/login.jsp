<%-- 
    Document   : login
    Created on : Nov 29, 2016, 2:58:18 PM
    Author     : SoN-TunG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Login</title>
      <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
      <script src="js/jquery.min_2.js" type="text/javascript"></script>
      <script src="js/bootstrap.min.js" type="text/javascript"></script>
      <script src="js/bootstrapValidator.min.js" type="text/javascript"></script>
   </head>
   <body>

      
      <div class="container">
         <%
         if (session.getAttribute("loginError") != null) {
      %>
      <div class="alert alert-danger alert-dismissable"><%=session.getAttribute("loginError")%></div>
      <%
         }
      %>
         <form action="LoginController" method="POST" class="form-horizontal" id="login_from">
            <div class="form-group">
               <div class="col-lg-4 col-md-offset-3"><input type="text" name="username" class="form-control" placeholder="Username"/></div>
            </div>
            <div class="form-group">
               <div class="col-lg-4 col-md-offset-3"><input type="password" name="password" class="form-control" placeholder="Password"/></div>
            </div>
            <div class="col-md-4 col-md-offset-3 text-center">
               <button type="submit" name="btnLogin" value="Login" class="btn btn-warning">Login</button>
               <div class="alert alert-info">Create new account <a href="register.jsp" class="alert-link">here</a></div>
            </div>
         </form>
      </div>
   </body>

   <script type="text/javascript">
      $(document).ready(function () {
         $('#login_from').bootstrapValidator({
            feedbackIcons: {
               valid: 'glyphicon glyphicon-ok',
               invalid: 'glyphicon glyphicon-remove',
               validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
               username: {
                  validators: {
                     stringLength: {
                        min: 5,
                        max: 30,
                        message: 'Please enter at least 5 characters and no more than 30'
                     },
                     notEmpty: {
                        message: 'Please supply your username'
                     },
                     regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: 'The username can only consist of alphabetical, number and underscore'
                     }
                  }
               },
               password: {
                  validators: {
                     stringLength: {
                        min: 5,
                        max: 30,
                        message: 'Please enter at least 5 characters and no more than 30'
                     },
                     notEmpty: {
                        message: 'Please supply your password'
                     }
                  }
               }
            }
         });
      });
   </script>


</html>
