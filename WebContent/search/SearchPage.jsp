<!-- 
헬스장/트레이너 검색 페이지
 -->

<%@page import="com.gymggun.dto.TrainerDTO"%>
<%@page import="com.gymggun.dao.TrainerDAO"%>
<%@page import="com.gymggun.dto.FitnessCenterDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.gymggun.dao.FitnessCenterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="SearchPageHeader.jsp" %>
<%
//DB 연결
FitnessCenterDAO fcDAO = new FitnessCenterDAO();
TrainerDAO tDAO = new TrainerDAO();

//사용자가 입력한 검색 조건 저장
Map<String, Object> param = new HashMap<String, Object>();
String searchWord = request.getParameter("searchWord");
if (searchWord != null){
	param.put("searchWord", searchWord);
}

//int fc_totalCount = fcDAO.selectCount(param);	//조건에 맞는 헬스장 숫자 확인
//int t_totalCount = tDAO.selectCount(param);		//조건에 맞는 트레이너 숫자 확인
List<FitnessCenterDTO> fcList = fcDAO.selectList(param);	//헬스장 목록 받기
List<TrainerDTO> tList = tDAO.selectList(param);	//트레이너 목록 받기
//DB값 변수에 저장한 후
fcDAO.close();	
tDAO.close();	//연결 끊기
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>헬스장/트레이너 검색</title>
    <!-- 초기화 코드 -->
    <style>
*{
    margin:0; padding: 0
}
a{
    text-decoration: none;
    color:black;
}
a:visited{
    color:black;
}
li{
    list-style: none;
}
image{
    border-width:0;
}
    </style>
    <!-- navbar -->
    <style>
        #main_wrap{
            width:1200px;
            
            margin:0 auto;
        }
        /* 메인 탭 */
        #search_gnb{
            overflow: hidden;
            width:900px;
            margin:0 auto;
            border:2px solid black;
            background:	#DCDCDC;
        }
        .search_tab{
            display:block;
            float:left;
            text-align:center;
            width:calc(50% - 10px);
            margin:5px;
            border:2px solid black;
            border-radius: 10px;
            box-sizing: border-box;
            padding:15px;
            cursor: pointer;
            background:white;
        }
        #main_wrap > input[type=radio]{
            display:none;
        }
        #health_search_list, #trainer_search_list{
            display:none;
        }
        #main_wrap > input:nth-of-type(1):checked ~ #search_gnb > 
        .search_tab:nth-child(1){
            background-color:orange;
            color:white;
        }
        #main_wrap > input:nth-of-type(1):checked ~ #health_search_list{
            display:block;
        }
        #main_wrap > input:nth-of-type(2):checked ~ #search_gnb > 
        .search_tab:nth-child(2){
            background-color: orange;
            color:white;
        }
        #main_wrap > input:nth-of-type(2):checked ~ #trainer_search_list{
            display:block;
        }
        /* 서브 탭 
        #search_lnb{
            width:70%;
            margin:0 auto;
            box-sizing: border-box;
            margin-top:20px;
        }
        #search_lnb > form{
            overflow: hidden;
        }
        #search_lnb > form > input{
            display:block;  
            float:left;
            padding:10px;
            width:25%;
            cursor: pointer;
            background: inherit ;  border:1px solid black;
        }
        #search_lnb > form > input:hover{
            background: rgb(255, 200, 0);
        }*/
    </style>
    <!-- content 리스트 -->
    <style>
        /* 헬스장/트레이너 list */
        #health_search_list, #trainer_search_list{
            margin-top: 20px;
            padding:20px;
            overflow: hidden; 
        }
        /* 2열 종대의 list view */
        .health_content, .trainer_content{
            float:left;
            overflow: hidden;
            width:550px;
        }
        /* 헬스장 content 설정 */
        .fitness_center_image{
            float:left;
            width:150px;
            height:200px;
            display:block;
        }
        .fitness_center_article{
            float:left;
            width:350px;
            height:200px;
            padding:10px;
            box-sizing: border-box;
        }
        .fitness_center_article > a > h2{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        /* 트레이너 content 설정 */
        .trainer_image{
            float:left;
            width:150px;
            height:200px;
            display:block;
        }
        .trainer_article{
            float:left;
            width:350px;
            height:200px;
            padding:10px;
            box-sizing: border-box;
        }
        .trainer_article > a > h2{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .star_score{
            /* 스프라이트 이미지 간격 25px */
            width: 115px; height: 25px;
            /*background: url('./images/sprite-star-def.png') 0px -175px;
            background-repeat:no-repeat;*/
        }
    </style>
    <!-- 더 보기, 위로 버튼 -->
    <style>
        #buttons{
            position:relative;
            height:100px;
            margin-top:100px;
        }
        #moreView_button{
            position: absolute;
            left:50%;
            transform: translateX(-60px);
        }
        #moreView_button > a{
            display:block;
            font-size:20px;
            font-weight: bold;
            border: 2px solid black;
            width:120px;
            text-align:center;
            height:45px;
            line-height:45px;
            float:left;
        }
        #moveTop_button{
            position:absolute;
            float:right;
            right:0px;
        }
        #moveTop_button > a > img{
            width:80px;
        }
    </style>
    
</head>
<body>
	<!-- 메인 탭: 헬스장/트레이너 검색 -->
    <div id="main_wrap">
        <input type="radio" name="tab" id="health_tab" checked>
        <input type="radio" name="tab" id="trainer_tab">
        <nav id="search_gnb">
            <label class="search_tab" for="health_tab">헬스장 검색</label>
            <label class="search_tab" for="trainer_tab">트레이너 검색</label>
        </nav>
        <!-- 서브 탭: 헬스장/트레이너 정렬 순서 버튼
        <nav id="search_lnb">
            <form action="" method="get">
                <input type="submit" name="order_insert" value="등록된 순">
                <input type="submit" name="order_many_review" value="리뷰 많은 순">
                <input type="submit" name="order_high_score" value="평점 높은 순">
                <input type="submit" name="order_many_bookmark" value="찜 많은 순">
            </form>
        </nav>
        -->
        <!-- 헬스장 리스트 -->
        <section id="health_search_list">
        <%
        //검색한 헬스장 데이터가 한 개도 없을 때
        if(fcList.isEmpty()){
        %>
        	<h2 style="text-align:center">검색 결과 해당되는 헬스장이 존재하지 않습니다.</h2>
        <%
      	//헬스장 데이터가 존재할 때
        } else {
        	
        	for(int i = 0; i<fcList.size();i+=2){
        		FitnessCenterDTO dto = fcList.get(i);
        		String fc_url = "FitnessDetail.jsp?mem_class="+dto.getMem_class()
                        +"&mem_num="+dto.getMem_num()+"&fc_num="+dto.getFc_num();
        		
        %>	
            <div class="health_content">
                <a href="<%=fc_url %>">
                	<img src="Uploads/<%=dto.getImage() %>" class="fitness_center_image">
                </a>
                <div class="fitness_center_article">
                    <a href="<%=fc_url %>">
                    	<h2><%=dto.getFc_name() %></h2>
                    </a>
                    <div class="star_score"></div>
                    <a href="<%=fc_url %>">
                        <p>
                            <%=dto.getIntroduce() %>
                        </p>
                    </a>
                </div>
            </div>
        <%
       		}
        	for(int i = 1; i<fcList.size();i+=2){
        		FitnessCenterDTO dto = fcList.get(i);
        		String fc_url = "FitnessDetail.jsp?mem_class="+dto.getMem_class()
                +"&mem_num="+dto.getMem_num()+"&fc_num="+dto.getFc_num();
        %>
            <div class="health_content">
                <a href="<%=fc_url %>">
                	<img src="Uploads/<%=dto.getImage() %>" class="fitness_center_image" />
                </a>
                <div class="fitness_center_article">
                    <a href="<%=fc_url %>"><h2><%=dto.getFc_name() %></h2></a>
                    <div class="star_score"></div>
                    <a href="<%=fc_url %>">
                        <p>
                            <%=dto.getIntroduce() %>
                        </p>
                    </a>
                </div>
            </div>
        
        
        <%
        	}
        }
        %>
        </section>
        <!-- 트레이너 리스트 -->
        <section id="trainer_search_list">
        <%
      //검색한 트레이너 데이터가 한 개도 없을 때
        if(tList.isEmpty()){
        %>
        	<h2 style="text-align:center">검색 결과 해당되는 트레이너가 존재하지 않습니다.</h2>
        <%
      	//트레이너 데이터가 존재할 때
        } else {
        	for(int i = 0; i<tList.size();i+=2){
        		TrainerDTO dto2 = tList.get(i);
        		String t_url = "TrainerDetail.jsp?mem_class="+dto2.getMem_class()
                +"&mem_num="+dto2.getMem_num();
        %>
        
            <div class="trainer_content">
                <a href="<%=t_url %>"><img src="Uploads/<%=dto2.getImage() %>" class="trainer_image"></a>
                <div class="trainer_article">
                    <a href="<%=t_url %>"><h2><%=dto2.getName() %></h2></a>
                    <div class="star_score"></div>
                    <a href="<%=t_url %>">
                        <p>
                            <%=dto2.getIntroduce() %>
                        </p>
                    </a>
                </div>
            </div>
            <%
       		}
        	for(int i = 1; i<tList.size();i+=2){
        		TrainerDTO dto2 = tList.get(i);
        		String t_url = "TrainerDetail.jsp?mem_class="+dto2.getMem_class()
                +"&mem_num="+dto2.getMem_num();
        	%>
            <div class="trainer_content">
                <a href="<%=t_url %>"><img src="Uploads/<%=dto2.getImage() %>" class="trainer_image"></a>
                <div class="trainer_article">
                    <a href="<%=t_url %>"><h2><%=dto2.getName() %></h2></a>
                    <div class="star_score"></div>
                    <a href="<%=t_url %>">
                        <p>
                            <%=dto2.getIntroduce() %>
                        </p>
                    </a>
                </div>
            </div>
        <%
        	}
        }
        %>
        </section>
        <section id="buttons">
        <!--  
            <div id="moreView_button">
                <a href="#">+ 더 보기</a>
            </div>-->
            <div id="moveTop_button">
                <a href="#"><img src="./images/up-arrow.png" alt=""></a>
            </div>
        </section>
    </div>
    
</body>
</html>