<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		/* width: 500px; */
		height: 50px;
	}
	td:nth-child(odd) {
		background-color: #b0e0e6;
	}
	td{
		/* width: 25%; */
		height: 30px;
	}
</style>
<%
	String pageNum = request.getParameter("pageNum");
	String num = request.getParameter("num");
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.getArticleByNum(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<b>글내용 보기</b>
<form name="contentForm">
<table width="100%">
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
			<input type="button" value="글수정" onClick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="답글쓰기" onClick="location.href='replyForm.jsp?ref=<%=bb.getRef()%>&re_step=<%=bb.getRe_step()%>&re_level=<%=bb.getRe_level()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="글목록" onclick="location.href='select.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>
</table>
</form>
<%@ include file="../display/mall_bottom.jsp"%>