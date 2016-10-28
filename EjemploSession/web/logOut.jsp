<%-- 
    Document   : logOut
    Created on : 24/10/2016, 09:29:25 PM
    Author     : cristhian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sessi = request.getSession();
    sessi.invalidate();
    response.sendRedirect("index.jsp");
%>   
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
