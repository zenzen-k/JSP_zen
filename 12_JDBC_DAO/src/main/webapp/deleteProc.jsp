<%@page import="DTO.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num = request.getParameter("num");
	
	MovieDao dao = new MovieDao();
	int cnt = dao.deleteMovie(num);
	
	if(cnt == 1)
		response.sendRedirect("select.jsp");
%>