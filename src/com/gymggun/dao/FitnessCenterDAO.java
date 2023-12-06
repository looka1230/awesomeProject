package com.gymggun.dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import com.gymggun.dto.FitnessCenterDTO;
import com.gymggun.dto.MemberVO;

import common.JDBConnect;

//헬스장 데이터베이스 연동 클래스
public class FitnessCenterDAO extends JDBConnect{
	
	public static final int rNum = 20; 
	//공통된 데이터베이스 연결 클래스 JDBConnect 생성자 불러옴
	public FitnessCenterDAO() {
		super();
	}
	
	//검색 조건에 맞는 헬스장의 개수 반환 메소드
	/*public int selectCount(Map<String, Object> map) {
		int totalCount = 0;		//검색 결과 게시물의 갯수를 담을 변수
		
		
		//검색 조건에 맞는 헬스장의 개수를 찾는 sql문(더 보기 버튼에서 활용)
		String sql = "select count(*) from fitness_center";
		if(map.get("searchWord") != null) {
			//select count(*) from fitness_center where fc_name like '%searchWord%'
			sql += " where fc_name like '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1); 
			
		} catch(Exception e) {
			System.out.println("헬스장 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}*/
	//검색 조건에 맞는 헬스장 목록 반환 메소드
	public List<FitnessCenterDTO> selectList(Map<String, Object> map){
		//헬스장 목록을 담을 변수
		List<FitnessCenterDTO> fcl = new Vector<>();
		
		String sql = "select * from fitness_center";
		if(map.get("searchWord") != null) {
			//select * from fitness_center where fc_name like '%searchWord%'
			sql += " where fc_name like '%" + map.get("searchWord") + "%'";
		}
		sql += " order by fc_num desc";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			
			while(rs.next()) {	//행이 없을 때까지 반복 => 모든 데이터 출력
				//한 행(헬스장 하나)의 내용을 dto에 저장
				FitnessCenterDTO dto = new FitnessCenterDTO();
				dto.setMem_class(rs.getString("mem_class"));
				dto.setMem_num(Integer.parseInt(rs.getString("mem_num")));
				dto.setFc_num(Integer.parseInt(rs.getString("fc_num")));
				dto.setFc_name(rs.getString("fc_name"));
				dto.setAddr(rs.getString("addr"));
				dto.setPhone_num(rs.getString("phone_num"));
				dto.setOpening_time(rs.getString("opening_time"));
//				dto.setBookmark_count(rs.getString("bookmark_count"));
//				dto.setUrl_addr(rs.getString("url_addr"));
//				dto.setBlog_addr(rs.getString("blog_addr"));
//				dto.setInsta_addr(rs.getString("insta_addr"));
				dto.setImage(rs.getString("image"));
//				dto.setRatings(Double.parseDouble(rs.getString("ratings")));
//				dto.setBusiness_num(rs.getString("business_num"));
				dto.setIntroduce(rs.getString("introduce"));
				
				//결과 목록에 저장
				fcl.add(dto);
			}
		} catch(Exception e) {
			System.out.println("헬스장 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return fcl;
	}
	//헬스장 등록
	public int insertFile(FitnessCenterDTO dto, MemberVO mvo) {
		//디버그용 변수
		int result = 0;
		
		try {
			//MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
			// 아래 sql문에 mvo객체 그대로 넣으면 작은따옴표 적용이 안된 상태로 들어간다.
			//그래서 ''로 감싸줘야 된다.
			
			String sql = "insert into fitness_center("
			+ "mem_class, mem_num, fc_num, fc_name, addr, phone_num, opening_time, image, introduce)"
			+ " values('"+mvo.getMem_class()+"', "+mvo.getMem_num()+", sq_fc_num.nextval, "
			+ "?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getFc_name());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getPhone_num());
			pstmt.setString(4, dto.getOpening_time());
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
	public FitnessCenterDTO myFitnessCenterList(String mem_class, int mem_num, int fc_num){
		//디버그용
		int result = 0;
		FitnessCenterDTO dto = new FitnessCenterDTO();
		
		String sql = "select fc_name, addr, phone_num, opening_time, image, introduce"
				+ " from fitness_center where mem_class = '"+mem_class
				+ "' and mem_num = "+mem_num
				+ " and fc_num = "+fc_num;
		
		try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					dto.setFc_name(rs.getString("fc_name"));
					dto.setAddr(rs.getString("addr"));
					dto.setPhone_num(rs.getString("phone_num"));
					dto.setOpening_time(rs.getString("opening_time"));
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
