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
	
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//ȸ�� ���̵�� ��й�ȣ�� ��ġ �ϴ��� ��
		RentcarDAO rDao = new RentcarDAO();
		
		//ȸ���� �ִ��� ������ ���ڷ� ǥ��
		int result = rDao.getMember(id,pass);
		
		if(result==0) {
	%>
		<script type="text/javascript">
			alert("ȸ�� ������ �����ϴ�.")	;
			location.href='RentcarMain.jsp?center=MemberLogin.jsp';
		</script>
	<% 
		} else {
			
			//�α��� ó���� �Ǿ��ٸ�
			session.setAttribute("id", id);
			response.sendRedirect("RentcarMain.jsp");
		}	
	%>
	
</body>
</html>