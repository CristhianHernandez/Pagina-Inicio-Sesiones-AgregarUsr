/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ldn;

import java.sql.ResultSet;

/**
 *
 * @author Alumno
 */
public class cUsuario {
    String _Nombre;
    String _Contra;
    String _error;

    public String getNombre() {
        return _Nombre;
    }

    public void setNombre(String _Nombre) {
        this._Nombre = _Nombre;
    }

    public String getContra() {
        return _Contra;
    }

    public void setContra(String _Contra) {
        this._Contra = _Contra;
    }
    
 public String AgregaUsuario( String Nombre, String Contra) {
        String regreso = "";
        BD.cDatos sql = new BD.cDatos();
        try {
            sql.conectar();

            ResultSet rsGuardaUsr = sql.consulta("call sp_Validacion('" + Nombre + "','"+Contra+"');");
            if (rsGuardaUsr.next()) {
                regreso = rsGuardaUsr.getString("Notificacion");
            }

            sql.cierraConexion();
        } catch (Exception xxxxxxxxxxxxD) {
            this._error = xxxxxxxxxxxxD.getMessage();
        }
        return regreso;
    }
    
}
