<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="indexFrame.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="">
    <title>GYMGGUN 헬스장/트레이너 검색</title>
    <style>

        * {
            font-family: "jua";
            margin:0; padding:0;
        }
		
        #main_img{
          display: block;
          margin-top: 10px;
          margin-left: auto;
          margin-right: auto;
          height: 400px;
          width:400px;
          
        }
        #index_searchBox {
            width:300px;
            position: absolute;
            overflow: hidden;
            left:50%;
            transform: translate(-150px, 10px);
        }

        #index_searchBox > input[type=text]{
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

        #index_searchBox > a{
            display:block;
            float:left;
            padding-left: 5px;
        }
        
		#index_search_submit {
            background-image: url('search/images/search.png');
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
    </style>
</head>

<body>
  

    <img src="search/images/mainP.png" alt="" id="main_img">	
    <form action="search/SearchPage.jsp" id="index_searchBox">
        <input type="text" name="searchWord">
        <input id="index_search_submit" type="submit" value="">
    </form>

<%

if(session.getAttribute("loginUser") != null){
%>
<script type="text/javascript">
	var cf_main_lnb1 = document.getElementById("cf_main_lnb1");
	var cf_main_lnb2 = document.getElementById("cf_main_lnb2");
	//href 경로 재설정
	cf_main_lnb1.setAttribute("href", "search/logout.jsp");
	cf_main_lnb2.setAttribute("href", "search/memberUpdate.jsp");
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
	cf_main_lnb1.setAttribute("href", "search/login.jsp");
	cf_main_lnb2.setAttribute("href", "search/joinEx.jsp");
	//local nav bar 내용 재설정
	cf_main_lnb1.innerHTML = "로그인";
	cf_main_lnb2.innerHTML = "회원가입";
</script>
<%
}
%>
</body>

</html>
