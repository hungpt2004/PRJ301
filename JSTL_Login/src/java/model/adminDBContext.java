/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Acer
 */

public class adminDBContext {
    protected Connection connection;
    public adminDBContext(){
        try{
            String url = "jdbc:sqlserver://Nitro5Boai;databaseName=Admin;encrypt=false;trustServerCertificate=false;loginTimeout=30";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url,username,password);
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e);
        }
    }
}
