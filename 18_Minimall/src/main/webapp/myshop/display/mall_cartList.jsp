<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartAdd.jsp => mall_cartList.jsp -->
<%@ include file="mall_top.jsp"%>

<!-- 세션을 설정했으므로 새로운 객체가 생성되는 것이 아닌 아까 만든 객체를 계속 끌고 다니는것임. 주의점은 id의 값을 바꾸면 안된다는 것이다. -->
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%
	Vector<ProductBean> cv = mallCart.getAllProducts();
	DecimalFormat df = new DecimalFormat("###,###");
%>


<table border="1" width="100%">
	<tr class="m2" height="60">
		<th colspan="6">장바구니 보기</th>
	</tr>
	
	<tr>
		<th width="10%">번호</th>
		<th width="20%">상품명</th>
		<th width="20%">수량</th>
		<th width="20%">단가</th>
		<th width="20%">금액</th>
		<th>삭제</th>
	</tr>
	
	<%
	int sumPrice = 0; // cartTotalPrice = 0;
	int sumPoint = 0;
	
	if(cv.size() == 0){
		out.print("<tr><td colspan='6' align='center' height='60'>장바구니에 담은 상품이 없습니다.</td></tr></table>");
	}else{
	
		for(ProductBean pb : cv){
			sumPrice += pb.getPrice() * pb.getPqty();
			sumPoint += pb.getPoint() * pb.getPqty();
		%>
			<tr>
				<td align="center"><%=pb.getPnum()%></td>
				<td align="center">
					<img src="<%=request.getContextPath()%>/myshop/images/<%=pb.getPimage()%>" width="50" height="50"><br>
					<b><%=pb.getPname()%></b>
				</td>
				<td align="center">
					<form name="f"method="post">
						<input type="text" name="oqty" value="<%=pb.getPqty()%>" size="2"> 개 
						<input type="button" value="수정">
					</form>
				</td>
				<td align="right">
					<b><%=df.format(pb.getPrice())%> 원</b><br>
					<b>[<%=df.format(pb.getPoint())%>] point</b>
				</td>
				<td align="right">
					<font color="red"><b><%=df.format(pb.getPrice() * pb.getPqty())%> 원</b></font><br>
					<font color="red"><b>[<%=df.format(pb.getPoint() * pb.getPqty())%>] point</b></font>
				</td>
				<td align="center"><a href="">삭제</a></td>
			</tr>
		<%
		}
		%>
		
		<tr class="m1">
			<td colspan="4">
				<b>장바구니 총액 : </b>
				<font color="red"><%=df.format(sumPrice)%> 원</font><br>
				<font color="green">총 적립 포인트 : [<%=df.format(sumPoint)%>] point</font>
			</td>
			<td colspan="2" align="center">
				<a href="">[주문하기]</a>
				<a href="">[계속 쇼핑]</a>
			</td>
		</tr>
		
	</table>
	<%}//else %>
<%@ include file="mall_bottom.jsp"%>