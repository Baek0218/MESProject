<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/work/loginPro" method="post">
		<table>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="id"></td>
			</tr>
			
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="pass"></td>
			</tr>
		</table>
		<br>
			<input type="submit" value="로그인">
	</form>
</body>
</html>