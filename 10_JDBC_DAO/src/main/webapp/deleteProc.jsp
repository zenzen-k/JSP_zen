<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp

<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
%>
<jsp:useBean id="bdao" class="DTO.BookDao"/>
<%
	int cnt = bdao.deleteBook(no);

	if(cnt>0){
		response.sendRedirect("select.jsp");
	}
%>
