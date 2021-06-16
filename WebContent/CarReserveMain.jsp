<%@page import="rentcarModel.CarListBean"%>
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
<center>
<body>
	
	<!-- 데이터베이스에 연결하여 최신순 자동차 3대를 뿌려주는 데이터를 가져옴 -->
	<%
	
		RentcarDAO rDao = new RentcarDAO();
		
		//벡터를 이용
		Vector<CarListBean> vec = rDao.getSelectCar();
		
	%>
	
	<table width="1000">
		<tr height="240">
		
	<% 
		for(int i=0; i<vec.size(); i++) {
		
		CarListBean bean = vec.get(i);
	%>
			<td width="333" align="center">
				<a href="CarReserveInfo.jsp?no=<%=bean.getNo()%>">	
				<img alt="차 이미지" src="images/<%=bean.getImg()%>" width="300" height="220"></a>
				<p>차량명 : <%=bean.getName()%>
			</td>
	<%
		}
	%>	
	</table>
	<hr color="red" size="2">
	<p><b>차량 검색하기<br><br><br>
	<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
		<b>차량 종류보기</b>&nbsp;&nbsp;
		<select name="category">
			<option value="1">소형</option>
			<option value="2">중형</option>
			<option value="3">대형</option>
		</select>&nbsp;&nbsp;
		<input type="submit" value="검색">&nbsp;&nbsp;
	</form>
	<button onclick="location.href=CarAllList.jsp">전체 검색</button>
	
</body>
</center>
</html>