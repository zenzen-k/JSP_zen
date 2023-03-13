<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

template.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String contentPage = request.getParameter("contentPage"); 
	// main.jsp -> content.jsp를 담아서 넘어옴
	// company_forward.jsp -> company.jsp
%>
<table border="1" width="500" height="300">
	<tr>
		<td colspan="2">
			<jsp:include page="top.jsp"/>
		</td>
	</tr>
	
	<tr>
		<td>
			<jsp:include page="left.jsp"/>
		</td>
		<td>
			<!-- contentPage에 담긴 company.jsp, goods.jsp 담겨야함 -->
			<jsp:include page="<%=contentPage%>"/>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<%@ include file="bottom.jsp" %>
		</td>
	</tr>
</table>