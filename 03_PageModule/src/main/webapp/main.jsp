<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

시작하는 페이지(main.jsp)<br>

<jsp:forward page="template.jsp">
	<jsp:param value="content.jsp" name="contentPage"/> 
</jsp:forward>


