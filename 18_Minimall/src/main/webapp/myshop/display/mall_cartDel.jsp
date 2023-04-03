<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartList.jsp(pnum) -> mall_cartDel.jsp -->

<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%
	String pnum = request.getParameter("pnum");
	
	mallCart.removeProduct(pnum);
	//response.sendRedirect("mall_cartList.jsp");
%>

<script>
	alert('삭제완료');
	location.href="mall_cartList.jsp";
</script>