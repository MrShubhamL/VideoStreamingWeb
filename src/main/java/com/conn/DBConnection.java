package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection conn;
	
	public static Connection getConnection() throws Throwable {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://employeemanagement.chaoxykw4k0s.ap-south-1.rds.amazonaws.com:3306/employee";
		String username = "root";
		String password = "root";
		conn = DriverManager.getConnection(url,username,password);
		return conn;
	}
	
	public static void main(String[] args) throws Throwable {
		getConnection();
		if(conn.isClosed()) {
			System.out.println("Coonection Closed");
		}
		else {
			System.out.println("Database is connected..");
		}
	}
}
