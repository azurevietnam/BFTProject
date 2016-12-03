<%-- 
    Document   : users
    Created on : Dec 3, 2016, 1:04:23 AM
    Author     : QuynhNguyen
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dal.UserContext"%>
<%@page import="com.entities.User"%>
<%@page import="java.util.List"%>
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
    </head>
    <body>
        <jsp:useBean id="userBean" class="com.dal.UserContext" scope="session" />
        <%
            pageContext.setAttribute("b", userBean.getAllUser());
        %>
        <%@include file="adminHeader.jsp" %>
        <%@include file="adminLeftSide.jsp" %>
        <!--Content-->

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">	

            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">Icons</li>
                </ol>
            </div><!--/.row-->

            <!--            <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Tables</h1>
                            </div>
                        </div>/.row-->

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2>Users Table</h2>

                        </div>
                        <form action="adminUsers.jsp" method="POST" role="search">
                            <br />
                            <div class="form-group col-md-3 col-md-offset-7">
                                <input type="text" name="txtSearch" class="form-control" placeholder="Search by username">
                            </div>
                            <div class="form-group col-md-1">
                                <button type="button" name="btnSearch" class="btn btn-info">
                                    <span class="glyphicon glyphicon-search"></span> Search
                                </button>
                            </div>

                        </form>
                        <div class="form-group col-md-1">
                            <a href="#" class="btn btn-info">
                                <span class="glyphicon glyphicon-plus-sign"></span> Add 
                            </a>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover table-bordered" >
                                <thead>
                                    <tr class="bg-primary text-uppercase">
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Email</th>
                                        <th>Facebook ID</th>
                                        <th>Facebook Link</th>
                                        <th>isAdmin</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${b}" var="i">
                                    <td><a href="#">${i.username}</a></td>
                                    <td>${i.password}</td>
                                    <td>${i.firstName}</td>
                                    <td>${i.lastName}</td>
                                    <td>${i.email}</td>
                                    <td>${i.facebookID}</td>
                                    <td>${i.facebookLink}</td>
                                    <td>${i.admin?"Yes":"No"}</td>
                                    <td>
                                        <a href="UserController?action=edit&username=${i.username}">
                                            Edit<span class="glyphicon glyphicon-edit"></span>
                                        </a>|
                                        <a href="#">
                                            Delete<span class="glyphicon glyphicon-remove"></span>
                                        </a>
                                    </td>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div><!--/.row-->	


        </div><!--/.main-->


        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/chart.min.js"></script>
        <script src="js/chart-data.js"></script>
        <script src="js/easypiechart.js"></script>
        <script src="js/easypiechart-data.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/bootstrap-table.js"></script>

    </body>
</html>
