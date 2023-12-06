<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 Connection conn = null;
 Statement stmt = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;

	String saveDirectory = application.getRealPath("/search/FitnessDetail/Upload"); //저장할 디렉터리
	int maxPostSize = 10*1024*1024; //파일 최대 크기 10MB(byte 단위)
	String encoding = "UTF-8"; //인코딩 방식
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	
	try{
		/* 데이터 베이스 연결 */
		Class.forName("oracle.jdbc.OracleDriver");
		
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "gymggun_user";
		String pwd = "1234";
		conn = DriverManager.getConnection(url, id, pwd);
		
		//request객체를 대신할 MultipartRequest 객체 생성
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		//파일 이름 가져옴
		String fileName = mr.getFilesystemName("attachedFile"); 
		//이름, 제목, 카테고리 값 가져옴
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String[] cateArray = mr.getParameterValues("cate");
		//카테고리 문자열 저장소 StringBuffer()
		StringBuffer cateBuf = new StringBuffer();
		if(cateArray == null){
			cateBuf.append("선택 없음");
		} else {
			for(String s:cateArray){
				cateBuf.append(s+", ");
			}
		}
		//쿼리문 실행
		String sql = "insert into myfile values(seq_board_num.nextval, ?, ?, ?, ?, sysdate)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, cateBuf.toString());
		pstmt.setString(4, fileName);
		
		pstmt.executeUpdate();
		
		//response.sendRedirect("FileList.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
		//오류 발생시 FileUploadMain.jsp로 포워드 이동
		request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}
	
%>
</body>
</html>