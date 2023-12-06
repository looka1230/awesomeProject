<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="commonFrame.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GYMGGUN 회원탈퇴</title>
</head>
<style>
#wrap{
        width:100%;
        overflow: hidden;
      }
        #d_registration_aside{
          float:left;
          width:250px;
        }
        #d_registration_aside > dl > dt > a{
          float:left;
          width:250px;
          display:block;
          padding: 10px;
          font-size: 20px;
          margin-left:30px;
        }
        #d_registration_aside > dl > dt > a:hover{
        	color:red;
        }

#myInfo{
	font-size:6;
	color:gray;
	font-weight:bold;
	text-align:center;
}
#d_table{
	margin:0 auto;
	border:3px solid orange;
}
.d_td{
	border:1px solid orange;
}
#title{
	background-color:skyblue;
}
#d_input{
	width:200px;
	margin:0 auto;
}

</style>
<script>
function checkValue(){
    if(document.deleteform.password.value == ""){
        alert("비밀번호를 입력하지 않았습니다.");
        return false;
    }
}


</script>
<body>
  <div id="wrap">
	<aside id="d_registration_aside">
        <dl>
            <a href="#"></a>
            <dt><a href="memberUpdate.jsp" id="selected">내 정보 수정</a></dt>
            <dt><a href="FitnessCenterForm.jsp">헬스장 정보 관리</a></dt>
            <dt><a href="TrainerForm.jsp">트레이너 정보 관리</a></dt>
            <!-- <dt><a href="#">즐겨찾기</a></dt>
            <dt><a href="#">작성게시물</a></dt> -->
            <dt><a href="deleteMemberForm.jsp">회원탈퇴</a></dt>
        </dl>
    </aside>
	<br><br>
	<h1>미완성 페이지</h1>
	<div id="myInfo">내 정보</div>
	<br><br><br>
	<form action="deleteMember.jsp" method="post" name="deleteform" onsubmit="return checkValue()">
		<table id="d_table">
			<tr>
				<td class="d_td">비밀번호</td>
				<td class="d_td"><input type="password" name="password"></td>
			</tr>
		</table>
		<br>
		<div id="d_input">
			<input type="button" value="취소" onclick="javascript:window.location='../index.jsp'">
			<input type="submit" value="탈퇴">
		</div>
	</form>
  </div>
</body>
</html>