<%-- 
    Document   : leftSide
    Created on : Dec 3, 2016, 12:45:35 AM
    Author     : QuynhNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    
    <%
        String hActive = request.getParameter("h");
        String uActive = request.getParameter("a");
        String pActive = request.getParameter("p");
    %>
    <ul class="nav menu">
        <li class="<%=hActive%>"><a href="adminHome.jsp?h=active"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Dashboard</a></li>
        <li class="<%=uActive%>"><a href="adminUsers.jsp?a=active"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> USERS</a></li>
        <li class=""><a href="#"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> FLIGHT</a></li>
        <li class=""><a href="#"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> FLIGHT DETAILS</a></li>
        <li class="<%=pActive%>"><a href="adminPassenger.jsp?p=active"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> PASSENGER</a></li>
        <li class=""><a href="#"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> BOOKING</a></li>
        <li role="presentation" class="divider"></li>
        <li><a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Login Page</a></li>
    </ul>

</div><!--/.sidebar-->

