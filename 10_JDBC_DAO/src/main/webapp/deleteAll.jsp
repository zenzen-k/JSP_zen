<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp<br>

<jsp:useBean id="bdao" class="DTO.BookDao"/>
<%
	String[] no = request.getParameterValues("rowcheck");
	
	for(String x : no){
		System.out.println(x);
	}
	
	int cnt = bdao.deleteCheckData(no);
	if(cnt>0){ 
		response.sendRedirect("select.jsp");
	}
%>