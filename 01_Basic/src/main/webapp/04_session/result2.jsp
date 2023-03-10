<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

result2.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String sports = request.getParameter("sports");
	String game = request.getParameter("game");
	// request: result1.jsp 의 정보..
	
	Object obj = session.getAttribute("spw");
%>

아이디 : <%=id %><br>
아이디2 : <%=session.getAttribute("sid") %><br>
비밀번호 : <%=passwd %><br>
비밀번호 : <%=obj%><br>
스포츠 : <%=sports %><br>
게임 : <%=game %><br>

<%
	session.invalidate(); // 세션 무효화
%>