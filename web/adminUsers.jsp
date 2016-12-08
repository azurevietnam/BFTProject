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
        <script src="js/jquery.min_2.js"></script>
        <script src="js/bootstrap.js"></script>
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
                    <li><a href="adminHome.jsp"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
                    <li class="active">USER</li>
                </ol>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2>Users Table</h2>

                        </div>
                        <form action="adminUsers.jsp" method="POST" onsubmit="return valid();" role="search">
                            <br />
                            <div class="form-group col-md-3 col-md-offset-5">
                                <input type="text" name="txtSearch" class="form-control" placeholder="Search by username">
                            </div>
                            <div class="form-group col-md-1">
                                <button type="submit" name="btnSearch" class="btn btn-info">
                                    <span class="glyphicon glyphicon-search"></span> Search
                                </button>
                            </div>

                        </form>
                        <div class="form-group col-md-1">
                            <a href="adminAddUser.jsp" class="btn btn-info">
                                <span class="glyphicon glyphicon-plus-sign"></span> Add 
                            </a>
                        </div>
                        <div class="form-group col-md-1">
                            <a href="adminUsers.jsp" class="btn btn-info">
                                <span class="glyphicon glyphicon-list-alt"></span> Show all 
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
                                    <%  String username = request.getParameter("txtSearch");
                                        User u = new UserContext().searchUser(username);
                                        if (request.getParameter("btnSearch") == null) {
                                    %>
                                    <c:forEach items="${b}" var="i">
                                        <tr>
                                            <td>
                                                ${i.username}<br/>
                                                <a href="adminChgPassword.jsp?username=${i.username}" class="btn btn-xs btn-info">
                                                    <span class="glyphicon glyphicon-edit"></span> Change password
                                                </a>
                                            </td>
                                            <td>${i.password}</td>
                                            <td>${i.firstName}</td>
                                            <td>${i.lastName}</td>
                                            <td>${i.email}</td>
                                            <td>${i.facebookID}</td>
                                            <td>${i.facebookLink}</td>
                                            <td>${i.admin?"Yes":"No"}</td>
                                            <td>
                                                <a href="UserController?action=edit&username=${i.username}" class="btn btn-xs btn-primary">
                                                    <span class="glyphicon glyphicon-edit"></span> Edit
                                                </a>

                                                <a href="UserController?action=delete&username=${i.username}" 
                                                   onclick="return confirm('Are you sure want to delete?')" class="btn btn-xs btn-warning">
                                                    <span class="glyphicon glyphicon-remove"></span> Delete
                                                </a>
                                                <button type="button" onclick="changeLink('UserController?action=delete&username=${i.username}')" 
                                                        class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-remove"></span> Delete</button> 


                                            </td>
                                        </tr>
                                    </c:forEach>


                                    <!--Modal--> 
                                <div class="modal fade" id="myModal" role="dialog">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h3 class="modal-title">Confirm Delete</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>Are you sure want to delete?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <a id="deleteUser" href="#"  class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span> Yes</a>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%
                                } else {
                                    if (u != null) {
                                %>
                                <tr>
                                    <td><a href="#"><%=u.getUsername()%></a></td>
                                    <td><%=u.getPassword()%></td>
                                    <td><%=u.getFirstName()%></td>
                                    <td><%=u.getLastName()%></td>
                                    <td><%=u.getEmail()%></td>
                                    <td><%=u.getFacebookID()%></td>
                                    <td><%=u.getFacebookLink()%></td>
                                    <td><%=u.isAdmin() ? "Admin" : "No"%></td>
                                    <td>
                                        <a href="UserController?action=edit&username=${i.username}">
                                            Edit<span class="glyphicon glyphicon-edit"></span>
                                        </a>|
                                        <a data-toggle="confirmation" href="UserController?action=delete&username=${i.username}">
                                            Delete<span class="glyphicon glyphicon-remove"></span>
                                        </a>
                                    </td>
                                </tr>
                                <% } else {%>
                                </tbody>
                            </table>
                            <div class="alert alert-danger col-md-3">
                                <strong>Not found!</strong> User by username = <%=username%>
                            </div>
                            <% }
                                }%>
                        </div>
                    </div>
                </div>
            </div><!--/.row-->	


        </div><!--/.main-->


        <script type="text/javascript">
            function valid() {
                var search = document.getElementsByName("txtSearch")[0].value.trim();
                if (search === "") {
                    return false;
                }
                return true;
            }
            function changeLink(link) {
                document.getElementById("deleteUser").href = link;
            }
        </script>

    </body>
</html>
