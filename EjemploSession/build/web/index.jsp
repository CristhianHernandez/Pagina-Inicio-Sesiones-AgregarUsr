<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    
    //request.getParameter(name)
    String usr = request.getParameter("NOMBRE") == null ? "" : request.getParameter("NOMBRE");
    String pswd =  request.getParameter("APELLIDO")== null ? "" : request.getParameter("APELLIDO");

    String quepasa = "";
    String nom = "";
    int resultado = 0;
    BD.cDatos sql = new BD.cDatos();
    
    try {
        sql.conectar();
        ResultSet rsValida = sql.consulta(" call sp_Check ('"+usr+"','"+pswd+"');");

        while (rsValida.next()) {
            resultado = Integer.parseInt(rsValida.getString("valido"));
            //nom = rsValida.getString("nombre");
        }
        HttpSession sss = request.getSession();
        if (resultado == 1) {
            //nom = request.getParameter("nom");
            sss.setAttribute("ok", "valido");
            sss.setAttribute("usuario", nom = request.getParameter("NOMBRE"));
            //nom= rsValida.getString("nombre").toString();
            //ss.setMaxInactiveInterval(30);
            response.sendRedirect("catalogo.jsp");
        } else {
            // ss.invalidate();
            quepasa = rsValida.getString("notificacion");
            response.sendRedirect("Registro.jsp");
        }
        out.print(nom);
    } catch (Exception e){
        String a = e.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ejemplo de Sesiones</title>
        <link rel="stylesheet" href="css/materialize.min.css">
    </head>
    <body>
        <h1>Iniciar sesion</h1>
        <script src="js/jquery.min.js"></script>
        <script src="js/materialize.min.js"></script>
        <br>
        <form action='index.jsp' method="POST">
            <div class ="card-panel table-of-contentseal darken-1"> 
                <span>NOMBRE: <input type="text" name="NOMBRE" id ="NOMBRE" required></span>
         <br />
         <span>APELLIDO: <input type="text" name="APELLIDO" id = "APELLIDO" required/> </span>
            </div>
            <span><input type="submit" value="Submit" /> </span>
            <br>
            <a href="Registro.jsp"/> Registrate &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            <a href="Principal.html"/> Ir a inicio
        </form>
        
        
    </body>
</html>
