package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {

	
	public static Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}
	
	//select
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//insert, update, delete
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(pstmt != null)		pstmt.close();
			if(conn != null)		conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
