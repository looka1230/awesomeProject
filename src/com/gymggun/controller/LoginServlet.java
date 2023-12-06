package com.gymggun.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gymggun.dao.MemberDAO;
import com.gymggun.dto.MemberVO;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "search/login.jsp";		
//		RequestDispatcher dispatcher = request.getRequestDispatcher(url);	// 페이지 이동
//		dispatcher.forward(request,response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "search/login.jsp";		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();		// 브라우저 출력
		
		// 로그인 창에서 입력한 내용
		String id = request.getParameter("id");
		String password = request.getParameter("password");		
		
		MemberDAO mDao = MemberDAO.getInstance();				
		int result = mDao.userCheck(id, password);
		
		if (result == 1) {			
			// 입력한 userid에 관련 정보를 데이터베이스에서 조회
			MemberVO mVo = mDao.getMember(id);
			
			HttpSession session = request.getSession();		// 세션 사용 방법
			session.setAttribute("loginUser", mVo);			// 회원 정보를 세션에 저장
			
			out.print("인증이 완료되었습니다.");			// 회원 전용 페이지로 이동
			url = "index.jsp";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);		// 페이지 이동
		} else if (result == 0 ) {		
			out.print("로그인에 실패하였습니다.");	// 다시 로그인 시도
			response.sendRedirect(url);
		} else {
			out.print("존재하지 않는 회원입니다.");		// 회원 가입 시도
			response.sendRedirect(url);
		}
//		out.println("<script>");
//		out.println("history.back()");
//		out.println("</script>");
		
		
		
		
	}
}
