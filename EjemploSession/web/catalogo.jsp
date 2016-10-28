<%-- 
    Document   : catalogo
    Created on : 13/10/2015, 10:42:25 PM
    Author     : EMMANUEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%

    HttpSession sess = request.getSession();
    //                    Recuperamos la variable de sesion y su valor
    String sValida = "";
    String us = "";
    sValida = sess.getAttribute("ok") == null ? "0" : sess.getAttribute("ok").toString();

    //String us=sess.getAttribute("nombre").toString();
    if (!sValida.equals("valido")) {

              response.sendRedirect("Registro.jsp");
               
    } else{    
     
            us = sess.getAttribute("usuario").toString();
            
 
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validacion de sesion</title>

        <link rel="stylesheet" href="css/materialize.min.css">
    </head>
    <body>

        <script src="js/jquery.min.js"></script>
        <script src="js/materialize.min.js"></script>
        <h1>Ejemplo de Sesiones</h1>
        <br>
        <br>
        <h2>Hola <%=us%>!</h2>
        <br>
        <div class ="breadcrumb">
            <span>
                Hola <%=us%>
            </span>
               
        </div>
            <a href="logOut.jsp">Salir</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            <a href="Principal.html">IR a inicio</a> 
    </body>
</html>
