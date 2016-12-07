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
        <link href="css/headerStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/loginStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.min_2.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/bootstrapValidator.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>Update Login</h1>
        <div class="container">

            <div class="row">

                <div class="main">

                    <h3>Please Log In, or <a href="register.jsp">Sign Up</a></h3>
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <a href="#" class="btn btn-lg btn-primary btn-block">Facebook</a>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <a href="#" class="btn btn-lg btn-danger btn-block">Google</a>
                        </div>
                    </div>
                    <div class="login-or">
                        <hr class="hr-or">
                        <span class="span-or">or</span>
                    </div>

                    <form action="LoginController" method="POST" class="form-horizontal" id="login_from" role="form">
                        <div class="form-group">
                            <label for="inputUsernameEmail">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <!--<a class="pull-right" href="#">Forgot password?</a>-->
                            <label for="inputPassword">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Password">
                        </div>
                        <!--                        <div class="checkbox pull-right">
                                                    <label>
                                                        <input type="checkbox">
                                                        Remember me </label>
                                                </div>-->
                        <button type="submit" name="btnLogin" value="Login" class="btn btn btn-primary">
                            Sign In
                        </button>
                    </form>

                </div>
                <%
                    if (session.getAttribute("loginError") != null) {
                %>
                <br/>
                <div class="alert alert-danger alert-dismissable fade in col-md-4 col-md-offset-4">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong><%=session.getAttribute("loginError")%>!</strong>
                </div>
                <%
                    }
                %>

            </div>
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
