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

    public void reservar(String id_habitacion, String email, String fechaInicial, String fechaFin) throws SQLException {
//        try {
        ResultSet rs;
        Integer idHabitacion = null;
        System.out.println("fechaInicial " + fechaInicial);
        Array responseData = null;
        PreparedStatement pst;
        String sqlHabitacion = "select h.id_habitacion from habitacion h where h.numero = '" + id_habitacion + "'";
        pst = this.conexion.prepareStatement(sqlHabitacion);
        rs = pst.executeQuery();

        while (rs.next()) {
            idHabitacion = rs.getInt(1);
        }

        String sql = "INSERT INTO `reservacion` (`id_habitacion`, `id_usuario`, `fecha_hora_inicial`, `fecha_hora_fin`, `confirmada`, pin, valor) "
                + " VALUES (" + idHabitacion + ", '" + 1 + "', '" + fechaInicial + "', '" + fechaFin + "', 0, 1, 1);";
        System.out.println("sql " + sql);
        pst = this.conexion.prepareStatement(sql);
        pst.execute();
//        } catch (Exception e) {
//            return e.getMessage();
//        }
//        return "bien";
//        return responseData;
    }
}
