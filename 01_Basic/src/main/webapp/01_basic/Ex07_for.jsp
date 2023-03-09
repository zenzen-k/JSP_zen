<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String[] str = {"JSP","정말","재미","있다"}; %>

<table border=1 style="text-align: center; width: 300px">
	<tr>
		<th>배열의 인덱스</th>
		<th>배열의 내용</th>
	</tr>
	<%
  	for(int i=0; i<str.length; i++){
  		out.print("<tr><td>" + i + "</td>");
  		out.print("<td>" + str[i] + "</td></tr>");
  	}
  	%>
	
	<!-- 다른방법 -->
<% for(int i=0; i<str.length; i++){ %>
	<tr>
		<td><%=i %></td>
		<td><%=str[i] %></td>
	</tr>
<% } %>

</table>
