/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ModelBase {

    String driver,
            url,
            usuario,
            password;

    public ModelBase() {
        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/db_hotel";
        usuario = "root";
        password = "";
    }

    public Connection conexion() throws SQLException {
        Connection con = null;
        try {
            Class.forName(this.driver);
            con = DriverManager.getConnection(this.url, this.usuario, this.password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ModelBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
}
