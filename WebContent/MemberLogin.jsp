<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쇼핑몰 예제</title>
</head>
<body>
	<form action="MemberLoginProc.jsp" method="post">
	<table width="300" border="1">
		<tr height="100">
			<td colspan="2" align="center"><h3>로그인</h3></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">아이디</td>
			<td width="180" align="center"><input type="text" name="id" size="15"></td>
		</tr>
		<tr height="40">
			<td width="120" align="center">비밀번호</td>
			<td width="180" align="center"><input type="password" name="pass" size="15"></td>
		</tr>
		<tr heigh="40">
			<td colspan="2" align="center">
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='MemberJoin.jsp'">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>