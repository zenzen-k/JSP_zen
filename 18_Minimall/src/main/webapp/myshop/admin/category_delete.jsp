<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- category_list.jsp(cnum) -> category_delete.jsp<br> -->

<%
	String cnum = request.getParameter("cnum");

	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.deleteCategory(cnum);
	
	String msg = "삭제실패";
	if(cnt == 1)
		msg = "삭제성공";
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href="category_list.jsp";
</script>