<%@page import="rentcarModel.CarListBean"%>
<%@page import="rentcarModel.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 예제</title>
</head>
<body>

	<%
		int no = Integer.parseInt(request.getParameter("no"));
	
		RentcarDAO rDao = new RentcarDAO();
		
		CarListBean bean = rDao.getOneCar(no);
		
		String temp="";
		if(bean.getCategory()==1) {temp="소형 자동차";}
		else if (bean.getCategory()==2) {temp="중형 자동차";}
		else {temp="대형 자동차";}
	%>
	
	<center>
	<form action="RentcarMain.jsp?center=CarOptionSelect.jsp">
	<table width="1000">
		<tr height="100">
			<td align="center" colspan="3"><b><%=bean.getName()%></b></td>
		</tr>
		<tr>
			<td rowspan="6" width="500"><img alt="" src="images/<%=bean.getImg()%>" width="450"></td>
			<td width="250" align="center">차량 이름</td>
			<td width="250" align="center"><%=bean.getName()%></td>
		</tr>
		<tr>
			<td width="250" align="center">차량 수량</td>
			<td width="250" align="center">
			<select name="qty">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center">차량 분류</td>
			<td width="250" align="center"><%=temp%></td>
		</tr>
		<tr>
			<td width="250" align="center">대여 가격</td>
			<td width="250" align="center"><%=bean.getPrice()%></td>
		</tr>
		<tr>
			<td width="250" align="center">제조 회사</td>
			<td width="250" align="center"><%=bean.getCompany()%></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="hidden" name="no" value="<%=bean.getNo()%>">
				<input type="submit" value="옵션 선택 후 예약">
			</td>
		</tr>
	</table>
	<br><br><br>
	<p><b>차량 정보 보기</b>
	<p><b><%=bean.getInfo()%></b>
	</form>
	</center>
</body>
</html>