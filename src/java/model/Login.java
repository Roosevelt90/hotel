/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import static java.util.concurrent.ThreadLocalRandom.current;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import javax.persistence.EntityManager;
import model.util.JsfUtil;

@Named("login")
@SessionScoped
public class Login extends ModelBase implements Serializable {

    Connection conexion;

    public Login() throws SQLException {
        ModelBase modalBase = new ModelBase();
        conexion = modalBase.conexion();
    }

    public int login(String email, String password) {
        try {
            Connection conn;
            PreparedStatement pst;
            ResultSet rs;
            int cont = 0;
            int nivel = 0;
            String sql = " select * from usuario where correo = '" + email + "' and clave ='" + password + "'";

            pst = this.conexion.prepareStatement(sql);
            rs = pst.executeQuery();

            while (rs.next()) {
                nivel = rs.getInt(6);
            }
            this.conexion.close();

            return nivel;
        } catch (SQLException e) {

        } catch (Exception e) {
            JsfUtil.addErrorMessage(e, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
        }
        return -1;
    }
}
