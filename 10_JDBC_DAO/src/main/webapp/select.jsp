<%@page import="DTO.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
	table{
		border-color: blue;
		width: 80%;
		margin: auto;
		text-align: center;
	}
	th{ /* or tr:first-child */
		background: yellow;
	}
</style>
select.jsp<br>

<jsp:useBean id="bdao" class="DTO.BookDao"/>
<%
	ArrayList<BookBean> lists = bdao.getAllBook();
	String[] th = {"번호","제목","저자","출판사","가격","입고일","배송비","구입 가능 서점","보유수량","수정","삭제"};
%>
<table border="1">
	<tr>
		<%
		for(int i=0; i<th.length; i++){
			out.print("<th>"+th[i]+"</th>");
		}
		%>
	</tr>
	
	
	<%
	for(BookBean bb : lists){
	%>
		<tr>
			<td><%=bb.getNo()%></td>
			<td><%=bb.getTitle()%></td>
			<td><%=bb.getAuthor()%></td>
			<td><%=bb.getPublisher() %></td>
			<td><%=bb.getPrice()%></td>
			<td><%=bb.getBuy()%></td>
			<td><%=bb.getKind()%></td>
			<td><%=bb.getBookstore()%></td>
			<td><%=bb.getCount()%></td>
			<td><a href="updateForm.jsp">수정</a></td>
			<td><a href="deleteProc.jsp">삭제</a></td>
		</tr>
	<%
	}
	%>

</table>

<br><br>
<a href="insertForm.jsp">삽입</a>