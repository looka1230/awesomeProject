<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("loginUser") == null){
%>
<script>
alert('로그인 후 이용해주십시오.');
location.href="login.jsp";
</script>
<%
}
%>
</body>
</html>