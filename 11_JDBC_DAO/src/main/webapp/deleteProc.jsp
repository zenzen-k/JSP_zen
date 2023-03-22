<%@page import="myPkg.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:useBean id="sdao" class="myPkg.StudentDao"/> --%>
<%
	StudentDao sdao = StudentDao.getInstance();
	System.out.println("deleteProc sdao : " + sdao);

	String num = request.getParameter("num");
	
	int cnt = sdao.deleteStudent(num);
	
	if(cnt>0){
		response.sendRedirect("select.jsp");
	} else{
		response.sendRedirect("select.jsp");
	}
%>