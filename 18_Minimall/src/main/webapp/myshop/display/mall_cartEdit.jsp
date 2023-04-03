<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartList.jsp (주문수량 수정 클릭 - 상품번호pnum, 수정할주문수량oqty) -> mall_cartEdit.jsp -->

<!-- DB가 아닌 장바구니의 상품을 수정할 것임 -->
<!-- 하나의 장바구니를 세션으로 계속 끌고다니기 위해서 꼭 동일한 id 작성 -->
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%
	String pnum = request.getParameter("pnum");
	String oqty = request.getParameter("oqty");
	
	mallCart.setEdit(pnum, oqty);
	// 수량 수정 후 다시 목록보기로 돌아가야함
%>
<script>
	alert("수정완료");
	location.href="mall_cartList.jsp";
</script>