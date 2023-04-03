<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="my.shop.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartList.jsp(00, 00) -> mall_order.jsp -->
<!-- 상품상세보기에서도 옴.
	mall_prodView.jsp(pnum, oqty) -> mall order.jsp -->

<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>

<%@ include file="mall_top.jsp"%>
<%
	boolean flag1 = (boolean)application.getAttribute("flag1");
	//상세보기에서 pnum, oqty넘어옴
	String pnum = request.getParameter("pnum");
	String oqty = request.getParameter("oqty");
	
	if(!pnum.equals("00") && !oqty.equals("00")){ // 아닐떄 , 즉 즉시구매누를떄~
		//return;
		if(flag1){ // flag 가 true 일때 장바구니 추가함.
			mallCart.addProduct(pnum, oqty);
		}
	}
	
	Vector<ProductBean> lists = mallCart.getAllProducts();
	DecimalFormat df = new DecimalFormat("###,###");
%>


<table border="1" width="90%" class="outline">
	<tr height="60" class="m2">
		<th colspan="3">결제 내역서 보기</th>
	</tr>
	
	<tr class="m1">
		<th width="40%">상품명</th>
		<th>수량</th>
		<th>금액</th>
	</tr>
	
	<%
	int sumprice = 0;
	for(ProductBean pb : lists){
		sumprice += pb.getPrice() * pb.getPqty();
	%>
		<tr>
			<td align="center"><%=pb.getPname()%></td>
			<td align="right"><%=df.format(pb.getPqty())%>개</td>
			<td align="right"><%=df.format(pb.getPrice() * pb.getPqty())%>원</td>
		</tr>
	<%		
	}
	%>
	
	<tr class="m1">
		<td colspan="3"  align="center">
			<b>결제하실 총액은 : <font color="red"><%=df.format(sumprice)%> 원</font></b>
		</td>
	</tr>
</table>

<br><br>

<input type="button" value="결제하기" onclick="location.href='mall_calculate.jsp'">

<br><br>
<%
	application.setAttribute("flag1", false);
%>
<%@ include file="mall_bottom.jsp"%>