<%-- 
    Document   : header
    Created on : Dec 6, 2016, 11:21:26 PM
    Author     : QuynhNguyen
--%>

<%@page import="com.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="header">
    <nav class="navbar navbar-default navbar-inverse" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">F-AIR</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="history.jsp">Booking History</a></li>
                </ul>

                <%if (session.getAttribute("login") != null) {
                        User user = (User) session.getAttribute("login");
                %>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <%=user.getFirstName()%> <%=user.getLastName()%> <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="changePassword.jsp?username=<%=user.getUsername()%>"><span class="glyphicon glyphicon-edit"></span>  Change password</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
                            <li><a href="LoginController?action=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                        </ul>
                    </li>
                </ul>
                <%    } else {
                %>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp"> Login <span class="glyphicon glyphicon-log-in"></span></a></li>
                </ul>
                <%}%>

            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>