<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
			alert("로그인 후 예약이 가능합니다.")	;
			location.href='RentcarMain.jsp?center=MemberLogin.jsp';
		</script>
	<%
		}
	%>
	
	<jsp:useBean id="rBean" class="rentcarModel.CarReserveBean">
		<jsp:setProperty name="rBean" property="*" />
	</jsp:useBean>
	
	<%
		//날짜 비교
		Date d1 = new Date();
		Date d2 = new Date();
		
		//날짜를 2021-6-17 포맷해주는 클래스 선언
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//예약하려는 날짜
		d1 = sdf.parse(rBean.getrDay());
		//현재 날짜
		d2 = sdf.parse(sdf.format(d2));
		
		//날짜 비교 메소드를 사용
		int compare = d1.compareTo(d2);
		
		//예약하려는 날짜보다 현재날짜가 크다면 -1, 같다면 0, 작다면 1
		if(compare < 0) {
	%>
		<script type="text/javascript">
			alert("예약 날짜를 다시 확인하세요.")	;
			history.go(-1);
		</script>
	<%	
		}
	%>
</body>
</html>