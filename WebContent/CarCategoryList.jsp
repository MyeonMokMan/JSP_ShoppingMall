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
<center>
	
	<%
		//카테고리 값을 받아옴
		int category = Integer.parseInt(request.getParameter("category"));
	
		RentcarDAO rDao = new RentcarDAO();
		
		Vector<CarListBean> vec = rDao.getCategoryCar(category);	
	%>
	
	<table width="1000">
	<tr height="60">
		<td align="center" colspan="3">
		<%	
			String temp="";
			if(category==1) {temp="소형 자동차";}
			else if (category==2) {temp="중형 자동차";}
			else {temp="대형 자동차";}
		%>
		<b><%=temp%></b>
		</td>
	</tr>
	<%
		//tr을 3개씩 보여주고 다시 tr을 실행할 수 있도록 변수 선언.
		int j=0;
		for(int i=0; i<vec.size(); i++) {
			
			//벡터에 저장 되어있는 빈클래스 추출
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
				<p>차량명:<%=bean.getName()%>
			</td>
	<%		
			//j 값을 증가	
			j+=1;
		}
	%>
	
	
	</table>
</center>
</body>
</html>