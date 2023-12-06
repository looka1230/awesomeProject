<%@page import="com.gymggun.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Common Frame</title>

    <style>
        /* 초기화 */
        @font-face {
            font-family: "jua";
            src: url("fonts/BMJUA_ttf.ttf");
        }

        * {
            font-family: "jua";
            margin: 0px;
            padding:0;
        }

        html,body{
          height: 100%;
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
        /* 헤더 */
        #cf_main_header{
          min-width: 300px; /* 뷰(브라우저를 줄일 수 있는) 최소 길이 */
          height:135px;
          width: 99%;
          margin: 0 auto;
          position:relative;
          border-bottom:3px solid black;
          margin-bottom:30px;
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

    </style>
</head>

<body>

    <header>
        <nav id="cf_main_header">
            <a id="cf_logo" href="../index.jsp"><img src="./images/Logo.jpg" alt="로고" width="200px" height="100px"></a>
            
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
                    <li><a id="cf_main_lnb1" href="login.jsp">로그인</a></li>
                    <li><a id="cf_main_lnb2" href="joinEx.jsp">회원가입</a></li>
                </ul>
            </div>
        </nav>
    </header>
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
<%
if(session.getAttribute("loginUser") != null){
%>
<script type="text/javascript">
	var cf_main_lnb1 = document.getElementById("cf_main_lnb1");
	var cf_main_lnb2 = document.getElementById("cf_main_lnb2");
	//href 경로 재설정
	cf_main_lnb1.setAttribute("href", "logout.jsp");
	cf_main_lnb2.setAttribute("href", "memberUpdate.jsp");
	//local nav bar 내용 재설정
	cf_main_lnb1.innerHTML = "로그아웃";
	cf_main_lnb2.innerHTML = "마이페이지";
</script>
<% 
} else {

%>
<script type="text/javascript">
	var cf_main_lnb1 = document.getElementById("cf_main_lnb1");
	var cf_main_lnb2 = document.getElementById("cf_main_lnb2");
	//href 경로 재설정
	cf_main_lnb1.setAttribute("href", "login.jsp");
	cf_main_lnb2.setAttribute("href", "joinEx.jsp");
	//local nav bar 내용 재설정
	cf_main_lnb1.innerHTML = "로그인";
	cf_main_lnb2.innerHTML = "회원가입";
</script>
<%
}
%>
</body>
</html>
