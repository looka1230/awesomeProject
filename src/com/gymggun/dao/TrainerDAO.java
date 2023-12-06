package com.gymggun.dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.gymggun.dto.FitnessCenterDTO;
import com.gymggun.dto.MemberVO;
import com.gymggun.dto.TrainerDTO;

import common.JDBConnect;

public class TrainerDAO extends JDBConnect{
	
	public TrainerDAO() {
		super();
	}
	
	//검색 조건에 맞는 게시물의 수 반환(더 보기 버튼에서 활용)
	/*public int selectCount(Map<String, Object> map) {
		int totalCount = 0; //결과(게시물 수)를 담을 변수
		
		//게시물 수를 얻어오는 쿼리문
		String sql = "select * from trainer";
		if(map.get("searchWord") != null) {
			sql += " where name like '%" + map.get("searchWord")+"%'";
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println("트레이너 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}*/
	
	public List<TrainerDTO> selectList(Map<String, Object> map){
		//
		List<TrainerDTO> tl = new Vector<TrainerDTO>(); //트레이너 리스트를 담을 변수
		
		String sql = "select * from trainer";
		if(map.get("searchWord") != null) {
		//select * from trainer where name like '%searchWord%'
			sql += " where name like '%"+map.get("searchWord")+"%'";
		}
		sql += " order by mem_num desc";
		
		try {
			stmt = conn.createStatement();	//쿼리문 생성
			rs = stmt.executeQuery(sql);	//쿼리문 실행
			while(rs.next()) {
				TrainerDTO dto = new TrainerDTO();
				dto.setMem_class(rs.getString("mem_class"));
				dto.setMem_num(Integer.parseInt(rs.getString("mem_num")));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setPhone_num(rs.getString("phone_num"));
//				dto.setWorking_time(rs.getString("working_time"));
//				dto.setBookmark_count(Integer.parseInt(rs.getString("bookmark_count")));
//				dto.setUrl_addr(rs.getString("url_addr"));
//				dto.setBlog_addr(rs.getString("blog_addr"));
//				dto.setInsta_addr(rs.getString("insta_addr"));
				dto.setImage(rs.getString("image"));
//				dto.setRatings(Double.parseDouble(rs.getString("ratings")));
				dto.setAwards(rs.getString("awards"));
				dto.setIntroduce(rs.getString("introduce"));
				
				tl.add(dto);
			}
		} catch(Exception e) {
			System.out.println("트레이너 조회 중 예외 발생");
			e.printStackTrace();
		}
		return tl;
	}
	
	public int insertFile(TrainerDTO dto, MemberVO mvo) {
		
		int result = 0;
		
		try {
			//MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
			// 아래 sql문에 mvo객체 그대로 넣으면 작은따옴표 적용이 안된 상태로 들어간다.
			//그래서 ''로 감싸줘야 된다.
			
			String sql = "insert into trainer("
			+ "mem_class, mem_num, name, addr, phone_num, awards, image, introduce)"
			+ " values('"+mvo.getMem_class()+"', "+mvo.getMem_num()+", ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getPhone_num());
			pstmt.setString(4, dto.getAwards());
			pstmt.setString(5, dto.getImage());
			pstmt.setString(6, dto.getIntroduce());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("헬스장 등록 중 예외 발생");
			e.printStackTrace();
		}
		return result;	//1 = 성공, 0 = 실패
	}
	
	// 헬스장 데이터 반환
		public TrainerDTO myTrainerList(String mem_class, int mem_num){
			//디버그용
			int result = 0;
			TrainerDTO dto = new TrainerDTO();
			
			String sql = "select name, addr, phone_num, awards, image, introduce"
					+ " from trainer where mem_class = '"+mem_class
					+ "' and mem_num = "+mem_num;
			
			try {
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					if(rs.next()) {
						dto.setName(rs.getString("name"));
						dto.setAddr(rs.getString("addr"));
						dto.setPhone_num(rs.getString("phone_num"));
						dto.setAwards(rs.getString("awards"));
						dto.setImage(rs.getString("image"));
						dto.setIntroduce(rs.getString("introduce"));
					}
					
			} catch (Exception e) {
				System.out.println("select 시 예외 발생");
				e.printStackTrace();
			}
			return dto;
		}
	
}
