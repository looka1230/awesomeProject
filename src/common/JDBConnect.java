package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	//생성자
	public JDBConnect() {
		try {
			//JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			
			//DB에 연결
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "gymggun_user";
			String pwd = "1234";
			conn = DriverManager.getConnection(url, id, pwd);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	//연결 해제(자원 반납)
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
