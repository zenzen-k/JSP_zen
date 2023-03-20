<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="sdao" class="myPkg.StudentDao"/>
<jsp:useBean id="sb" class="myPkg.StudentBean"/>
<jsp:setProperty property="*" name="sb"/>
<%
	String str = "";
	if(sb.getHobby() == null){
		str = "선택사항없음";
	} else {
		String[] hobby = request.getParameterValues("hobby");
		for(String x : hobby){
			str += x + " ";
		}
	}
	sb.setHobby(str);
	
	int sum = sb.getC() + sb.getJava() + sb.getJsp();
	sb.setSum(sum);
	
	System.out.print(sb.getSum());
	int cnt = sdao.insertStudent(sb);
	
	if(cnt>0)
		response.sendRedirect("select.jsp");
	else
		response.sendRedirect("insertForm.jsp");

%>