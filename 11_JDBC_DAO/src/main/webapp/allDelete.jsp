<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="sdao" class="myPkg.StudentDao"/>
<%
	//System.out.println(request.getParameter("rcheck"));
	String[] num = request.getParameterValues("rcheck");
	
	/* for(String x : num){
		System.out.println(x);
	} */
	
	int cnt = sdao.selectDel(num);
	
	System.out.println("cnt : " + cnt);
	if(cnt == num.length){ // 3개가 넘어갔다면 3개가 성공해야하므로
		response.sendRedirect("select.jsp");
	}
%>