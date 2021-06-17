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
		//차번호
		int no = Integer.parseInt(request.getParameter("no"));
		//수량
		int qty = Integer.parseInt(request.getParameter("qty"));
		//이미지
		String img = request.getParameter("img");
	%>
	
	<center>
	<form action="RentcarMain.jsp?center=CarReserveResult.jsp" method="post">
	<table width="1000">
		<tr height="100">
			<td align="center" colspan="3"><b>옵션 선택</b></td>
		</tr>
		<tr>
			<td rowspan="7" width="500"><img alt="" src="images/<%=img%>" width="450"></td>
			<td width="250" align="center">대여 기간</td>
			<td width="250" align="center">
				<select name="dDay">
					<option value="1">1일</option>
					<option value="2">2일</option>
					<option value="3">3일</option>
					<option value="4">4일</option>
					<option value="5">5일</option>
					<option value="6">6일</option>
					<option value="7">7일</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center">대여일</td>
			<td width="250" align="center">
				<input type="date" name="rDay" size="15"> 
			</td>
		</tr>
		<tr>
			<td width="250" align="center">보험 적용</td>
			<td width="250" align="center">
				<select name="useIn">
					<option value="1">적용 (1일 1만원)</option>
					<option value="2">비 적용</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center">와이파이 적용</td>
			<td width="250" align="center">
				<select name="useWifi">
					<option value="1">적용 (1일 1만원)</option>
					<option value="2">비 적용</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center">네이게이션 적용</td>
			<td width="250" align="center">
				<select name="useNavi">
					<option value="1">적용(무료)</option>
					<option value="2">비 적용</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center">베이비 시트 적용</td>
			<td width="250" align="center">
				<select name="useSeat">
					<option value="1">적용(1일 1만원)</option>
					<option value="2">비 적용</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="hidden" name="no" value="<%=no%>">
				<input type="hidden" name="qty" value="<%=qty%>">
				<input type="submit" value="예약하기">
			</td>
		</tr>
	</table>
	</form>
	</center>
</body>
</html>