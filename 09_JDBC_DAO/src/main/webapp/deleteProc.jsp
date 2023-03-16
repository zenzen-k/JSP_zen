<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<jsp:useBean id="mdao" class="myPkg.MartDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	// 굳이 안바꾸고 문자열로 보내더라도 SQL에서 오류발생은 안함!! -> '1' 
	// 숫자는 1, '1' 상관없다~

	int cnt = mdao.deleteMart(num);
	if(cnt>0)
		response.sendRedirect("select.jsp");
%>