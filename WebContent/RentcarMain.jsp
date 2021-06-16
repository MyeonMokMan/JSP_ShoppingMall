<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쇼핑몰 예제</title>
</head>
<body>
	<center>
	<%
		String center = request.getParameter("center");
	
		//처음 실행시에는 center 값이 넘어오지 않음.
		if(center == null) {
			
			//기본 center 값 부여
			center = "Center.jsp"; 
			
		}
	%>

	<table width="1000">
		<!-- 탑 부분 -->
		<tr height="140" align="center">
			<td align="center" width="1000">
				<jsp:include page="Top.jsp"></jsp:include>
			</td>
		</tr>
		<!-- 센터 부분 -->
		<tr height="470" align="center">
			<td align="center" width="1000">
				<jsp:include page="<%=center%>"></jsp:include>
			</td>
		</tr>
		<!-- 바텀 부분 -->
		<tr height="100" align="center">
			<td align="center" width="1000">
				<jsp:include page="Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
	</center>
</body>
</html>