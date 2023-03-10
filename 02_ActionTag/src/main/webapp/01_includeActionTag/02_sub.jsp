<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

02_sub.jsp<br>

<%
	request.setCharacterEncoding("utf-8"); /* reslut에 있던 request.getParameter("msg");와 공유한다. */
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String age = request.getParameter("age");
%>

이름 : <%=name %><br>
비번 : <%=pw %><br>
나이 : <%=age %><br>