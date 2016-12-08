<%-- 
    Document   : header
    Created on : Dec 3, 2016, 12:11:39 AM
    Author     : QuynhNguyen
--%>

<%@page import="com.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>F-Air</span> Administrator</a>
            <%if (session.getAttribute("login") != null) {
                    User userLogin = (User) session.getAttribute("login");
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <%=userLogin.getFirstName()%> <%=userLogin.getLastName()%> <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="changePassword.jsp?username=<%=userLogin.getUsername()%>" target="_blank"><span class="glyphicon glyphicon-edit"></span>  Change password</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
                        <li><a href="LoginController?action=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                    </ul>
                </li>
            </ul>
            <%    }
            %>
        </div>

    </div>
</nav>
