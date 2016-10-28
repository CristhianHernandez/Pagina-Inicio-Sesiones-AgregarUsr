<%-- 
    Document   : Registro
    Created on : 27/10/2016, 08:51:42 AM
    Author     : Alumno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    ldn.cUsuario Usr = new ldn.cUsuario();
    //obtencion de datos
   // String idUsr = request.getParameter("idUsr") == null ? "0" : request.getParameter("idUsr");
    String nombre = request.getParameter("Usr") == null ? "" : request.getParameter("Usr");
    String contra = request.getParameter("Contra") == null ? "" : request.getParameter("Contra");
    

    String resp = "";
       resp = Usr.AgregaUsuario(nombre, contra);


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Registrate</h1>
        <h3><%=resp%></h3>
        
        <form action="Registro.jsp" method="POST">
            
            Nombre: <input type ="text" name="Usr" id="Usr" required/>
            Contraseña: <input type="password" name="Contra" id="Contra" required/> 
            <input type="submit"/>
            <br>
            <a href="index.jsp"/> login
            
        </form>
    </body>
</html>
