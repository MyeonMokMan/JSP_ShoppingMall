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
<body>
<center>
	
	<%
		//ī�װ� ���� �޾ƿ�
		int category = Integer.parseInt(request.getParameter("category"));
	
		RentcarDAO rDao = new RentcarDAO();
		
		Vector<CarListBean> vec = rDao.getCategoryCar(category);	
	%>
	
	<table width="1000">
	<tr height="60">
		<td align="center" colspan="3">
		<%	
			String temp="";
			if(category==1) {temp="���� �ڵ���";}
			else if (category==2) {temp="���� �ڵ���";}
			else {temp="���� �ڵ���";}
		%>
		<b><%=temp%></b>
		</td>
	</tr>
	<%
		//tr�� 3���� �����ְ� �ٽ� tr�� ������ �� �ֵ��� ���� ����.
		int j=0;
		for(int i=0; i<vec.size(); i++) {
			
			//���Ϳ� ���� �Ǿ��ִ� ��Ŭ���� ����
			CarListBean bean = vec.get(i);
			
			if(j%3==0) {
	%>		
		<tr height="220">
	<%
			}
	%>	
			<td width="333" align="center">
				<a href="RentcarMain.jsp?center=CarReseveInfo.jsp?no=<%=bean.getNo()%>">
				<img alt="" src="images/<%=bean.getImg()%>" width="300" height="200">
				</a>
				<p>������:<%=bean.getName()%>
			</td>
	<%		
			//j ���� ����	
			j+=1;
		}
	%>
	
	
	</table>
</center>
</body>
</html>