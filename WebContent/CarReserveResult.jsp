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
	%>
</body>
</html>