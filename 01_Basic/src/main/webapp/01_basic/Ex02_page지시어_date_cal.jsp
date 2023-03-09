<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar, java.util.Date"%>
<!-- 자바였다면 import java.util.*; -->
<!-- 여기서는 페이지 지시어 안에 작성한다! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	오늘은
	<%
		// java.util.Calendar cal = new java.util.Calendar();
		// Calendar cal = new Calendar();
		Calendar cal = Calendar.getInstance();
		Date d = new Date();
	%>
	
	<%= cal.get(Calendar.YEAR) %> 년
	<%= cal.get(Calendar.MONTH)+1 %> 월
	<%= cal.get(Calendar.DATE) %> 일
	
	<br><br>
	오늘은 
	<%= d %> 입니다.
	
</body>
</html>