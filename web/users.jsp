<%-- 
    Document   : users
    Created on : Dec 3, 2016, 1:04:23 AM
    Author     : QuynhNguyen
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%pageContext.setAttribute("b", userBean.getAllUser());%>


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
                        <div class="panel-heading"><h2>Users Table</h2></div>
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
                                    </tr>
                                </thead>
                                <tbody>
                                    <%       List<User> users = new UserContext().getAllUser();
                                        for (int j = 0; j < users.size(); j++) {
                                            User x = users.get(j);
                                            String isAdmin = x.isAdmin() ? "Yes" : "No";

                                    %>

                                    <tr>
                                        <td><a href="#"><%=x.getUsername()%></a></td>
                                        <td><%=x.getPassword()%></td>
                                        <td><%=x.getFirstName()%></td>
                                        <td><%=x.getLastName()%></td>
                                        <td><%=x.getEmail()%></td>
                                        <td><%=x.getFacebookID()%></td>
                                        <td><%=x.getFacebookLink()%></td>
                                        <td><%=isAdmin%></td>
                                    </tr>

                                    <%
                                        }
                                    %>


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
