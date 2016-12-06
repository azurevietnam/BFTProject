<%-- 
    Document   : index
    Created on : Nov 27, 2016, 4:19:59 PM
    Author     : SoN-TunG
--%>

<%@page import="com.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" uri="/WEB-INF/tlds/my_tag" %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
   </head>
   <body>
      <t:Login url="login.jsp" message="You need login first"></t:Login>
      <h1>Hello World!</h1>
      <%
      if (session.getAttribute("login")!=null){
         User user=(User)session.getAttribute("login");
         %>
         <p>Welcome <%=user.getFirstName()+" "+user.getLastName() %></p>
      <%
      }
      %>
      
      <p><a href="history.jsp">history</a></p>
   </body>
</html>
