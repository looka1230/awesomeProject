<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mypage Header</title>

    <style>
        /* 초기화 */
        @font-face {
            font-family: "jua";
            src: url("./fonts/BMJUA_ttf.ttf");
        }

        * {
            font-family: "jua";
            margin: 0px;
            padding:0;
        }

        
        a:link {
            color: black;
            text-decoration: none;
        }

        a:visited {
            color: black;
            text-decoration: none;
        }

        a:hover {
            color: black;
            text-decoration: none;
        }
        li{
            list-style: none;
        }
        /* 전체 */
        #wrap{
        overflow: hidden;
        margin: 0 auto;
      	}
        /* 헤더 */
        #cf_main_header{
          min-width: 300px; /* 뷰(브라우저를 줄일 수 있는) 최소 길이 */
          height:135px;
          width: 100%;
          margin:0 auto;
          position:relative;
          border-bottom:3px solid black;
          background-color:white;
        }
        /* 로고 */
        #cf_logo {
            position: absolute;
            display: block;
            top: 15px;
        }
        #cf_logo > img{
            width: 220px;
            height:110px;
        }
        /* 검색 창 */
        #cf_searchBox {
            width:300px;
            position: absolute;
            overflow: hidden;
            left:50%;
            transform: translate(-150px, 50px);
        }

        #cf_searchBox > input[type=text]{
            font-size: 23px;
            border: 2px solid grey;
            border-radius: 20px;
            height: 36px;
            width: 222px;
            padding-left: 10px;
            padding-right: 10px;
            display:block;
            float:left;
            margin-right:10px;
        }

        #cf_search_submit {
            background-image: url('images/search.png');
            background-repeat: no-repeat;
            background-size: 25px 25px;
            background-position: 5px 5px;
            width:40px;
            height: 40px;
            border: 2px solid black;
            border-radius: 25px;
            background-color: black;
            padding-left: 5px;
            display:block;
            float:left;
            cursor:pointer;
        }
        /* 메뉴(내브바) */
        #cf_main_gnb {
            position:absolute;
            right:0px;
            bottom:10px;
        }
        #cf_main_gnb > ul {
            overflow:hidden;
        }
        #cf_main_gnb > ul > li{
            float:left;
            font-size:22px;
            padding-left:10px;
            margin-right:20px;
        }

        #cf_main_gnb > ul > li > a:hover{
            color:red;
        }
        
        /* 서브 메뉴(서브 네브바) */
        #cf_main_lnb {
            position:absolute;
            right:0;
            top:20px;
        }

        #cf_main_lnb > ul  {
            overflow: hidden;
        }

        #cf_main_lnb > ul > li {
            float:left;
        }

        #cf_main_lnb > ul > li > a {
            margin-right:20px;
        }

        #cf_main_lnb > ul > li > a:hover{
            color:red;
        }

        /* 사이드 메뉴 */
        .cf_side_gnb:hover, .cf_side_lnb:hover{
          color:red;
        }
        
        /* 헤더 아래 전체 */
        #content_wrap{
        	overflow: hidden;
            margin-right:-200px;
            background-color:#EB9900;
            height:1000px;
        }
      	/* 마이페이지 사이드 메뉴 */
        #mypage_registration_aside{
          position:absolute;
          float:left;
          width: 200px;
          
        }
        #mypage_registration_aside > dl > dt > a{
          float:left;
          width:200px;
          display:block;
          padding:30px;
          font-size: 20px;
          border-bottom: 2px solid #D4760B;
          border-top:2px solid #D4A20B  
        }
        #mypage_registration_aside > dl > dt > a:hover{
        	color:red;
        }
        /* 마이페이지 컨텐츠 section */
		#content{
			float:left;
			background-color:white;
            width:100%;
            height:1000px;
            margin-left:260px;
            padding-right:200px;
            border-left:1px solid black;
            padding-top:10px;
            padding-left:10px;
		}
    </style>
</head>

<body>
  <div id="wrap">
    <header>
        <nav id="cf_main_header">
            <a id="cf_logo" href="index.jsp"><img src="./images/Logo.jpg" alt="로고" width="200px" height="100px"></a>
            
            <!-- 검색 창 -->
        	<!--<form id="cf_searchBox" method="get" action="">
                <input type="text" name="searchWord"> 
                <input id="cf_search_submit" type="submit" value="">
            </form>-->

            <div id="cf_main_gnb">
                <ul>
                    <li><a href="SearchPage.jsp">검색</a></li>
                    <li><a href="#">커뮤니티</a></li>
                </ul>
            </div>
            <div id="cf_main_lnb">
                <ul>
                    <li><a href="login.jsp">로그인</a></li>
                    <li><a href="joinEx.jsp">회원가입</a></li>
                </ul>
            </div>
        </nav>
    </header>
    
    <div id="content_wrap">
	    <aside id="mypage_registration_aside">
	        <dl>
	            <a href="#"></a>
	            <dt><a href="memberUpdate.jsp" id="selected">내 정보 수정</a></dt>
	            <dt><a href="FitnessCenterForm.jsp">헬스장 정보 관리</a></dt>
	            <dt><a href="TrainerForm.jsp">트레이너 정보 관리</a></dt>
	            <!-- <dt><a href="#">즐겨찾기</a></dt>
	            <dt><a href="#">작성게시물</a></dt> -->
	            <dt><a href="#">회원탈퇴</a></dt>
	        </dl>
	    </aside>
	    <!--  사이드 메뉴
	    <aside>
	        <dl>
	            <dt><a class="cf_side_gnb" href="#">헬스타그램</a></dt>
	            <dd><a class="cf_side_lnb" href="#">one</a></dd>
	            <dd><a class="cf_side_lnb" href="#">two</a></dd>
	            <dd><a class="cf_side_lnb" href="#">three</a></dd>
	            <dd><a class="cf_side_lnb" href="#">four</a></dd>
	            <dt><a class="cf_side_gnb" href="#" class="selected">자유게시판</a></dt>
	            <dd><a class="cf_side_lnb" href="#">one</a></dd>
	            <dd><a class="cf_side_lnb" href="#" class="selected">two</a></dd>
	            <dd><a class="cf_side_lnb" href="#">three</a></dd>
	            <dd><a class="cf_side_lnb" href="#">four</a></dd>
	            <dt><a class="cf_side_gnb" href="#">운동파트너모집</a></dt>
	            <dd><a class="cf_side_lnb" href="#">one</a></dd>
	            <dd><a class="cf_side_lnb" href="#">two</a></dd>
	            <dd><a class="cf_side_lnb" href="#">three</a></dd>
	            <dd><a class="cf_side_lnb" href="#">four</a></dd>
	            <dt><a class="cf_side_gnb" href="#">구인구직</a></dt>
	            <dd><a class="cf_side_lnb" href="#">one</a></dd>
	            <dd><a class="cf_side_lnb" href="#">two</a></dd>
	            <dd><a class="cf_side_lnb" href="#">three</a></dd>
	            <dd><a class="cf_side_lnb" href="#">four</a></dd>
	            <dt><a class="cf_side_gnb" href="#">대회정보</a></dt>
	            <dd><a class="cf_side_lnb" href="#">one</a></dd>
	            <dd><a class="cf_side_lnb" href="#">two</a></dd>
	            <dd><a class="cf_side_lnb" href="#">three</a></dd>
	            <dd><a class="cf_side_lnb" href="#">four</a></dd>
	        </dl>
	    </aside>
	    -->
	    <section id="content">
	    	
	    </section>
    </div>
  </div>
</body>
</html>
