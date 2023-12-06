package com.gymggun.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gymggun.dao.MemberDAO;
import com.gymggun.dto.MemberVO;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/memberUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.getMember("id");
		
		request.setAttribute("mVo", mVo);
		request.getRequestDispatcher("search/memberUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		MemberVO mVo = new MemberVO();
		
		

//		String mem_class = request.getParameter("mem_class");
//		private int mem_num;
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		
		
		MemberDAO mDao = MemberDAO.getInstance();

//		mVo.setMem_class(mem_class);
//		mVo.setMem_num(rs.getInt("mem_num"));
		mVo.setId(id);
		mVo.setPassword(password);
		mVo.setGender(gender);
		mVo.setName(name);
		mVo.setEmail(email);
		mVo.setNickname(nickname);
	

		mDao.updateMember(mVo);
		
		response.sendRedirect("login.do");
		
	}

}
