<%@page import="DTO.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* <jsp:useBean id="dao" class="DTO.MovieDao"/> */

	MovieDao dao = MovieDao.getInstance();
	System.out.println("idCheck dao : " + dao);
	
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	
	boolean result = dao.searchId(userid);
	
	if(result){
		out.print("N");
	}else{
		out.print("Y");
	}
%>