<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css/ShoppingMall.css">
<title>쇼핑몰 예제</title>
</head>
<body>

	<!--세션을 이용한 로그인 처리  -->
	<%
		
		String id = (String) session.getAttribute("id");
		
		if(id==null) {
			id="Guest";
		}
	
	%>

	<table width="1000">
		<tr height="70">
			<td colspan="4">
				<a href="RentcarMain.jsp">
				<img alt="로고" src="images/RENT.png" height="65">
				</a>
			</td>
			<td align="center" width="200">
				<%=id%>
			<%
				if(id.equals("Guest")) {
			%>
				<button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">로그인</button>
			<%	
				} else {
			%>		
				<button onclick="location.href='MemberLogout.jsp'">로그아웃</button>
			<% 	
				}	
			%>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="red">
				<a href="RentcarMain.jsp?center=CarReserveMain.jsp" class="top-links">예약하기</a>
			</td>
			<td align="center" width="200" bgcolor="red">
				<a href="RentcarMain.jsp?center=CarReserveView.jsp" class="top-links">예약확인</a>
			</td>
			<td align="center" width="200" bgcolor="red">
				<a href="#" class="top-links">자유게시판</a>
			</td>
			<td align="center" width="200" bgcolor="red">
				<a href="#" class="top-links">이벤트</a>
			</td>
			<td align="center" width="200" bgcolor="red">
				<a href="#" class="top-links">고객센터</a>
			</td>
		</tr>
	</table>
</body>
</html>