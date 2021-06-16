<%@page import="rentcarModel.CarListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="rentcarModel.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쇼핑몰 예제</title>
</head>
<body>
	
	<!-- 데이터베이스에 연결하여 최신순 자동차 3대를 뿌려주는 데이터를 가져옴 -->
	<%
	
		RentcarDAO rDao = new RentcarDAO();
		
		//벡터를 이용
		Vector<CarListBean> vec = rDao.getSelectCar();
	
	%>
	
</body>
</html>