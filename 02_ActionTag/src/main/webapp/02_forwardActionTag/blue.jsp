<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

blue.jsp<br>
<%
	// 처음 요청받은 페이지에서 한글처리 헀다면 여기사 안해도 ㄱㅊ
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");	
	String color = request.getParameter("color");
	
	String conPath = request.getContextPath();
	System.out.println(conPath); // /02_ActionTag , 프로젝트명이 나옴
%>

<%=name %>님이 선택한 색은 <%=color %>입니다.<br>
<%-- <img src="../images/<%=color%>.jpg"> --%>
<img src="<%=conPath%>/images/<%=color%>.jpg">