<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
content(부모정보3가지(ref, re_step, re_level)) => replyForm.jsp<br>
<%@ include file="color.jsp" %>
<link rel="stylesheet" type="text/css" href="./style.css">
<style>
	body{
		text-align: center;
		background-color: #e0ffff;
	}
	table{
		margin: auto;
		width: 650px;
	}
	td:nth-child(1) {
		text-align: center;
		background-color: #b0e0e6;
	}
	tr:first-child td:first-child{
		text-align: right;
	}
</style>


<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>

<%
	String ref = request.getParameter("ref");
	String re_step = request.getParameter("re_step");
	String re_level = request.getParameter("re_level");
	System.out.println(ref + ", " + re_step + ", " + re_level); // 부모정보
	// 또는 번호를 넘겨서 부모번호에 해당하는 것을 select로 가져와도 되긴하는데, 그냥 3개 정보넘기기
	
	String pageNum = request.getParameter("pageNum");
%>


<b>글쓰기</b>
<form method="post" name="writeForm" action="replyProc.jsp" onsubmit="return writeSave()"> <!-- submit 클릭했을때 -->

<input type="hidden" name="pageNum" value="<%=pageNum%>">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">

<table>
	<tr>
		<td colspan="2">
			<a href="select.jsp">글목록</a>
		</td>
	</tr>
	
	<tr>
		<td>이 름</td>
		<td><input type="text" name="writer" size="60"></td>
	</tr>
	
	<tr>
		<td>제 목</td>
		<td><input type="text" name="subject" size="80" value="[답글]"></td>
	</tr>
	
	<tr>
		<td>Email</td>
		<td><input type="text" name="email" size="80"></td>
	</tr>
	
	<tr>
		<td>내 용</td>
		<td>
			<textarea rows="20" cols="75" name="content"></textarea>
		</td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	
	<tr height="30">
		<td colspan="2" align="center" >
			<input type="submit" value="답글쓰기">
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기" onclick="location.href='select.jsp'">
		</td>
	</tr>
</table>
</form>