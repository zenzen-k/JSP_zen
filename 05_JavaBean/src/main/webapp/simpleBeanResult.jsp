<%@page import="myPkg.SimpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>


simpleBeanResult.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String message = request.getParameter("message");
%>

메세지 : <%=message%><br>

<!-- 자바코드 -->
<%
	SimpleBean sb = new SimpleBean();
	sb.setMsg(message);
	System.out.println(sb.getMsg());
%>

<!-- jsp -->
<jsp:useBean id="sb2" class="myPkg.SimpleBean"/>
<jsp:setProperty property="msg" name="sb2" param="message"/>
<%-- <jsp:setProperty property="msg" name="sb2" value="하하"/> --%>
<!-- param을 써주면 위에서 request로 안받아도 ㄱㅊ당 -->

메세지 : <jsp:getProperty property="msg" name="sb2"/>