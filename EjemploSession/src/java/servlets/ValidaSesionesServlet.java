/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ValidaSesionesServlet extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

      response.setContentType("text/html");
      HttpSession sesion = request.getSession();
      String titulo = null;
      String us;
      String sValida;

      sValida = sesion.getAttribute("valido") == null ? "0" : sesion.getAttribute("valido").toString();
    
    //String us=sess.getAttribute("nombre").toString();
    
    if(!sValida.equals("ok"))
    {
        response.sendRedirect("index.jsp");
    }
    else
    {
        us=sesion.getAttribute("nombre").toString();
    }
      //Pedimos el atributo, y verificamos si existe
     
    us=sesion.getAttribute("nombre").toString();
     

      //Mostramos los  valores en el cliente
      PrintWriter out = response.getWriter();
      out.println("<link rel=\'stylesheet\' href=\'css/materialize.min.css\'>");
      out.println("<link rel=\'stylesheet\' href=\'css/materialize.min.css\'>");
      out.println("<div class =\"card-panel table-of-contentseal darken-4\"> ");
      out.println("¿Continua la Sesion y es valida?: " + titulo);
      out.println("<br>");
      out.println("ID de la sesi&oacute;n JSESSIONID: " + us);
      out.println("<a href='logOut.jsp'> Salir  </a>");
      out.print("</div>");
    }

}
