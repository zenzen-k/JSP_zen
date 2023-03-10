<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex01_result2.jsp<br>

<%
String msg = request.getParameter("msg");
System.out.println("Ex01_result2.jsp : " + msg);
%>

msg : <%=msg%>

<%
// JspWriter out = new JspWriter();
out.print("out객체");
%>