<%@page import="DTO.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	
	MovieDao dao = new MovieDao();
	boolean result = dao.searchId(userid);
	
	if(result){
		out.print("N");
	}else{
		out.print("Y");
	}
%>