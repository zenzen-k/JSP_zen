<%@page import="myPkg.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
%>

<jsp:useBean id="eb" class="myPkg.EmplBean"/>
<jsp:setProperty property="*" name="eb"/>
<jsp:useBean id="edao" class="myPkg.EmplDao"/>

<%
	int cnt = edao.updateEmpl(eb);

	String msg = "";
	String url = "";
	if(cnt>0){
		msg = "수정 성공";
		url = "select.jsp";
	}else{
		msg = "수정 실패";
		url = "updateForm.jsp?num=" + num;
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>