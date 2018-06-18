/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named("habitacion")
@SessionScoped
public class Habitacion extends ModelBase implements Serializable {

    Connection conexion;

    public Habitacion() throws SQLException {
        ModelBase modalBase = new ModelBase();
        conexion = modalBase.conexion();
    }

    public ResultSet getHabitacionesDisponibles(String fechaInicial, String fechaFin) throws SQLException {
        PreparedStatement pst;

        String sql = "select h.id_habitacion, h.numero, h.valorDia from habitacion h  "
                + "left join reservacion r on r.id_habitacion = h.id_habitacion "
                + "and  r.fecha_hora_inicial  NOT BETWEEN '" +fechaInicial+ "' and '" + fechaFin + "' group by h.id_habitacion";
        pst = this.conexion.prepareStatement(sql);
        return pst.executeQuery();
    }
}
