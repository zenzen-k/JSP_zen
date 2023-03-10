<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex01_form.jsp -> Ex01_result.jsp <br>

<%
request.setCharacterEncoding("utf-8");
	
String msg = request.getParameter("msg");
System.out.println("Ex01_result.jsp : " + msg); // 콘솔출력

// 값을 넘기고 싶다면 get방식 형태로 넘기면 됭ㄴ다
response.sendRedirect("Ex01_result2.jsp?msg=" + msg);
%>

msg : <%=msg%> <%-- 메세지 출력 --%>
<!-- Ex01_result.jsp?msg=hello -->