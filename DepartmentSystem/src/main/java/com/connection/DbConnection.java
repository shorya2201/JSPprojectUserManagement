package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DbConnection {
	
	
	public static Connection takeConnection() {
		Connection con = null;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/dept";
			String user = "root";
			String pass = "shorya2201";

			con = DriverManager.getConnection(url,user,pass);
			con.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
//	public static boolean verifyLogin(String username , String password, String role) {
//		boolean status = false;
//		
//		try {
//			
//			Connection con = DbConnection.takeConnection();
//			String query = "select * from login where username = ? and password = ? and role=?";
//			PreparedStatement ps = con.prepareStatement(query);
//			ps.setString(1,username);
//			ps.setString(2, password);
//			ps.setString(3, role);
//			ResultSet rs = ps.executeQuery();
//			if(rs.next()) {
//				RequestDispatcher rd = request.getRe
//			}
//			status = true;
//			con.setAutoCommit(true);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return status;
//	}
//	
//	
	
	public static void insertData(String title, String desc, String raiseFor,String user,String date)
	{
		
		try
		{
			String pending = "Pending";
		
			
			Connection con = takeConnection();
			String query = "insert into approval(title , description , request_dept ,request_by , request_date,status) values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
	
			ps.setString(1, title);
			ps.setString(2, desc);
			ps.setString(3,raiseFor);
			ps.setString(4, user);
			ps.setString(5, date);
			ps.setString(6, pending);
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	public static void insertRemData(String user,String date,String id)
	{
		
		try
		{
			
		
			
			Connection con = takeConnection();
			String query = "update approval set approval_person =? , approval_date = ? where request_id ="+id;
			PreparedStatement ps = con.prepareStatement(query);
	
			
			ps.setString(1, user);
			ps.setString(2, date);
			
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
}
