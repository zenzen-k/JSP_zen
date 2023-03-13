<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

02_via.jsp<br>

<%
	//처음 요청받은 페이지에서 한글처리 필수
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String url = color+".jsp";
%>

<jsp:forward page="<%=url%>"/>

<%-- 다른 방법
<jsp:forward page="<%=color + \".jsp\"%>"/> --%>

<!-- 아래같은 방법은 안됨. 표현식 안에 다 넣어줘야한다 -->
<%-- <jsp:forward page="<%=color%>.jsp"/>  --%>