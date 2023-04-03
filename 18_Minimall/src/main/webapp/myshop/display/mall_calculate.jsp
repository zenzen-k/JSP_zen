<%@page import="my.shop.mall.OrdersDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_order.jsp(결제하기 버튼 클릭) -> mall_calculate.jsp -->

<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%
	Vector<ProductBean> clists = mallCart.getAllProducts();
	
	// 회원 번호
	int sno = (Integer)session.getAttribute("sno"); // 오브젝트라서 Integer로!!
	
	OrdersDao odao = OrdersDao.getInstance();
	int cnt = odao.insertOrder(sno, clists);
	
	System.out.println("결제 cnt : " + cnt);
	
	String msg = "";
	String url = "";
	if(cnt > 0){ // 정확하게 하려면 clists.size 와 같아야한다
		mallCart.removeAllProduct();
		msg = "주문 완료";
		url = "mall.jsp";
		%>
		<script>
			alert("<%=msg%>");
			var resp = confirm("계속 하시겠습니까?");
			if(resp){ // 확인
				location.href="<%=url%>";
			}else{
				location.href="<%=request.getContextPath()%>/logout.jsp";
			}
		</script>
		<%
	} else{
		msg = "주문 실패";
		url = "mall.jsp";
	}
%>

<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
