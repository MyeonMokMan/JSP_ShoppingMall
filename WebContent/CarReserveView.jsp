<%@page import="rentcarModel.CarViewBean"%>
<%@page import="rentcarModel.CarReserveBean"%>
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
	<%
		request.setCharacterEncoding("euc-kr");
	
		String id = (String) session.getAttribute("id");
		
		if(id==null) {
	%>
		<script type="text/javascript">
			alert("�α��� �� ���� Ȯ���� �����մϴ�.")	;
			location.href='RentcarMain.jsp?center=MemberLogin.jsp';
		</script>
	<%
		}
		
		//�α��� �Ǿ��ִ� ���̵� �о��.
		RentcarDAO rDao = new RentcarDAO();
		
		Vector<CarViewBean> vec = rDao.getAllReserve(id);
		
	%>
	
	<center>
		<table width="1000" border="1">
			<tr height="100">
				<td align="center" colspan="11">
					<b>���� ���� ���</b>
				</td>
			</tr>
			<tr height="40">
				<td width="150" align="center">�̹���</td>
				<td width="150" align="center">�̸�</td>
				<td width="150" align="center">�뿩��</td>
				<td width="60" align="center">�뿩�Ⱓ</td>
				<td width="100" align="center">�ݾ�</td>
				<td width="60" align="center">����</td>
				<td width="60" align="center">����</td>
				<td width="60" align="center">wifi</td>
				<td width="60" align="center">�׺���̼�</td>
				<td width="60" align="center">���̺��Ʈ</td>
				<td width="90" align="center">����</td>
			</tr>
			<%
				for(int i=0; i<vec.size(); i++) {
					
					CarViewBean cBean = vec.get(i);
					
					String useIn = "������";
					if(cBean.getUseIn()==1) {
						useIn="����";
					}
					
					String useWifi = "������"; 
					if(cBean.getUseWifi()==1) {
						useWifi="����";
					}
					
					String useNavi = "������"; 
					if(cBean.getUseWifi()==1) {
						useNavi="����";
					}
					
					String useSeat = "������"; 
					if(cBean.getUseSeat()==1) {
						useSeat="����";
					}
			%>
			<tr height="70">
				<td width="150" align="center"><img alt="" src="images/<%=cBean.getImg()%>" width="120" height="70"></td>
				<td width="150" align="center"><%=cBean.getName()%></td>
				<td width="150" align="center"><%=cBean.getrDay()%></td>
				<td width="60" align="center"><%=cBean.getdDay()%></td>
				<td width="100" align="center"><%=cBean.getPrice()%></td>
				<td width="60" align="center"><%=cBean.getQty()%></td>
				<td width="60" align="center"><%=useIn%></td>
				<td width="60" align="center"><%=useWifi%></td>
				<td width="60" align="center"><%=useNavi%></td>
				<td width="60" align="center"><%=useSeat%></td>
				<td width="90" align="center"><button onclick="location.href='CarReserveDel.jsp?id=<%=id%>&rDay=<%=cBean.getrDay()%>'">����</button></td>
			</tr>
			<%		
				}
			%>	
		</table>
	</center>
	
</body>
</html>