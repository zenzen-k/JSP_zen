<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
content.jsp(num) => deleteForm.jsp<br>
<%@ include file="../display/mall_top.jsp"%>
<%@ include file="color.jsp" %>
<link rel="stylesheet" type="text/css" href="./style.css">
<style type="text/css">
	body, table{
		text-align: center;
		background-color: #e0ffff;
	}
	table{
		margin: auto;
		/* width: 350px; */
		height: 50px;
	}
	tr:nth-child(odd) {
		background-color: #b0e0e6;
	}
	td{
		height: 30px;
	}
</style>

<b>글삭제</b>

<% 
String num = request.getParameter("num"); 
String pageNum = request.getParameter("pageNum");
%>

<form name="deleteForm" action="deleteProc.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="pageNum" value="<%=pageNum%>">
<table>
	<tr>
		<td><B>비밀번호를 입력해 주세요.</B></td>
	</tr>
	
	<tr>
		<td>비밀번호 : <input type="password" name="passwd" size="10"></td>
	</tr>
	
	<tr>
		<td>
			<input type="submit" value="글삭제">
			<input type="button" value="글목록" onclick="location.href='select.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>
</table>
</form>
<%@ include file="../display/mall_bottom.jsp"%>