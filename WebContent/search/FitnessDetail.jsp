<!-- 
ShowFitnessCenterPage
개인 헬스장 페이지를 구현한 내용
jsp파일 이름을 헷갈리게 지어놓음
 -->

<%@page import="com.gymggun.dto.FitnessCenterDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.gymggun.dao.FitnessCenterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="commonFrame.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GYMGGUN 헬스장</title>
    <link rel="stylesheet" href="./css/FitnessDetail.css?ver=1">
    <script src="./css/jquery-3.6.0.min.js"></script>

    <style>
       
    </style>
</head>

<body>
<%
	String mem_class = request.getParameter("mem_class");
	int mem_num = Integer.parseInt(request.getParameter("mem_num"));
	int fc_num = Integer.parseInt(request.getParameter("fc_num"));
	
	MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
	FitnessCenterDAO dao = new FitnessCenterDAO();
	FitnessCenterDTO dto = dao.myFitnessCenterList(mem_class, mem_num, fc_num);
	dao.close();
%>

    <section id="profile">
        <table>
            <tr>
                <td colspan="7"><img class="profileMain" src="Uploads/<%=dto.getImage()%>"></td>
            </tr>
           <!-- <tr>
                 <td><img class="arrow1" src="./images/thanSmall.png"></td>
                <td><img class="profileSub" src="./images/FitnessCenter1.jpg"></td>
                <td><img class="profileSub" src="./images/FitnessCenter2.jpg"></td>
                <td><img class="profileSub" src="./images/FitnessCenter3.jpg"></td>
                <td><img class="profileSub" src="./images/FitnessCenter4.jpg"></td>
                <td><img class="profileSub" src="./images/FitnessCenter5.jpg"></td>
                <td><img class="arrow2" src="./images/thanSmall.png"></td> 
            </tr>-->
        </table>

    </section>
    <section>
        <table>
            <tr id="nameIntro">
                <td><div class="gradient"><h2 id="fitName"><%=dto.getFc_name() %></h2></div></td>
               <!-- <td>
                    <div class="bookmark_image">
                        <img src="./images/blackHeart.png" alt="찜하기버튼1" width="50px">
                        <img src="./images/redHeart.png" alt="찜하기버튼2" width="50px">
                    </div>
                    
                    <div class="bookmark">    
                        <p>찜하기</p>
                    <p>Click</p>
                    </div>
                </td>
                <td><div class="request_join">전속 요청</div>전속버튼</td>
                <td><img src="./images/fourStarRating.png" alt="평점" width="120px" height="20px"></td>-->
            </tr>
            <tr class="content">
                <td colspan="4">
                    <p class="infoContent">
                        <%=dto.getIntroduce() %>
                    </p>
                </td>
            </tr>
        </table> 
        <table>
            <tr>
                <td colspan="2">
                    <div class="gradient"><h2>기본 정보</h2></div>
                </td>
            </tr>
            <tr>
                <td class="content">
                    <p class="infoContent">
                        <span id="left_position">
                            <b class="baseInfo">영업 시간</b><br><br>
                            <b><%=dto.getOpening_time() %></b><br><br>

                            <b class="baseInfo">전화 번호</b><br>
                            <b><%=dto.getPhone_num() %></b><br><br>
                            <b class="baseInfo">헬스장 주소</b><br>
                            <b><%=dto.getAddr() %></b><br><br>
                        </span>
                     <!--   <span id="right_position">
                            <a href="#"><img class="linkIcon" src="./images/homeIcon.png" alt="홈페이지주소"></a><br>
                            <a href="#"><img class="linkIcon" src="./images/instagramIcon.png" alt="인스타그램"></a><br>
                            <a href="#"><img class="linkIcon" src="./images/naverBlogIcon.png" alt="네이버블로그"></a><br>
                        </span>-->
                    </p>

                </td>
 <!--               <td class="content content_second">
                    <p>
                        <b class="baseInfo">편의 시설 및 서비스 정보</b><br><br>
                        <b>주차 3시간 무료</b><br>
                        <b>샤워실 구비</b><br>
                        <b>운동복 무료</b><br>
                        <b>수건 무료</b><br>
                        <b>개인 라커 1개월 11,000원</b>
                        
                        
                    </p>
     
                    

                </td>
            </tr>
        </table>
    </section>

    <section id="scroll_section">
        <div class="gradient"><h2>기구 정보</h2></div>
        <table id="sports_equip">
            <tr>
                <td id="sports_equip_kind">
                    <div id="oblique_line"></div>
                    <div>메이커</div>
                    <div>신체 부위</div>
                </td>
                <td id="body_parts">
                    <a href="#"><p>가슴</p></a>
                    <a href="#"><p>등</p></a>
                    <a href="#"><p>하체</p></a>
                    <a href="#"><p>팔</p></a>
                    <a href="#"><p>어깨</p></a>
                    <a href="#"><p>유산소</p></a>
                    <a href="#"><p>복근</p></a>
                    <a href="#"><p>종합</p></a>
                </td>
            </tr>
            <tr>
                <td id="maker">
                    <a href="#"><h3>MATRIX</h3></a>
                    <a href="#"><h3>BS보스톤</h3></a>
                    <a href="#"><h3>스포플렉스</h3></a>
                    <a href="#"><h3>CYBEX</h3></a>
                    <a href="#"><h3>Life Fitness</h3></a>
                    <a href="#"><h3>Hammer Strength</h3></a>
                </td>
                <td id="sports_equip_info">
                    <ul class="sports_equip_info_list">
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>펙플라이</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>멀티프레스</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>컨버징체스트프레스</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>벤치프레스</p>
                            </div>
                        </li>
                    </ul>
                    <ul class="sports_equip_info_list">
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>해머벤치</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>멀티벤치</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>해머인클라인벤치</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>인클라인벤치</p>
                            </div>
                        </li>
                    </ul>
                    <ul class="sports_equip_info_list">
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>슈파인벤치</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>해머디클라인벤치</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>디클라인벤치</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>인클라인프레스</p>
                            </div>
                        </li>
                    </ul>
                    <ul class="sports_equip_info_list">
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>체스트프레스</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>버터플라이</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>펙플라이</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>체스트웨이트</p>
                            </div>
                        </li>
                    </ul>
                    <ul class="sports_equip_info_list">
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>시티드체스트프레스머신</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>인클라인벤치</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>올림픽디클라인벤치</p>
                            </div>
                        </li>
                        <li class="item">
                            <div class="thumbnail">
                                <img src="http://placehold.it/90x90" alt="">
                            </div>
                            <div class="description">
                                <p>올림픽인클라인벤치</p>
                            </div>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
        
    </section >

    <section id="have_trainer">
        <div class="gradient"><h2>트레이너 정보</h2></div>
        <ul>
            <li>
                <a href="#">
                    <div id="trainer_profile">
                        <img src="./images/Trainer1.jpg" alt="트레이너">
                    </div>
                </a>
                <div id="trainer_career">
    
                    <ul>
                        <li>
                            <h3>경력 및 이력</h3>
                        </li>
                        <li>현)피트니스 연구소</li>
                        <li>전)레몬짐 용현점</li>
                        <li>전)바디메이커</li>
                        <li>전)일렉트릭 스튜디오</li>
                    </ul>
                </div>
                <div id="trainer_award">
                    <ul>
                        <li>스포츠지도자 보디빌딩 2급</li>
                        <li>TX 자격증</li>
                        <li>CRS 자격증</li>
                        <li>바디메카닉 CRS 수료</li>
                        <li>스포츠마사지 1급</li>
                        <li>박시현 근육학 아카데미 과정 수료</li>
                        <li>이영진 소도구 메디칼 아카데미 과정 수료</li>
                        <li>2017 인천총구배 보디빌딩대회 스포츠모델 남자 1위</li>
                    </ul>
                </div>
                <div id="trainer_name">
                    <span>
                        <strong>
                            백준현 트레이너
                        </strong>
                    </span>
                    <br>
                </div>
    
            </li>
        </ul>
    </section>

    <section id="review">
        <div class="gradient"><h2>헬스장 리뷰</h2></div>
        <div id="review_header">
            <p id="star_rating">4.5</p>
            <div id="star_rating_image">
                <img src="./images/fourStarRating.png" alt="평점" width="150px">
                <span>5개의 리뷰</span>
            </div>
            <a href="#">
                <div id="review_writer">
                    <img src="./images/pencil1.png" alt="글쓰기아이콘" width="30px">
                    <div>리뷰 작성하기</div>
                </div>
            </a>
            <a href="#">
                <div id="review_filter">
                    <div>최신순 ⯆</div>
                </div>
            </a>
        </div>
        <div id="review_content">
            <div class="reviews">
                <span>닉네임&nbsp;<sup>2021.12.14</sup></span>
                <img src="./images/fourStarRating.png" alt="개인 평점">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                </p>
        
            </div>
            <div class="reviews">
                <span>닉네임&nbsp;<sup>2021.12.14</sup></span>
                <img src="./images/fourStarRating.png" alt="개인 평점">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                    
                </p>
        
            </div>
            <div class="reviews">
                <span>닉네임&nbsp;<sup>2021.12.14</sup></span>
                <img src="./images/fourStarRating.png" alt="개인 평점">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                </p>
        
            </div>
            <div class="reviews">
                <span>닉네임&nbsp;<sup>2021.12.14</sup></span>
                <img src="./images/fourStarRating.png" alt="개인 평점">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                </p>
            
                </div>
                <div class="reviews">
                <span>닉네임&nbsp;<sup>2021.12.14</sup></span>
                <img src="./images/fourStarRating.png" alt="개인 평점">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                </p>
        
            </div>
            <div class="reviews">
                <span>닉네임&nbsp;<sup>2021.12.14</sup></span>
                <img src="./images/fourStarRating.png" alt="개인 평점">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis accusantium omnis enim maxime ex quisquam
                    pariatur
                    eligendi illo sapiente deserunt ipsam qui quasi autem, quis maiores eum similique? Rem, mollitia!
                </p>
        
            </div>
        </div>
        <div id="review_footer">
            <div class="more_button">
                <p>+ 더 보기</p>
            </div>
            <div class="up_button">
                <a href="#"><img src="./images/up-arrow.png" alt="맨 위로" width="100px"></a>
            </div>
        </div>
    </section>-->
 <!--  <section id="map">
            <a href="https://map.kakao.com/?urlX=479231&urlY=1115853&urlLevel=3&map_type=TYPE_MAP&map_hybrid=false" target="_blank"><img width="680" height="310"
                src="https://map2.daum.net/map/mapservice?FORMAT=PNG&SCALE=2.5&MX=479231&MY=1115853&S=0&IW=504&IH=310&LANG=0&COORDSTM=WCONGNAMUL&logo=kakao_logo" style="border:1px solid #ccc;position:relative;left:0px"></a>
            <div class="hide" style="overflow:hidden;padding:7px 11px;border:1px solid #dfdfdf;border-color:rgba(0,0,0,.1);border-radius:0 0 2px 2px;background-color:#f9f9f9;width:685px;"><strong style="float: left;"><img
                  src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵"></strong>
                <div style="float: right;position:relative"><a style="font-size:12px;text-decoration:none;float:left;height:15px;padding-top:1px;line-height:15px;color:#000" target="_blank"
                  href="https://map.kakao.com/?urlX=479231&urlY=1115853&urlLevel=3&map_type=TYPE_MAP&map_hybrid=false">지도 크게 보기</a></div>
            </div>
    </section>-->

    <script type="text/javascript" src="./js/FitnessDetail.js"></script>
</body>

</html>