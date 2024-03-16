/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import static model.DatabaseInfo.DBURL;
import static model.DatabaseInfo.DRIVERNAME;
import static model.DatabaseInfo.PASSDB;
import static model.DatabaseInfo.USERDB;

/**
 *
 * @author Acer
 */
public class StudentDB {
    public static Connection getConnect(){
        try{ 
            Class.forName(DRIVERNAME); 
	} catch(ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
	}
        try{            
            Connection con = DriverManager.getConnection(DBURL,USERDB,PASSDB);
            return con;
        }
        catch(SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
    public static ArrayList<Student> listAll(){
          ArrayList<Student> list= new ArrayList<>();
          try(Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("select * from DE180384");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                list.add(new Student(rs.getString(1),rs.getString(2), rs.getInt(3)));
                //Lấy dữ liệu cột 1 và cột 2
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(StudentDB.class.getName()).log(Level.SEVERE, null, ex);
        }   
          return null;
        }
    public static void main(String[] args) {
        ArrayList<Student> studentList = StudentDB.listAll();
        for (Student std: studentList) 
        {
            System.out.println("ID: "+std.getId()+";Name: "+std.getName()+";Age:"+std.getAge());
        }
    }
}
