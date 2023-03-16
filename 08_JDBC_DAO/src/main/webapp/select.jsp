<%@page import="myPkg.EmplBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.EmplDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	table{
		width: 70%;
		height: 100px%;
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
		<th>수정</th>
		<th>삭제</th>
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
				<!-- 아ㅓ래 변수ㅠ이름 num자리에는 아무거나 작성해도 된다. -->
				<!-- 번호를 넘기는 이유 : 다음 폼에서 해당 번호에 관한 이름등 내용이 자동으로 들어가게 하려고 -->
				<td><a href="updateForm.jsp?num=<%=lists.get(i).getNum()%>">수정</a></td>
				<td><a href="deleteProc.jsp?num=<%=lists.get(i).getNum()%>">삭제</a></td>
			</tr>
			<% 
		}
	%>
</table>

<br>
<a href="insertForm.jsp">삽입</a>