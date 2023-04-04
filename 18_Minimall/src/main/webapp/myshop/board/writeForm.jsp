<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>
<%@ include file="../display/mall_top.jsp"%>
<link rel="stylesheet" type="text/css" href="./style.css">
<style>
	body{
		text-align: center;
		background-color: #e0ffff;
	}
	table{
		margin: auto;
		/* width: 650px; */
	}
	td:nth-child(1) {
		text-align: center;
		background-color: #b0e0e6;
	}
	/* tr:first-child td:first-child{
		text-align: right;
	} */
</style>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>

<b>글쓰기</b>
<form method="post" name="writeForm" action="writeProc.jsp" onsubmit="return writeSave()"> <!-- submit 클릭했을때 -->
<table width="100%">
	<tr>
		<td colspan="2">
			<a href="select.jsp">글목록</a>
		</td>
	</tr>
	
	<tr>
		<td>이 름</td>
		<td><input type="text" name="writer" size="60" value="<%=session.getAttribute("sid")%>"></td>
	</tr>
	
	<tr>
		<td>제 목</td>
		<td><input type="text" name="subject" size="80"></td>
	</tr>
	
	<tr>
		<td>Email</td>
		<td><input type="text" name="email" size="80"></td>
	</tr>
	
	<tr>
		<td>내 용</td>
		<td>
			<textarea rows="10" cols="75" name="content"></textarea>
		</td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	
	<tr height="30">
		<td colspan="2" align="center" >
			<input type="submit" value="글쓰기">
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기" onclick="location.href='select.jsp'">
		</td>
	</tr>
</table>
</form>

<%@ include file="../display/mall_bottom.jsp"%>