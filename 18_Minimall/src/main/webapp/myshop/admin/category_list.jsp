<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- category_list.jsp<br> -->


<%@ include file="top.jsp" %>
<%
	ArrayList<CategoryBean> lists = new ArrayList<CategoryBean>();
	CategoryDao cdao = CategoryDao.getInstance();
	lists = cdao.getAllCategory();
%>
<td colspan="6" align="center" valign="top"> <!-- 2번쨰 tr 시작 -->
	<b>카테고리 목록</b>
	<table border="1" width="600" style="text-align: center;">
		<tr bgcolor="yellow">
			<th>번호</th>
			<th>카테고리 코드</th>
			<th>카테고리명</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<%
		if(lists.size()==0){
			out.println("<tr><td colspan=4 align='center'>등록된 카테고리가 없습니다.</td></tr>");
		}else{
			for(int i=0; i<lists.size(); i++){
			%>
			<tr>
				<td><%=lists.get(i).getCnum() %></td>
				<td><%=lists.get(i).getCode() %></td>
				<td><%=lists.get(i).getCname() %></td>
				<td><a href="category_delete.jsp?cnum=<%=lists.get(i).getCnum() %>">삭제</a></td>
				<td><a href="category_update.jsp?cnum=<%=lists.get(i).getCnum() %>">수정</a></td>
			</tr>
			<%
			}
		}
		%>
	</table>
</td>

<%@ include file="bottom.jsp" %> <!-- 2번쨰 tr 끝 -->