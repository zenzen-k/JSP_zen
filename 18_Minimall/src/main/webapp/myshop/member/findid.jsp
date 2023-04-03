<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">
<style type="text/css">
	td:first-child {
		background-color: yellow;
	}
	table{
		text-align: center;
		margin: auto;
	}
	tr:last-child td{
		background-color: #fc0;
	}
</style>

main.jsp -> findid.jsp<br>

<form action="findidProc.jsp" method="post">
<table border="1">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	
	<tr>
		<td>주민등록번호</td>
		<td>
			<input type="text" name="rrn1" maxlength="6" size="7"> - 
			<input type="text" name="rrn2" maxlength="7" size="7">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="submit" value="아이디 찾기">
		</td>
	</tr>
</table>
</form>