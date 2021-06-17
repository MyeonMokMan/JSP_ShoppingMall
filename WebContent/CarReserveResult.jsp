<%@page import="rentcarModel.CarListBean"%>
<%@page import="rentcarModel.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���θ� ����</title>
</head>
<body>

	<%
		request.setCharacterEncoding("euc-kr");
	
		String id = (String) session.getAttribute("id");
		
		if(id==null) {
	%>
		<script type="text/javascript">
			alert("�α��� �� ������ �����մϴ�.")	;
			location.href='RentcarMain.jsp?center=MemberLogin.jsp';
		</script>
	<%
		}
	%>
	
	<jsp:useBean id="rBean" class="rentcarModel.CarReserveBean">
		<jsp:setProperty name="rBean" property="*" />
	</jsp:useBean>
	
	<%
		//��¥ ��
		Date d1 = new Date();
		Date d2 = new Date();
		
		//��¥�� 2021-6-17 �������ִ� Ŭ���� ����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//�����Ϸ��� ��¥
		d1 = sdf.parse(rBean.getrDay());
		//���� ��¥
		d2 = sdf.parse(sdf.format(d2));
		
		//��¥ �� �޼ҵ带 ���
		int compare = d1.compareTo(d2);
		
		//�����Ϸ��� ��¥���� ���糯¥�� ũ�ٸ� -1, ���ٸ� 0, �۴ٸ� 1
		if(compare < 0) {
	%>
		<script type="text/javascript">
			alert("���� ��¥�� �ٽ� Ȯ���ϼ���.")	;
			history.go(-1);
		</script>
	<%	
		}
		
		//��������� �ƹ��� ������ ���ٸ� ������ ���� �� ��� ������ �����ֱ�
		//���̵� ���� ��Ŭ������ ���⿡ ����
		rBean.setId(id);
		
		RentcarDAO rDao = new RentcarDAO();
		
		rDao.setReserveCar(rBean);
		
		CarListBean cBean = rDao.getOneCar(rBean.getNo());
		
		int totalCar = cBean.getPrice()*rBean.getQty()*rBean.getdDay();
		
		//�ɼ� �ݾ�
		int useIn = 0;
		if(rBean.getUseIn()==1) {useIn=10000;}
		
		int useWifi = 0;
		if(rBean.getUseWifi()==1) {useWifi=10000;}
		
		int useSeat = 0;
		if(rBean.getUseSeat()==1) {useSeat=10000;}
		
		int totalOption = rBean.getQty()*rBean.getdDay()*(useIn+useWifi+useSeat);
	%>
	
	<center>
		<table width="1000">
			<tr height="100">
				<td align="center">
					<b>���� ���� �Ϸ�</b>
				</td>
			</tr>
			<tr>
				<td align="center">
					<img alt="" src="images/<%=cBean.getImg()%>" width="450">
				</td>
			</tr>
			<tr height="50">
				<td align="center">
					<b>���� �� ���� �ݾ� <%=totalCar %>��</b>
				</td>
			</tr>
			<tr height="50">
				<td align="center">
					<b>���� �� �ɼ� �ݾ� <%=totalOption %>��</b>
				</td>
			</tr>
			<tr height="50">
				<td align="center">
					<b>���� �� �ݾ� <%=totalOption+totalCar %>��</b>
				</td>
			</tr>
		</table>
	</center>
	
	
</body>
</html>