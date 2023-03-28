<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="./style.css">
<style type="text/css">
	td:first-child {
		background-color: yellow;
	}
	tr:last-child td {
		background-color: #fc0;
	}
</style>

main.jsp<br>
<b>[로그인 화면]</b>

<form method="post" action="loginProc.jsp">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" value="admin"></td>
	</tr>
	
	<tr>
		<td>비번</td>
		<td><input type="password" name="password" value="1234"></td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="submit" value="로그인">
			<input type="button" value="회원 가입" onclick="location.href='<%=request.getContextPath()%>//myshop/member/register.jsp'">
			<input type="button" value="아이디 찾기" onclick="location.href='<%=request.getContextPath()%>/myshop/member/findid.jsp'">
			<input type="button" value="비번 찾기" onclick="location.href='<%=request.getContextPath()%>/myshop/member/findpw.jsp'">
		</td>
	</tr>

</table>
</form>