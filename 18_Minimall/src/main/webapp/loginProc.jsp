<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
main.jsp -> loginProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDao mdao = MemberDao.getInstance();
	MemberDTO member = mdao.getMemberInfo(id, password);
	
	String viewPage = null;
	
	if(member != null){//존재여부
		String _id = member.getId();
		if(_id.equals("admin")){ //관리자
			viewPage = request.getContextPath() + "/myshop/admin/main.jsp";
		}
		else{ //일반
			viewPage = request.getContextPath() + "/myshop/display/mall.jsp";
		}
	} else{ //존재하지 않음
		viewPage = "main.jsp";
	%>
		<script type="text/javascript">
			alert("가입하지 않은 회원입니다");
		</script>
	<%
	}
%>

<script type="text/javascript">
	location.href="<%=viewPage%>";
</script>