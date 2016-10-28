package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");

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

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Ejemplo de Sesiones</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/materialize.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Iniciar sesion</h1>\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"js/materialize.min.js\"></script>\n");
      out.write("        <br>\n");
      out.write("        <form action='index.jsp' method=\"POST\">\n");
      out.write("            <div class =\"card-panel table-of-contentseal darken-1\"> \n");
      out.write("                <span>NOMBRE: <input type=\"text\" name=\"NOMBRE\" id =\"NOMBRE\" required></span>\n");
      out.write("         <br />\n");
      out.write("         <span>APELLIDO: <input type=\"text\" name=\"APELLIDO\" id = \"APELLIDO\" required/> </span>\n");
      out.write("            </div>\n");
      out.write("            <span><input type=\"submit\" value=\"Submit\" /> </span>\n");
      out.write("            <br>\n");
      out.write("            <a href=\"Registro.jsp\"/> Registrate\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
