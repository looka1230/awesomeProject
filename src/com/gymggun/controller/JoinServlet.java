package com.gymggun.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gymggun.dao.MemberDAO;
import com.gymggun.dto.MemberVO;

@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("search/joinEx.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
				
		String mem_class = request.getParameter("mem_class");	
//		String mem_num = request.getParameter("mem_num");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		
		System.out.println("mem_class: " + mem_class);
//		System.out.println("mem_num: " + mem_num);
		System.out.println("id: " + id);
		System.out.println("password: " + password);
		System.out.println("gender: " + gender);
		System.out.println("name: " + name);
		System.out.println("email: " + email);
		System.out.println("nickname: " + nickname);		
		
		MemberVO mVo = new MemberVO();
			
		mVo.setMem_class(mem_class);
		mVo.setId(id);
		mVo.setPassword(password);
		mVo.setGender(gender);
		mVo.setName(name);
		mVo.setEmail(email);
		mVo.setNickname(nickname);
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.insertMember(mVo);
		System.out.println("result: "+ result);
		
		HttpSession session = request.getSession(); //세션 사용 방법
		
		if (result == 1) {
			request.setAttribute("message", "회원 가입이 완료 되었습니다");
		} else {
			request.setAttribute("message", "회원 가입에 실패했습니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("search/main.jsp");
		dispatcher.forward(request, response);
		}
}
