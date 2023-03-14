<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex06_Result_김아연.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bean" class="myPkg.Ex06_Bean_김아연"/>
<jsp:setProperty property="*" name="bean"/>
<h1>도서 정보 입력 내용입니다.</h1>

<table border="1">
<tr>
	<td>제목</td>
	<td><jsp:getProperty property="title" name="bean"/></td>
</tr>

<tr>
	<td>저자</td>
	<td><jsp:getProperty property="author" name="bean"/></td>
</tr>

<tr>
	<td>출판사</td>
	<td><jsp:getProperty property="publisher" name="bean"/></td>
</tr>

<tr>
	<td>가격</td>
	<td><jsp:getProperty property="price" name="bean"/></td>
</tr>

<tr>
	<td>입고일</td>
	<td><jsp:getProperty property="date" name="bean"/></td>
</tr>

<tr>
	<td>배송비</td>
	<td><jsp:getProperty property="kind" name="bean"/></td>
</tr>

<tr>
	<td>구입가능 서점</td>
	<td>
		<%
			String[] bookstore = bean.getBookstore();
			for(int i=0; i<bookstore.length; i++){
				out.print(bookstore[i] + " ");
			}
		%>
	</td>
</tr>

<tr>
	<td>보유수량</td>
	<td><jsp:getProperty property="count" name="bean"/></td>
</tr>
</table>
