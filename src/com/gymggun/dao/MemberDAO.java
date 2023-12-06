package com.gymggun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.gymggun.dto.MemberVO;

public class MemberDAO {

	private MemberDAO() {
		
	}
	private static MemberDAO instance = new MemberDAO();
	
	
	public static MemberDAO getInstance() {
		return instance;		
	}
	
	Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}
	
	public int userCheck(String id, String password) {
		
		int result = -1;
		String sql = "select password from member where id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		try {
			conn = getConnection();		// 디비 연결
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// 디비로부터 가져온 비번 인증
			// rs.next()에 내용이 있는 경우,
			// 아이디에 해당하는 비번이 동일한지 여부를 판별
			// 디비에서 조회한 결과가 있으면 result = 1; 없으면 result = 0;
			if(rs.next()) {
				
				if(rs.getString("password")!=null &&
						rs.getString("password").equals(password)) {
					result = 1;		// pwd 일치
				} else {
					result = 0;		// pwd 가 다름
				}				
			} else {
				result = -1;		// 디비에 userid가 없음
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}		
		return result;		// 정상(1), 비번다름(0), 아이디없음(-1)
	}	

	
//	public int userCheck(String id, String password) {
//		
//		Connection conn = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		int result = -1;
//		
//		String sql = "select id, password from member where id='lim'";
//		
//		System.out.println(id);
//		System.out.println(password);
//		
//		try {
//			conn = getConnection();
//			stmt = conn.createStatement();
//			
//			rs = stmt.executeQuery(sql);
////			System.out.println(password);		// 1234
//			System.out.println(rs.next());		// false
//			
//			if(rs.next()) {				
//				System.out.println(rs.getString("password"));
//				String pwd_in_db = rs.getString("password");
//				if(pwd_in_db != null && password.equals(pwd_in_db)) {
//					result = 1;
//				}else {
//					result = 0;
//				}
//			}else {
//				result = -1;
//			}
//		}catch(Exception e) {
//			System.out.println(e.getMessage());
//			e.printStackTrace();
//		}finally {
//			try {
//				if(conn != null) {
//					conn.close();
//				}if(stmt != null) {
//					stmt.close();
//				}if(rs != null) {
//					rs.close();
//				}
//			}catch(SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
	
	public MemberVO getMember(String id) {
		String sql="select * from member where id=?";
		MemberVO mVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mVo = new MemberVO();
				mVo.setMem_class(rs.getString("mem_class"));
				mVo.setMem_num(rs.getInt("mem_num"));
				mVo.setId(rs.getString("id"));
				mVo.setPassword(rs.getString("password"));
				mVo.setGender(rs.getString("gender"));
				mVo.setName(rs.getString("name"));
				mVo.setEmail(rs.getString("email"));
				mVo.setNickname(rs.getString("nickname"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) 		rs.close();
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}return mVo;
	}
	public int confirmID(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;

		String sql = "select password from member where id=?";

		try {
			conn = getConnection(); // DB 연결 시도
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) { // 조회 결과가 있으면 userid가 존재한다는 의미
				result = 1;
			} else {
				// 조회한 결과가 값이 없으므로 userid가 존재하지 않음.
				result = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int insertMember(MemberVO mVo) {
		int result = -1;
		
		String sql = "insert into member values(?, sq_mem_num.nextval, ?, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mVo.getMem_class());
			pstmt.setString(2, mVo.getId());
			pstmt.setString(3, mVo.getPassword());
			pstmt.setString(4, mVo.getGender());
			pstmt.setString(5, mVo.getName());
			pstmt.setString(6, mVo.getEmail());
			pstmt.setString(7, mVo.getNickname());
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			try {
				if(pstmt!=null)		pstmt.close();
				if(conn!=null)		conn.close();				
			}catch(SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
	return result;
	}
    public int updateMember(MemberVO mVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;

		String sql = "update member set getMem_class = ?, getId = ?, getPassword = ?, getGender = ?, getName = ?, getEmail = ?, getNickname = ? where id = ?";

		try {
			conn = getConnection();
			pstmt.setString(1, mVo.getMem_class());
			pstmt.setString(2, mVo.getId());
			pstmt.setString(3, mVo.getPassword());
			pstmt.setString(4, mVo.getGender());
			pstmt.setString(5, mVo.getName());
			pstmt.setString(6, mVo.getEmail());
			pstmt.setString(7, mVo.getNickname());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
    }
}
