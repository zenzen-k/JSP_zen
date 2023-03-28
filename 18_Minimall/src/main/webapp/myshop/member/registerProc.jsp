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

	String msg = "가입 실패";
	String url = "register.jsp";

	if(cnt==1){
		msg = "가입 성공";
		//url = "../../main.jsp";
		url = request.getContextPath() + "/main.jsp"; 
		// 출력은 18까지이지만 webapp까지 포함
		// 즉, 18_Minimall\src\main\webapp 임!
	}
%>

<script type="text/javascript">
	alert("<%=msg%>"+"했습니다");
	location.href="<%=url%>";
</script>