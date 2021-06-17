<%@page import="rentcarModel.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쇼핑몰 예제</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("euc-kr");
	
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//회원 아이디와 비밀번호가 일치 하는지 비교
		RentcarDAO rDao = new RentcarDAO();
		
		//회원이 있는지 없는지 숫자로 표현
		int result = rDao.getMember(id,pass);
		
		if(result==0) {
	%>
		<script type="text/javascript">
			alert("회원 정보가 없습니다.")	;
			location.href='RentcarMain.jsp?center=MemberLogin.jsp';
		</script>
	<% 
		} else {
			
			//로그인 처리가 되었다면
			session.setAttribute("id", id);
			response.sendRedirect("RentcarMain.jsp");
		}	
	%>
	
</body>
</html>