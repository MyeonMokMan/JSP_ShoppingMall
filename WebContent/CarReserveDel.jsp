<%@page import="rentcarModel.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	
		String id = request.getParameter("id");
		String rDay = request.getParameter("rDay");
		
		RentcarDAO rDao = new RentcarDAO();
		
		rDao.carRemoveReserve(id,rDay);
		
		response.sendRedirect("RentcarMain.jsp?center=CarReserveView.jsp");
	%>

</body>
</html>