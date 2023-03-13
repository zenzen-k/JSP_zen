<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

green.jsp<br>
<%
	String name = request.getParameter("name");	
	String color = request.getParameter("color");
%>

<%=name %>님이 선택한 색은 <%=color %>입니다.<br>
<img src="../images/<%=color%>.jpg">