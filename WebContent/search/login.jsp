<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="commonFrame.jsp" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GYMGGUN 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script type="text/javascript" src="./script/member.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GYMGGUN 헬스장/트레이너 검색</title>
    <style>
    	input[type=password] {	
    		font-family: sans-serif;
		}
    </style>
</head>
<body>

  <div class="wrapper position-absolute top-50 start-50 translate-middle">
  	<div class="input-group mb-2 container d-flex align-self-center mt-5 clear:both;" style="width: 200px;">
    <form action="../login.do" method="post" name="loginform" onsubmit="return loginCheck(this)">
      <div class="mb-3">
        <label for="id" class="form-label" >ID</label>
        <input type="text" class="form-control" name="id" placeholder="Id" id="id" />
      </div>
      <div class="mb-3">
        <label for="pwd" class="form-label">Password</label>
        <input type="password" class="form-control" name="password" placeholder="Password" id="pwd" />
      </div>
    
      <button type="submit" class="btn btn-primary">Sign in</button>
    </form>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" onclick="location.href='joinEx.jsp'">회원가입</a>
      <a class="dropdown-item" type="reset" value="cancle">취소</a>
    </div>
  
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
