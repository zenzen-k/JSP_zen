<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
categoryUpdate_Proc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String cname = request.getParameter("cname");
	String cnum = request.getParameter("cnum");
	// my.shop.CategoryBean cb = new my.shop.CategoryBean();
	
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.updateCategory(code, cname, cnum);
	
	String msg = "수정 실패";
	String url = "category_update.jsp?cnum=" + cnum;
	
	if(cnt == 1){
		msg = "수정 성공";
		url = "category_list.jsp";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>