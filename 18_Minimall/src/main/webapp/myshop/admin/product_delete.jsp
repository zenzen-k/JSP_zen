<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- product_delete.jsp -->

<%
	String pnum = request.getParameter("pnum");
	
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.productDelete(pnum);
	
	String msg = "삭제 실패";
	if(cnt == 1){
		msg = "삭제 성공";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="product_list.jsp";
</script>