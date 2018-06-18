/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import java.io.Serializable;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named("reservaciones")
@SessionScoped
public class Reservaciones extends ModelBase implements Serializable {

    Connection conexion;

    public Reservaciones() throws SQLException {
        ModelBase modalBase = new ModelBase();
        conexion = modalBase.conexion();
    }

    public ResultSet getReservacionesPendientes() throws SQLException {
        ResultSet rs;
        PreparedStatement pst;

        String sql = "select * from reservacion where confirmada = 0";
        pst = this.conexion.prepareStatement(sql);
        return pst.executeQuery();
    }

    public void confirmar(String id) throws SQLException {
        PreparedStatement pst;
        String sql = "UPDATE `reservacion` SET "
                + "`confirmada` = '1'"
                + "WHERE `id_reservacion` = " + id;
        pst = this.conexion.prepareStatement(sql);
        pst.execute();
    }

    public String reservar(String id_habitacion, String email, String fechaInicial, String fechaFin) {
        return email;
//        try {
//                    Array responseData = null;
//        PreparedStatement pst;
//        String sql = "INSERT INTO `reservacion` (`id_habitacion`, `id_usuario`, `fecha_hora_inicial`, `fecha_hora_fin`, `confirmada`, pin, valor) "
//                + " VALUES (" + id_habitacion + ", '" + 1 + "', '" + fechaInicial + "', '" + fechaFin + "', 0, 1, 1);";
//
//        pst = this.conexion.prepareStatement(sql);
//        pst.execute();
//        } catch (Exception e) {
//            return e.getMessage();
//        }
//        return "bien";
//        return responseData;
    }
}
