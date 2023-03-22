<%@page import="myPkg.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%-- <jsp:useBean id="sdao" class="myPkg.StudentDao"/> --%>
<jsp:useBean id="sb" class="myPkg.StudentBean"/>
<jsp:setProperty property="*" name="sb"/>
<%
	StudentDao sdao = StudentDao.getInstance();
	System.out.println("updateProc sdao : " + sdao);

	String str = "";
	if(request.getParameter("hobby") == null){
		str = "선택사항없음";
	} else {
		String[] hobby = request.getParameterValues("hobby");
		for(String x : hobby){
			str += x + " ";
		}
	}
	sb.setHobby(str);
	
	sb.setSum(sb.getC() + sb.getJava() + sb.getJsp());
	
	System.out.println("num " + sb.getNum());
	int cnt = sdao.updateStudent(sb);
	
	System.out.println("cnt " + cnt);
	if(cnt>0)
		response.sendRedirect("select.jsp");
	else
		response.sendRedirect("updateForm.jsp?num="+sb.getNum());
%>
