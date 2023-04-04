<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
content.jsp(글수정 num) => updateForm.jsp<br>
 <%@ include file="../display/mall_top.jsp"%>
<%@ include file="color.jsp" %>
<link rel="stylesheet" type="text/css" href="./style.css">
<style>
	body{
		text-align: center;
		background-color: #e0ffff;
	}
	table{
		margin: auto;
		/* width: 500px; */
	}
	td:nth-child(1) {
		text-align: center;
		background-color: #b0e0e6;
		/* width: 15%; */
	}
</style>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script> <!-- writeSave 함수호출을 위해서  -->

<%
	String pageNum = request.getParameter("pageNum");
	String num = request.getParameter("num");
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.getContentByNum(num);
%>

<b>글수정</b>
<form name="writeForm" action="updateProc.jsp" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="pageNum" value="<%=pageNum%>">
<table width="100%">
	<tr>
		<td>이 름</td>
		<td><input type="text" name="writer" size="30" value="<%=bb.getWriter()%>"></td>
	</tr>
	
	<tr>
		<td>제 목</td>
		<td><input type="text" name="subject" size="56" value="<%=bb.getSubject()%>"></td>
	</tr>
	
	<tr>
		<td>Email</td>
		<td><input type="text" name="email" size="56" value="<%=bb.getEmail()%>"></td>
	</tr>
	
	<tr>
		<td>내 용</td>
		<td>
			<textarea rows="15" cols="55" name="content"><%=bb.getContent()%></textarea>
		</td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	
	<tr height="30">
		<td colspan="2" align="center" >
			<input type="submit" value="글수정">
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기" onclick="location.href='select.jsp'">
		</td>
	</tr>
</table>
</form>
<%@ include file="../display/mall_bottom.jsp"%>