<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
result1.jsp<br>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	// request: form.jsp 의 정보
	
	session.setAttribute("sid", id); // 속성명, 값 (sid='kim') 속성명은 내맘대루
	session.setAttribute("spw", passwd);
	
	session.setMaxInactiveInterval(10); // 10초 default session time : 30분
%>
<%-- 아이디 : <%=id %><br>
비밀번호 : <%=passwd %><br> --%>

<form method="post" action="result2.jsp">
	<%-- 아이디 : <input type="text" name="id" value="<%=id %>"> <br>
	비밀번호 : <input type="password" name="passwd" value="<%=passwd %>"> <br> --%>
	
	<%-- <input type="hidden" name="id" value="<%=id %>">
	<input type="hidden" name="passwd" value="<%=passwd %>"> --%>
	
	♤스포츠♤ : <br>
	<input type="radio" name="sports" value="태권도">태권도
	<input type="radio" name="sports" value="유도">유도
	<input type="radio" name="sports" value="프로레슬링">프로레슬링
	<input type="radio" name="sports" value="탁구">탁구
	<br>
	
	★게임★ : <br>
	<select name="game">
		<option value="LOL">리그오브레전드</option>
		<option value="오버워치">오버워치</option>
		<option value="GTA5">GTA5</option>
		<option value="젤다의 전설">젤다의 전설</option>
	</select>
	<br>
	<input type="submit" value="로그인">
</form>
