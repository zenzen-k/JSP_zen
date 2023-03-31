<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.mall.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_prodView.jsp(상세보기에서 장바구니 클릭해서 상품번호pnum, 주문수량oqty 을 가지고옴) -> mall_cartAdd.jsp -->

<%
	String pnum = request.getParameter("pnum");
	String oqty = request.getParameter("oqty");
	
	System.out.println("pnum : " + pnum + ", oqty : " + oqty);
	
	//CartBean mallCart = new CartBean();
%>
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/> <!-- 세션동안 객체유지함. -->
<!-- 객체를 생성하고 생성자를 호출함으로써 장바구니가 만들어짐~ -->

<%
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getProductByNum(pnum);
	
	// 상품번호와 주문수량을 넘긴다.
	mallCart.addProduct(pnum, oqty);
	response.sendRedirect("mall_cartList.jsp");
%>