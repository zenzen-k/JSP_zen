<%@page import="myPkg.EmplDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select -> deleteProc.jsp -> dao.deleteempl -> deleteProc -> select<br>

<jsp:useBean id="edao" class="myPkg.EmplDao"></jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	System.out.println("delete num : "+num);
	
	//EmplDao edao = new EmplDao();
	int cnt = edao.delEmpl(num);
	
	if(cnt>0)
		response.sendRedirect("select.jsp");
%>