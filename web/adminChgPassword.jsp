<%-- 
    Document   : adminChgPassword
    Created on : Dec 6, 2016, 12:17:27 AM
    Author     : QuynhNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>F-Air - Users</title>
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/datepicker3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!--Icons-->
        <script src="js/lumino.glyphs.js"></script>
        <link href="css/bootstrapValidator.min.css" rel="stylesheet"/>
        <script src="js/jquery.min_2.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrapValidator.min.js"></script>      
        <script src="js/register.js"></script>
    </head>
    <body>
        <%
            String pageRedirect = "";
            if (session.getAttribute("login") == null) {
                pageRedirect = "login.jsp";
                session.setAttribute("loginError", "You need login first");
            } else {

        %>
        <%@include file="adminHeader.jsp" %>
        <%@include file="adminLeftSide.jsp" %>

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="adminUsers.jsp">
                            <svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> USERS</a></li>
                    <li class="active">CHANGE PASSWORD USER</li>
                </ol>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Informations of USER</div>
                        <div class="panel-body">

                            <div class="col-md-8">
                                <%String username = request.getParameter("username");
                                    if (username == null) {
                                        username = "";
                                    }
                                %>
                                <form action="UserController" class="form-horizontal" id="register_form" method="POST">
                                    <!--username-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Username</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                <input class="form-control" type="text" name="username" value="<%=username%>" readonly=""/>

                                            </div>
                                        </div>
                                    </div>
                                    <!--password-->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Password</label>
                                        <div class="col-md-8">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                <input class="form-control" type="password" name="password" value=""/>
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
                                    <!--Update-->
                                    <div class="form-group">
                                        <label class="col-md-3 control-label"></label>
                                        <div class="col-md-8">
                                            <button type="submit" name="action" value="Save" class="btn btn-warning"><span class="glyphicon glyphicon-saved"></span> Save</button>
                                        </div>
                                    </div>
                                    <%  if (session.getAttribute("updateUserOK") != null) {
                                    %>
                                    <div class="alert alert-success col-md-6 col-md-offset-3">
                                        <strong>Change password successful!</strong>
                                    </div>
                                    <%
                                            session.setAttribute("updateUserOK", null);
                                        }
                                    %>
                                </form>
                            </div>

                        </div>
                    </div><!-- /.col-->
                </div><!-- /.row -->

            </div><!--/.main-->
        </div>
        <%            }

            if (!pageRedirect.isEmpty()) {
                response.sendRedirect(pageRedirect);
            }
        %>
    </body>
</html>
