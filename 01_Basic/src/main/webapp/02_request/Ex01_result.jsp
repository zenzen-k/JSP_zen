<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
Ex01_result.jsp 입니다<br>

<%
	// HttpServletRequest
	String method = request.getMethod();
	String uri = request.getRequestURI();
	StringBuffer url = request.getRequestURL();
	
	String a = request.getParameter("name");
	String b = request.getParameter("age");
%>

method : <%=method %> <br>
uri : <%=uri %> <br>
url : <%=url %> <br>
a : <%=a %> <br>
b : <%=b %> <br>