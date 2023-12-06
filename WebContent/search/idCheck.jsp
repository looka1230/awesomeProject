<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/member.js"> </script>
</head>
<body>
	<form method="get" action="${pageContext.request.contextPath }/idCheck.do" name="frm">
		<table>
			<tr>
				<td><label for="id">아이디</label></td>
				<td><input type="text" name="userid" id="id" value="${userid }"></td>
				<td><input type="submit" value="중복 체크"></td>
			</tr>
			<tr>
				<td colspan="3"><c:choose>
						<c:when test="${result == 1 }">${userid }는 사용중인 아이디입니다.</c:when>
						<c:when test="${result == -1 }">${userid }가 사용가능한 아이디입니다. &nbsp;<input type="button" value="사용" onclick="idOk()"></c:when>
						<c:otherwise></c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</form>
</body>
</html>