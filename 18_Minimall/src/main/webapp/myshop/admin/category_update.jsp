<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
category_update.jsp<br>

<%@include file="top.jsp" %>

<% 
	String cnum = request.getParameter("cnum");

	CategoryDao cdao = CategoryDao.getInstance();
	CategoryBean cb = cdao.getCategoryByIno(cnum);
%>

<td colspan="6" align="center" valign="top">
	<form method="post" action="categoryUpdate_Proc.jsp">
	<b>카테고리 수정</b>
	
	<input type="hidden" name="cnum" value="<%=cb.getCnum()%>">
	<table border="1">
		<tr>
			<td bgcolor="yellow" align="center">
				카테고리 코드
			</td>
			<td>
				<input type="text" name="code" value="<%=cb.getCode()%>">
			</td>
		</tr>
		
		<tr>
			<td bgcolor="yellow" align="center">
				카테고리 이름
			</td>
			<td>
				<input type="text" name="cname" value="<%=cb.getCname()%>">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center" bgcolor="#fc0">
				<input type="submit" value="등록">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	</form>
</td>

<%@include file="bottom.jsp" %>