<%@page import="rentcarModel.CarViewBean"%>
<%@page import="rentcarModel.CarReserveBean"%>
<%@page import="java.util.Vector"%>
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
	
		String id = (String) session.getAttribute("id");
		
		if(id==null) {
	%>
		<script type="text/javascript">
			alert("로그인 후 예약 확인이 가능합니다.")	;
			location.href='RentcarMain.jsp?center=MemberLogin.jsp';
		</script>
	<%
		}
		
		//로그인 되어있는 아이디를 읽어옴.
		RentcarDAO rDao = new RentcarDAO();
		
		Vector<CarViewBean> vec = rDao.getAllReserve(id);
		
	%>
	
	<center>
		<table width="1000" border="1">
			<tr height="100">
				<td align="center" colspan="11">
					<b>차량 예약 목록</b>
				</td>
			</tr>
			<tr height="40">
				<td width="150" align="center">이미지</td>
				<td width="150" align="center">이름</td>
				<td width="150" align="center">대여일</td>
				<td width="60" align="center">대여기간</td>
				<td width="100" align="center">금액</td>
				<td width="60" align="center">수량</td>
				<td width="60" align="center">보험</td>
				<td width="60" align="center">wifi</td>
				<td width="60" align="center">네비게이션</td>
				<td width="60" align="center">베이비시트</td>
				<td width="90" align="center">삭제</td>
			</tr>
			<%
				for(int i=0; i<vec.size(); i++) {
					
					CarViewBean cBean = vec.get(i);
					
					String useIn = "비적용";
					if(cBean.getUseIn()==1) {
						useIn="적용";
					}
					
					String useWifi = "비적용"; 
					if(cBean.getUseWifi()==1) {
						useWifi="적용";
					}
					
					String useNavi = "비적용"; 
					if(cBean.getUseWifi()==1) {
						useNavi="적용";
					}
					
					String useSeat = "비적용"; 
					if(cBean.getUseSeat()==1) {
						useSeat="적용";
					}
			%>
			<tr height="70">
				<td width="150" align="center"><img alt="" src="images/<%=cBean.getImg()%>" width="120" height="70"></td>
				<td width="150" align="center"><%=cBean.getName()%></td>
				<td width="150" align="center"><%=cBean.getrDay()%></td>
				<td width="60" align="center"><%=cBean.getdDay()%></td>
				<td width="100" align="center"><%=cBean.getPrice()%></td>
				<td width="60" align="center"><%=cBean.getQty()%></td>
				<td width="60" align="center"><%=useIn%></td>
				<td width="60" align="center"><%=useWifi%></td>
				<td width="60" align="center"><%=useNavi%></td>
				<td width="60" align="center"><%=useSeat%></td>
				<td width="90" align="center"><button onclick="location.href='CarReserveDel.jsp?id=<%=id%>&rDay=<%=cBean.getrDay()%>'">삭제</button></td>
			</tr>
			<%		
				}
			%>	
		</table>
	</center>
	
</body>
</html>