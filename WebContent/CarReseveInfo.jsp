<%@page import="rentcarModel.CarListBean"%>
<%@page import="rentcarModel.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� ����</title>
</head>
<body>

	<%
		int no = Integer.parseInt(request.getParameter("no"));
	
		RentcarDAO rDao = new RentcarDAO();
		
		CarListBean bean = rDao.getOneCar(no);
		
		String temp="";
		if(bean.getCategory()==1) {temp="���� �ڵ���";}
		else if (bean.getCategory()==2) {temp="���� �ڵ���";}
		else {temp="���� �ڵ���";}
	%>
	
	<center>
	<form action="RentcarMain.jsp?center=CarOptionSelect.jsp">
	<table width="1000">
		<tr height="100">
			<td align="center" colspan="3"><b><%=bean.getName()%></b></td>
		</tr>
		<tr>
			<td rowspan="6" width="500"><img alt="" src="images/<%=bean.getImg()%>" width="450"></td>
			<td width="250" align="center">���� �̸�</td>
			<td width="250" align="center"><%=bean.getName()%></td>
		</tr>
		<tr>
			<td width="250" align="center">���� ����</td>
			<td width="250" align="center">
			<select name="qty">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
			</td>
		</tr>
		<tr>
			<td width="250" align="center">���� �з�</td>
			<td width="250" align="center"><%=temp%></td>
		</tr>
		<tr>
			<td width="250" align="center">�뿩 ����</td>
			<td width="250" align="center"><%=bean.getPrice()%></td>
		</tr>
		<tr>
			<td width="250" align="center">���� ȸ��</td>
			<td width="250" align="center"><%=bean.getCompany()%></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="hidden" name="no" value="<%=bean.getNo()%>">
				<input type="submit" value="�ɼ� ���� �� ����">
			</td>
		</tr>
	</table>
	<br><br><br>
	<p><b>���� ���� ����</b>
	<p><b><%=bean.getInfo()%></b>
	</form>
	</center>
</body>
</html>