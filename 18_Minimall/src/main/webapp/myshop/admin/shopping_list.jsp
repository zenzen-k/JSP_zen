<%@page import="my.shop.mall.OrdersBean"%>
<%@page import="java.util.Vector"%>
<%@page import="my.shop.mall.OrdersDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shopping_list.jsp<br> -->

<%@ include file="top.jsp"%>
<td colspan="6" align="center">
<!-- 사용자가 구매한 내역 불러오기 -->

<%
	DecimalFormat df = new DecimalFormat("###,###");

	String memid = request.getParameter("memid");
	System.out.println("memid : " + memid);
	// 맨 처음 검색어가 없을 때 memid 에는 null값이 들어간다.
	
	OrdersDao odao = OrdersDao.getInstance();
	Vector<OrdersBean> olists = null;
	if(memid != null){
		olists = odao.getOrderList(memid);
	}
%>


<table border="1" width="100%">
	<tr>
		<td colspan="5" align="center">
			<form action="shopping_list.jsp" method="post">
				조회할 회원 아이디 입력 : 
				<input type="text" name="memid" value="hong">
				<input type="submit" value="내역 조회">
			</form>
		</td>
	</tr>
	
	<tr bgcolor="#d5d5d5">
		<th>고객명</th>
		<th>아이디</th>
		<th>상품명</th>
		<th>수량</th>
		<th>금액</th>
	</tr>
	
	<%
	int sumprice = 0;
	if(olists != null){
		for(OrdersBean ob : olists){
		%>
			<tr>
				<td align="center"><%=ob.getMname()%></td>
				<td align="center"><%=ob.getMid()%></td>
				<td align="center"><%=ob.getPname()%></td>
				<td align="right"><%=ob.getQty()%></td>
				<td align="right"><%=df.format(ob.getAmount())%></td>
			</tr>
		<%
		sumprice += ob.getAmount();
		}
	}
	%>
	
	<tr>
		<td colspan="4" align="center">총 합</td>
		<td align="right">&#8361;<%=df.format(sumprice)%></td>
	</tr>

</table>

</td>
<%@ include file="bottom.jsp"%>