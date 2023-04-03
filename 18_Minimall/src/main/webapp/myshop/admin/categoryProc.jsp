<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- category_input.jsp(code, cname) -> categoryProc.jsp<br> -->

<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String cname = request.getParameter("cname");
	
	// my.shop.CategoryBean cb = new my.shop.CategoryBean();
	
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.insertCategory(code, cname);
	
	String msg = "등록 실패";
	String url = "category_input.jsp";
	
	if(cnt == 1){
		msg = "등록 성공";
		url = "category_list.jsp";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>