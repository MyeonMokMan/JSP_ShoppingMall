<%@page import="rentcarModel.CarListBean"%>
<%@page import="rentcarModel.RentcarDAO"%>
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
		
		//결과적으로 아무런 문제가 없다면 데이터 저장 후 결과 페이지 보여주기
		//아이디 값이 빈클래스에 없기에 저장
		rBean.setId(id);
		
		RentcarDAO rDao = new RentcarDAO();
		
		rDao.setReserveCar(rBean);
		
		CarListBean cBean = rDao.getOneCar(rBean.getNo());
		
		int totalCar = cBean.getPrice()*rBean.getQty()*rBean.getdDay();
		
		//옵션 금액
		int useIn = 0;
		if(rBean.getUseIn()==1) {useIn=10000;}
		
		int useWifi = 0;
		if(rBean.getUseWifi()==1) {useWifi=10000;}
		
		int useSeat = 0;
		if(rBean.getUseSeat()==1) {useSeat=10000;}
		
		int totalOption = rBean.getQty()*rBean.getdDay()*(useIn+useWifi+useSeat);
	%>
	
	<center>
		<table width="1000">
			<tr height="100">
				<td align="center">
					<b>차량 예약 완료</b>
				</td>
			</tr>
			<tr>
				<td align="center">
					<img alt="" src="images/<%=cBean.getImg()%>" width="450">
				</td>
			</tr>
			<tr height="50">
				<td align="center">
					<b>차량 총 예약 금액 <%=totalCar %>원</b>
				</td>
			</tr>
			<tr height="50">
				<td align="center">
					<b>차량 총 옵션 금액 <%=totalOption %>원</b>
				</td>
			</tr>
			<tr height="50">
				<td align="center">
					<b>예약 총 금액 <%=totalOption+totalCar %>원</b>
				</td>
			</tr>
		</table>
	</center>
	
	
</body>
</html>