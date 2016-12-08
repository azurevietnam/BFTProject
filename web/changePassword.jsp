<%-- 
    Document   : changePassword
    Created on : Dec 8, 2016, 1:41:41 PM
    Author     : QuynhNguyen
--%>

<%@page import="com.dal.UserContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/headerStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>

        <script src="js/jquery.min_2.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrapValidator.min.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                $('#chgPassword').bootstrapValidator({
// To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        oldPassword: {
                            validators: {
                                notEmpty: {
                                    message: 'Please supply password'
                                }
//               regexp: {
//                  regexp: /^[a-zA-Z\s]+$/,
//                  message: 'The username can only consist of alphabetical'
//               }
                            }
                        },
                        newPassword: {
                            validators: {
                                notEmpty: {
                                    message: 'Please supply password'
                                }

                            }
                        },
                        confirmPassword: {
                            validators: {
                                identical: {
                                    field: 'newPassword',
                                    message: 'The password and its confirm are not the same'
                                }
                            }
                        }

                    }
                });
            });

        </script>
    </head>
    <body>
        <% String usr = request.getParameter("username");
            usr = (usr == null) ? "" : usr;
            %>
        <div id="wrapper">
            <%@include file="header.jsp" %>
            <div id="content">
                <h2 class="text-primary text-center">Change password information</h2>
                <form action="LoginController" class="form-horizontal" id="chgPassword" method="POST">

                    <div class="form-group">
                        <label class="control-label col-md-3 col-md-offset-2">User Name</label>
                        <div class="col-md-6">
                            <div class="input-group">
                                <input class="form-control" type="text" name="username" readonly="" value="<%=usr%>"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-md-offset-2">Old Password</label>
                        <div class="col-md-6">
                            <div class="input-group">
                                <input class="form-control" type="password" name="oldPassword" value=""/>

                            </div>
                        </div>
                    </div>
                    <!--username-->
                    <div class="form-group">
                        <label class="control-label col-md-3 col-md-offset-2">New Password</label>
                        <div class="col-md-6">
                            <div class="input-group">
                                <input class="form-control" type="password" name="newPassword" value=""/>
                            </div>
                        </div>
                    </div>
                    <!--password-->
                    <div class="form-group">
                        <label class="control-label col-md-3 col-md-offset-2">Confirm Password</label>
                        <div class="col-md-6">
                            <div class="input-group">
                                <input class="form-control" type="password" name="confirmPassword" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label col-md-offset-2"></label>
                        <div class="col-md-6">
                            <button type="submit" name="action" value="changePassword" class="btn btn-warning"><span class="fa fa-edit"></span> Change</button>
                        </div>
                    </div>

                </form>
                <%
                    if (session.getAttribute("chgOK") != null) {
                        session.removeAttribute("chgPasswordOK");
                %>
                <div class="col-md-3 col-md-offset-5"><strong class="alert-success">${chgOK}</strong></div>      
                    <% } else if (session.getAttribute("chgValid") != null) {
                        session.removeAttribute("chgPasswordValid");
                    %>
                <div class="col-md-3 col-md-offset-5"><strong class="alert-danger">${chgValid}</strong></div>

                <%  }%>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
