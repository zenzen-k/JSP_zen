<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	// idCheckProc.jsp<br>
	String userid = request.getParameter("userid");
	System.out.println("userid" + userid);
	
	MemberDao mdao = MemberDao.getInstance();
	boolean result = mdao.searchId(userid);
	
	System.out.println("result"+result);
	
	if(result){
		out.print("N"); // 아웃객체를 이용! system 아님!
	} else{
		out.print("Y");
	}
%>