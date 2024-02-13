package com.company.dbmanager;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	public static Connection conn;
	
	public DBManager() {
		super();
	}
	
	public Connection getConnection() {
		//JNDI
		try {
			//1. SERVER.XML
			Context initContext = new InitialContext();
			
			//2. 환경설정
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			
			//3. dataSource
			DataSource db = (DataSource)envContext.lookup("jdbc/dayreview");
			
			//4. Connection
			conn = db.getConnection();
			if(conn != null) {System.out.println("....DBMANAGER 연동성공!");}
		} catch (Exception e) {e.printStackTrace();}
		
		return conn;
	}
}
