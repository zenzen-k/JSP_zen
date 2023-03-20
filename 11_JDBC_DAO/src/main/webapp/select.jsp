<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
table{
	width: 800px;
	text-align: center;
}
</style>

<jsp:useBean id="sdao" class="myPkg.StudentDao"/>
<%
	String[] th = {"번호","아이디","비번","이름","생년월일","취미","C언어","JAVA","JSP","합계","수정","삭제"};
	ArrayList<StudentBean> lists = sdao.getAllStudent();
%>
<table border='1'>
	<tr>
		<%for(String x : th){%>
			<th><%=x%></th>
		<%}%>
	</tr>
	<%
	for(StudentBean sb : lists){
	%>
	<tr>
		<td><%=sb.getNum()%></td>
		<td><%=sb.getId()%></td>
		<td><%=sb.getPasswd()%></td>
		<td><%=sb.getName()%></td>
		<td><%=sb.getYear()%>-<%=sb.getMonth()%>-<%=sb.getDay()%></td>
		<td><%=sb.getHobby()%></td>
		<td><%=sb.getC()%></td>
		<td><%=sb.getJava()%></td>
		<td><%=sb.getJsp()%></td>
		<td><%=sb.getSum()%></td>
		<td><a href="">수정</a></td>
		<td><a href="">삭제</a></td>
	</tr>
	<%
	}
	%>
</table>

<!-- 함수로 위치이동하던지 아래처럼 바로가던지~ -->
<input type="button" value="삽입" onclick="location.href='insertForm.jsp'">