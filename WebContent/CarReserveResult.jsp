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
	
		String id = (String) session.getAttribute("id");
		
		if(id==null) {
	%>
		<script type="text/javascript">
			alert("로그인 후 예약이 가능합니다.")	
		</script>
	<%
		
			response.sendRedirect("RentcarMain.jsp?center=MemberLogin.jsp");
		}
	%>
	
	<jsp:useBean id="rBean" class="rentcarModel.CarReserveBean">
		<jsp:setProperty name="rBean" property="*" />
	</jsp:useBean>
</body>
</html>