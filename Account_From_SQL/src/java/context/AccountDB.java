/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import entity.Account;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import static load.DatabaseInfo.DBURL;
import static load.DatabaseInfo.DRIVERNAME;
import static load.DatabaseInfo.PASSDB;
import static load.DatabaseInfo.USERDB;

/**
 *
 * @author Acer
 */
public class AccountDB {
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
    public static ArrayList<Account> listAll(){
          ArrayList<Account> list= new ArrayList<Account>();
          try(Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("select* from Account");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                list.add(new Account(rs.getString(1),rs.getString(2)));
                //Lấy dữ liệu cột 1 và cột 2
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(AccountDB.class.getName()).log(Level.SEVERE, null, ex);
        }   
          return null;
        }
    public static void main(String[] args) {
        ArrayList<Account> accountList = AccountDB.listAll();
        for (Account item: accountList) 
        {
            System.out.println("User: "+item.getUsername()+";Pass: "+item.getPassword());
        }
    }
}
