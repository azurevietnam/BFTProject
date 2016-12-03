<%-- 
    Document   : register
    Created on : Nov 28, 2016, 9:31:56 AM
    Author     : SoN-TunG
--%>

<%@page import="com.dal.UserContext"%>
<%@page import="com.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>F-Air - Users</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/datepicker3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!--Icons-->
        <script src="js/lumino.glyphs.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href="css/bootstrapValidator.min.css" rel="stylesheet"/>
        <script src="js/jquery.min_2.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrapValidator.min.js"></script>      
        <script src="js/register.js"></script>
    </head>
    <body>
        <%@include file="adminHeader.jsp" %>
        <%@include file="adminLeftSide.jsp" %>

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">Icons</li>
                </ol>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Forms</h1>
                </div>
            </div>
            <jsp:useBean id="editBean" class="com.dal.UserContext" scope="session"/>
            <%                
//                String username = request.getParameter("username");
//                User user = editBean.searchUser(username);
//                pageContext.setAttribute("u", user);
//                editBean.updateUser(u);
            %>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Edit informations of USER</div>
                        <div class="panel-body">
                            <div class="col-md-4">
                                <form action="../UserController" class="form-horizontal" id="register_form" method="POST">
                                    <!--first name-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">First name</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                <input class="form-control" type="text" name="firstName" value="${user.firstName}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--last name-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Last name</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                <input class="form-control" type="text" name="lastName" value="${user.lastName}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--username-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Username</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                <input class="form-control" type="text" name="username" value="${user.username}" readonly=""/>

                                            </div>
                                        </div>
                                    </div>
                                    <!--password-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Password</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                <input class="form-control" type="text" name="password" value="${user.password}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--comfirm password-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Confirm Password</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                <input class="form-control" type="password" name="confirmPassword" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--email-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Email</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                                <input class="form-control" type="text" name="email" value="${user.email}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Register-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label"></label>
                                        <div class="col-md-8">
                                            <button class="btn btn-warning" type="submit" name="btnSubmit">
                                                Register <i class="glyphicon glyphicon-log-in"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div><!-- /.col-->
                </div><!-- /.row -->

            </div><!--/.main-->



    </body>
</html>
