/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named("usuario")
@SessionScoped
public class Usuario extends ModelBase implements Serializable {

    Connection conexion;

    public Usuario() throws SQLException {
        ModelBase modalBase = new ModelBase();
        conexion = modalBase.conexion();
    }

    public Array create(String email_user, String cc, String name, String pass) throws SQLException {
        Array responseData = null;
        PreparedStatement pst;
        String sql = "INSERT INTO `usuario` (`numero_documento`, `correo`, `clave`, `nombre`, `id_tipo_usuario`) "
                + " VALUES (" + cc + ", '" + email_user + "', '" + pass + "', '" + name + "', 2);";

        pst = this.conexion.prepareStatement(sql);
        pst.execute();
        return responseData;
    }
}
