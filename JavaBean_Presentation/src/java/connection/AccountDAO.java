/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import static connection.DatabaseInfo.DBURL;
import static connection.DatabaseInfo.DRIVERNAME;
import static connection.DatabaseInfo.PASSDB;
import static connection.DatabaseInfo.USERDB;
import model.Account;

public class AccountDAO {
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
    public static ArrayList<Account> getListAll(){
        ArrayList<Account> list = new ArrayList<>();
        try(Connection con = getConnect()){
            PreparedStatement stmt = con.prepareStatement("select * from users");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                list.add(new Account(rs.getString(1), rs.getString(2)));
            }
            con.close();
            return list;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public static void insertToDB(Account account) throws SQLException{
        try(Connection con = getConnect()){
            PreparedStatement stmt = con.prepareStatement("INSERT INTO users (email, password) VALUES (?, ?)");
            stmt.setString(1, account.getEmail());
            stmt.setString(2, account.getPass());
            stmt.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        ArrayList<Account> studentList = AccountDAO.getListAll();
        for (Account std: studentList) 
        {
            System.out.println("ID: "+std.getEmail()+";Name: "+std.getPass());
        }
    }
}
