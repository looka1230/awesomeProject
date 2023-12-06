<!-- 
헬스장 등록 페이지 폼에서 입력된 데이터를
데이터베이스에 저장하는 기능을 구현한 코드
 -->
<%@page import="com.gymggun.dto.MemberVO"%>
<%@page import="com.gymggun.dao.FitnessCenterDAO"%>
<%@page import="com.gymggun.dto.FitnessCenterDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
</head>
<body>
<%
//객체 초기화
 Connection conn = null;
 Statement stmt = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;

	String saveDirectory = application.getRealPath("/search/Uploads"); //저장할 디렉터리
	int maxPostSize = 10*1024*1024; //파일 최대 크기 10MB(byte 단위)
	String encoding = "UTF-8"; //인코딩 방식
%>

<%
	
	
	try{
		if(session.getAttribute("loginUser") == null){
			System.out.print("로그인 상태가 아니다.");
		}
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		
		//1. 이미지를 저장할 MultipartRequest 객체 생성
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		//2. 새로운 파일명 생성
		String fileName = mr.getFilesystemName("image"); //서버에 저장된 파일 이름 얻어 옴,  파라미터는 폼에서 전달받은 이미지 name값
		String ext = fileName.substring(fileName.lastIndexOf("."));	//파일 확장자
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now + ext;	//새로운 파일 이름 생성("업로드일시.확장자")
		
		//3. 파일명 변경
		File oldFile = new File(saveDirectory + File.separator + fileName);
		File newFile = new File(saveDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		//4. 이미지를 제외한 헬스장 등록 페이지 폼 값 받기
		String fc_name = mr.getParameter("fc_name");
		String[] addr = mr.getParameterValues("addr");
		String[] phone_num = mr.getParameterValues("tel");
		String[] opening_time = mr.getParameterValues("opening_time");
		String introduce = mr.getParameter("introduce");
		
		// 문자열 배열을 StringBuffer()에 한 문장으로 저장 
		StringBuffer addrBuf = new StringBuffer();
		StringBuffer phone_numBuf = new StringBuffer();
		StringBuffer opening_timeBuf = new StringBuffer();
		
		if(addr != null){
			for(String s:addr){
				addrBuf.append(s+" ");
			}
		} else {
			System.out.println("addr null이다");
		}
		
		if(phone_num != null){
			phone_numBuf.append(phone_num[0]+"-");
			phone_numBuf.append(phone_num[1]+"-");
			phone_numBuf.append(phone_num[2]);
		} else {
			System.out.println("phone_num null이다");
		}
		if(opening_time != null){
			opening_timeBuf.append("평일: "+opening_time[0]+"\n");
			opening_timeBuf.append("토요일: "+opening_time[1]+"\n");
			opening_timeBuf.append("일요일 및 공휴일: "+opening_time[2]);
		} else {
			System.out.println("opening_time null이다");
		}
		
		//검사
		System.out.println(fc_name);
		System.out.println(addrBuf.toString());
		System.out.println(phone_numBuf.toString());
		System.out.println(opening_timeBuf.toString());
		System.out.println(newFileName);
		System.out.println(introduce);
		
		//5. DTO 생성
		FitnessCenterDTO dto = new FitnessCenterDTO();
		dto.setFc_name(fc_name);
		dto.setAddr(addrBuf.toString());
		dto.setPhone_num(phone_numBuf.toString());
		dto.setOpening_time(opening_timeBuf.toString());
		dto.setImage(newFileName);
		dto.setIntroduce(introduce);
		
		
		//6. DAO를 통해 데이터베이스에 반영
		FitnessCenterDAO dao = new FitnessCenterDAO();
		int debug = dao.insertFile(dto, mvo);
		if(debug == 0){
			System.out.print("데이터베이스에 넣을 때 오류 발생한거다.");
		}
		dao.close();
		
		//7. index로 리다이렉션
		response.sendRedirect("../index.jsp");
		
	}catch(NullPointerException e){
		System.out.print("NullPointerException 오류발생");
		e.printStackTrace();
		request.setAttribute("errorMessage", "널 오류");
		request.getRequestDispatcher("FitnessCenterForm.jsp").forward(request, response);
	}catch(Exception e){
		System.out.print("모르는 오류발생");
		e.printStackTrace();
		//오류 발생시 FitnessCenterForm.jsp로 포워드 이동
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("FitnessCenterForm.jsp").forward(request, response);
	}
	
%>

</body>
</html>
