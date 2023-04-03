<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_view.jsp<br> -->
<%@ include file="top.jsp"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
$(function() {
	//alert(1);
	//$('th').attr('class',"m2");
	$('th').addClass("m2");
});
</script>

<% 
	String pnum = request.getParameter("pnum");
	System.out.println(pnum);
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getProductByNum(pnum);
%>

<td colspan="6" align="center" valign="top">
	<b>상품 상세보기</b>

	<table width="700" class="outline" border="1">
		<tr>
			<th width="15%">카테고리</th>
			<td width="35%"><%=pb.getPcategory_fk()%></td>
			<th width="15%">상품번호</th>
			<td width="35%"><%=pnum%></td>
		</tr>
		
		<tr>
			<th>상품명</th>
			<td><%=pb.getPname()%></td>
			<th>제조회사</th>
			<td><%=pb.getPcompany()%></td>
		</tr>
		
		<tr>
			<th>상품이미지</th>
			<td colspan="3" align="center">
				<img width="120" height="120" src="<%=request.getContextPath()%>/myshop/images/<%=pb.getPimage()%>">
			</td>
		</tr>
		
		<tr>
			<th>상품 수량</th>
			<td><%=pb.getPqty()%></td>
			<th>상품 가격</th>
			<td><%=pb.getPrice()%></td>
		</tr>
		
		<tr>
			<th>상품 스펙</th>
			<td><%=pb.getPspec()%></td>
			<th>상품 포인트</th>
			<td><%=pb.getPoint()%></td>
		</tr>
		
		<tr>
			<th>상품소개</th>
			<td colspan="3">
				<textarea cols="60" rows="5" disabled style="resize: none"><%=pb.getPcontents()%></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" class="m1" align="center">
				<input type="button" value="돌아가기" onclick="history.go(-1)"> <!-- 또는 history.back()  -->
				<!-- 또는 submit으로 작성해서 form의 action에 productlist.jsp를 넣어주면 된당 -->
			</td>
		</tr>
	</table>
</td>
<%@ include file="bottom.jsp"%>