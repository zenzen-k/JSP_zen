<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


01_result.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String age = request.getParameter("age");
	System.out.println("01_via.jsp:id=" + id + "/password=" + pw);
%>

아이디2 : <%=id%> <br>
비밀번호2 : <%=pw%><br>
나이2 : <%=age%><br>