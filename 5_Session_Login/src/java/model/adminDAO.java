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
import java.util.List;

/**
 *
 * @author Acer
 */
public class adminDAO extends adminDBContext {
    public admin check(String username, String password) {
        String sql = "select   [Username]\n"
                + "	      ,[Password]\n"
                + "        ,[role]\n"
                + "from [dbo].[Admin]\n"
                + "where username = ? and password = ?";
        try {
            PreparedStatement stmt = connection.prepareCall(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                admin newAd = new admin(rs.getString("Username"), rs.getString("Password"), rs.getInt("role"));
                return newAd;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(String username, String password, int role) {
        String sql = "INSERT INTO [dbo].[Admin] ([Username], [Password], [role]) "
                + "VALUES (?, ?, ?)";

        try {
            PreparedStatement stmt = connection.prepareCall(sql);
            // Set giá trị cho các tham số ?
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setInt(3, role);
            // Thực thi câu lệnh INSERT
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new record was inserted successfully!");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting record: " + e.getMessage());
        }
    }
    public ArrayList<admin> getListNormal(){
        ArrayList<admin> list = new ArrayList<>();
        try{
            PreparedStatement stmt = connection.prepareStatement("select * from [dbo].[Admin] where role = 2");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                list.add(new admin(rs.getString(1), rs.getString(2),rs.getInt(3)));
            }
            connection.close();
            return list;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public ArrayList<admin> getListAdmin(){
        ArrayList<admin> list = new ArrayList<>();
        try{
            PreparedStatement stmt = connection.prepareStatement("select * from [dbo].[Admin] where role = 1");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                list.add(new admin(rs.getString(1), rs.getString(2),rs.getInt(3)));
            }
            connection.close();
            return list;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public ArrayList<admin> getListAll(){
        ArrayList<admin> list = new ArrayList<>();
        try{
            PreparedStatement stmt = connection.prepareStatement("select * from [dbo].[Admin]");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                list.add(new admin(rs.getString(1), rs.getString(2),rs.getInt(3)));
            }
            connection.close();
            return list;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
       adminDAO dao = new adminDAO();

        // Gọi hàm getListAll để lấy danh sách tất cả các admin từ database
        ArrayList<admin> allAdmins = dao.getListNormal();

        // Kiểm tra và hiển thị thông tin của các admin trong danh sách
        if (allAdmins != null) {
            for (admin ad : allAdmins) {
                System.out.println("Username: " + ad.getUsername());
                System.out.println("Password: " + ad.getPassword());
                System.out.println("Role: " + ad.getRole());
                System.out.println("-----------------------------");
            }
        } else {
            System.out.println("Không có dữ liệu hoặc có lỗi xảy ra khi truy vấn.");
        }
    }
}
