<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���θ� ����</title>
</head>
<body>
	<center>
	<%
		String center = request.getParameter("center");
	
		//ó�� ����ÿ��� center ���� �Ѿ���� ����.
		if(center == null) {
			
			//�⺻ center �� �ο�
			center = "Center.jsp"; 
			
		}
	%>

	<table width="1000">
		<!-- ž �κ� -->
		<tr height="140" align="center">
			<td align="center" width="1000">
				<jsp:include page="Top.jsp"></jsp:include>
			</td>
		</tr>
		<!-- ���� �κ� -->
		<tr height="470" align="center">
			<td align="center" width="1000">
				<jsp:include page="<%=center%>"></jsp:include>
			</td>
		</tr>
		<!-- ���� �κ� -->
		<tr height="100" align="center">
			<td align="center" width="1000">
				<jsp:include page="Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
	</center>
</body>
</html>