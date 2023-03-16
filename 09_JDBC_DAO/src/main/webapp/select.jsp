<%@page import="myPkg.MartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
	teble{
		text-align: center;
	}
</style>
    
select.jsp<br><br>

<jsp:useBean id="mdao" class="myPkg.MartDao"/>
<%
	ArrayList<MartBean> lists = mdao.getAllMart();
%>

<table border="1">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>비번</th>
		<th>상품</th>
		<th>시간대</th>
		<th>결제</th>
		<th>동의</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	
	<%
	for(MartBean mb : lists){
	%>
	<tr>
		<td><%=mb.getNum()%></td>
		<td><%=mb.getId()%></td>
		<td><%=mb.getPw()%></td>
		<td><%=mb.getProduct()%></td>
		<td><%=mb.getTime()%></td>
		<td><%=mb.getApprove()%></td>
		<td><%=mb.getAgree()%></td>
		<td><a href="updateForm.jsp">수정</a></td>
		<td><a href="deleteProc.jsp?num=<%=mb.getNum()%>">삭제</a></td>
	</tr>
	<%
	}
	%>
</table>
<br><br>
<a href="insertForm.jsp">삽입</a>