<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

01_via.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	System.out.println("01_via.jsp:id=" + id + "/password=" + pw);
%>

아이디1 : <%=id%>
비밀번호1 : <%=pw%>

<!-- forward : 앞으로 나아가라 -->
<jsp:forward page="01_result.jsp">
	<jsp:param name="age" value="30"/>
	<jsp:param value='<%=id + " 회원님"%>' name="id"/>
</jsp:forward>