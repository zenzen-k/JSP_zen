<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="color.jsp" %>
<link rel="stylesheet" type="text/css" href="./style.css">
<style type="text/css">
	body, table{
		text-align: center;
		background-color: #e0ffff;
	}
	table{
		margin: auto;
		width: 500px;
		height: 50px;
	}
	td:nth-child(odd) {
		background-color: #b0e0e6;
	}
	td{
		width: 25%;
		height: 30px;
	}
</style>
<%
	String num = request.getParameter("num");
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.getArticleByNum(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<b>글내용 보기</b>
<form name="contentForm">
<table>
	<tr>
		<td>글번호</td>
		<td><%=bb.getNum()%></td>
		<td>조회수</td>
		<td><%=bb.getReadcount()%></td>
	</tr>
	
	<tr>
		<td>작성자</td>
		<td><%=bb.getWriter()%></td>
		<td>작성일</td>
		<td><%=sdf.format(bb.getReg_date())%></td>
	</tr>
	
	<tr>
		<td>글제목</td>
		<td colspan="3"><%=bb.getSubject()%></td>
	</tr>
	
	<tr>
		<td>글내용</td>
		<td colspan="3" align="left"><pre><%=bb.getContent()%></pre></td>
	</tr>
	
	<tr>
		<td colspan="4" align="right">
			<input type="button" value="글수정" onClick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
			<input type="button" value="글삭제">
			<input type="button" value="답글쓰기">
			<input type="button" value="글목록" onclick="location.href='select.jsp'">
		</td>
	</tr>
</table>
</form>
