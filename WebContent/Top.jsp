<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css/ShoppingMall.css">
<title>���θ� ����</title>
</head>
<body>

	<!--������ �̿��� �α��� ó��  -->
	<%
		
		String id = (String) session.getAttribute("id");
		
		if(id==null) {
			id="Guest";
		}
	
	%>

	<table width="1000">
		<tr height="70">
			<td colspan="4">
				<a href="RentcarMain.jsp">
				<img alt="�ΰ�" src="images/RENT.png" height="65">
				</a>
			</td>
			<td align="center" width="200">
				<%=id%>
			<%
				if(id.equals("Guest")) {
			%>
				<button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">�α���</button>
			<%	
				} else {
			%>		
				<button onclick="location.href='MemberLogout.jsp'">�α׾ƿ�</button>
			<% 	
				}	
			%>
			</td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="red">
				<a href="RentcarMain.jsp?center=CarReserveMain.jsp" class="top-links">�����ϱ�</a>
			</td>
			<td align="center" width="200" bgcolor="red">
				<a href="RentcarMain.jsp?center=CarReserveView.jsp" class="top-links">����Ȯ��</a>
			</td>
			<td align="center" width="200" bgcolor="red">
				<a href="#" class="top-links">�����Խ���</a>
			</td>
			<td align="center" width="200" bgcolor="red">
				<a href="#" class="top-links">�̺�Ʈ</a>
			</td>
			<td align="center" width="200" bgcolor="red">
				<a href="#" class="top-links">������</a>
			</td>
		</tr>
	</table>
</body>
</html>