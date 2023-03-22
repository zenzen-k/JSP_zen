<%@page import="myPkg.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String userid = request.getParameter("userid");
//<jsp:useBean id="sdao" class="myPkg.StudentDao"/>

	StudentDao sdao = StudentDao.getInstance();
	System.out.println("idcheck sdao : " + sdao);

	boolean result = sdao.searchId(userid);

	if(result){ // 이미잇음
		out.print("N");
	}else{
		out.print("Y");
	}
%>