
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="commonFrame.jsp"%>
<%@ include file="IsLoggedIn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GYMGGUN 내 정보 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script type="text/javascript" src="../script/member.js"></script>
<style>
#wrap{
	position:relative;
	height:100%;
}

#mem_registration_aside{
  float:left;
  width:200px;
  position:absolute;
  
}
#mem_registration_aside > dl > dt > a{
  float:left;
  width:200px;
  display:block;
  padding: 10px;
  font-size: 20px;
  margin-left:30px;
}
#mem_registration_aside > dl > dt > a:hover{
	color:red;
}
#mem_form{
	float:left;
	
}

</style>
</head>
<body>
  <div id="wrap">
	<aside id="mem_registration_aside">
		<dl>
			<a href="#"></a>
			<dt>
				<a href="memberUpdate.jsp" id="selected">내 정보 수정</a>
			</dt>
			<dt>
				<a href="FitnessCenterForm.jsp">헬스장 정보 관리</a>
			</dt>
			<dt>
				<a href="TrainerForm.jsp">트레이너 정보 관리</a>
			</dt>
			<!-- <dt><a href="#">즐겨찾기</a></dt>
        <dt><a href="#">작성게시물</a></dt> -->
			<dt>
				<a href="deleteMemberForm.jsp">회원탈퇴</a>
			</dt>
		</dl>
	</aside>

	<form
		class="row g-5 position-relative w-50 top-50 start-50 translate-middle"
		action="../memberUpdate.do" method="post" id="mem_form">
		<div class="input-group mb-3">
			<label for="id" class="col-sm-2 col-form-label">아이디</label> <input
				type="text" class="form-control" name="id" value="${mVo.id }"
				readonly>

		</div>
		<div class="input-group mb-3">
			<label for="password" class="col-sm-2 col-form-label">비밀번호</label> <input
				type="password" class="form-control" name="password"
				value="${mVo.password }" aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="submit"
				id="button-addon2">수정</button>
		</div>
		<div class="input-group mb-3">
			<label for="gender" class="col-sm-2 col-form-label">이름</label> <input
				type="text" class="form-control" name="gender" value="${mVo.name }"
				readonly>

		</div>
		<div class="input-group mb-3">
			<label for="name" class="col-sm-2 col-form-label">이름</label> <input
				type="text" class="form-control" name="name" value="${mVo.name }"
				readonly>

		</div>
		<div class="input-group mb-3">
			<label for="name" class="col-sm-2 col-form-label">이메일</label> <input
				type="text" class="form-control" name="email" value="${mVo.email }"
				aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="button"
				id="button-addon2">수정</button>
		</div>
		<div class="input-group mb-3">
			<label for="name" class="col-sm-2 col-form-label">닉네임</label> <input
				type="text" class="form-control" name="nickname"
				value="${mVo.nickname }" aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="button"
				id="button-addon2">수정</button>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>

	</form>
  </div>
</body>
</html>