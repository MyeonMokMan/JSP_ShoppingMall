<%@page import="rentcarModel.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="rentcarModel.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���θ� ����</title>
</head>
<center>
<body>
	
	<!-- �����ͺ��̽��� �����Ͽ� �ֽż� �ڵ��� 3�븦 �ѷ��ִ� �����͸� ������ -->
	<%
	
		RentcarDAO rDao = new RentcarDAO();
		
		//���͸� �̿�
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
				<img alt="�� �̹���" src="images/<%=bean.getImg()%>" width="300" height="220"></a>
				<p>������ : <%=bean.getName()%>
			</td>
	<%
		}
	%>	
	</table>
	<hr color="red" size="2">
	<p><b>���� �˻��ϱ�<br><br><br>
	<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
		<b>���� ��������</b>&nbsp;&nbsp;
		<select name="category">
			<option value="1">����</option>
			<option value="2">����</option>
			<option value="3">����</option>
		</select>&nbsp;&nbsp;
		<input type="submit" value="�˻�">&nbsp;&nbsp;
	</form>
	<button onclick="location.href=CarAllList.jsp">��ü �˻�</button>
	
</body>
</center>
</html>