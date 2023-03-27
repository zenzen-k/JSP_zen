<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
register.jsp -(script유효성검사)-> registerProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	
	MemberDao mdao = MemberDao.getInstance();
%>
<jsp:useBean id="mdto" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>

<%
	int cnt = mdao.insertMember(mdto);

	if(cnt==1){
		response.sendRedirect("../../main.jsp");
	}else{
		%>
		<script type="text/javascript">history.go(-1);</script>
		<%
	}
%>