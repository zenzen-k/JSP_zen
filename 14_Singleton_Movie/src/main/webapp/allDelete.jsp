<%@page import="DTO.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String[] num = request.getParameterValues("rowcheck");
%>
<%-- <jsp:useBean id="dao" class="DTO.MovieDao"/> --%>
<%
	MovieDao dao = MovieDao.getInstance();
	int cnt = dao.selectDel(num);
	
	if(cnt == num.length)
		response.sendRedirect("select.jsp");
%>