<%@page import="myPkg.EmplBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.EmplDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	table{
		width: 70%;
		height: 30%;
		border: 1px solid black;
		text-align: center;
		margin: auto;
	}
	tr:first-child{
		background: yellow;
	}
</style>

select.jsp<br>

<%-- <%EmplDao edao = new EmplDao();%> --%>
<jsp:useBean id="edao" class="myPkg.EmplDao"/>
<%
	ArrayList<EmplBean> lists = edao.getAllEmpl();
	
	for(EmplBean x : lists){
		System.out.print(x.getNum() + " ");
		System.out.print(x.getName() + " ");
		System.out.print(x.getDeptno() + " ");
		System.out.print(x.getSalary() + "\n");
	}
%>

<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>부서번호</th>
		<th>급여</th>
	</tr>
	<%
		// for(EmplBean x : lists){
		// x.getNum() 확장 for문이면 이렇겡//
		for(int i=0; i<lists.size(); i++){
			%>
			<tr>
				<td><%=lists.get(i).getNum()%></td>
				<td><%=lists.get(i).getName()%></td>
				<td><%=lists.get(i).getDeptno()%></td>
				<td><%=lists.get(i).getSalary()%></td>
			</tr>
			<% 
		}
	%>
</table>

<br>
<a href="insertForm.jsp">삽입</a>