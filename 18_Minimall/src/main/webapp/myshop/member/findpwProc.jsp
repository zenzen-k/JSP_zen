<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpw.jsp(id, name, rrn1, rrn2) -> findpwProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdto" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<%
	MemberDao mdao = MemberDao.getInstance();
	MemberDTO member = mdao.findpw(mdto);
	
	String msg = "없는 회원입니다.";
	String url = request.getContextPath() + "/main.jsp";
	if(member != null){
		msg = mdto.getName() + "님의 비밀번호는 [" + member.getPassword() + "] 입니다";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>