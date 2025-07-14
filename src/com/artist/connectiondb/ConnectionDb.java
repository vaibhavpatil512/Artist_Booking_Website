package com.artist.connectiondb;


import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDb {
	public static Connection con=null;
	public static Connection dbCon(){
		try{
			if(con==null){
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/artistbooking","root","");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
}

