<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- product_list.jsp<br> -->

<%@ include file="top.jsp"%>

<td colspan="6" align="center" valign="top">

	<%
	String[] title = {"번호","상품코드","상품명","이미지","가격","제조사","수량","수정 | 삭제"};

	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> lists = pdao.getAllProduct();
	%>
	
	<b>상품목록</b>
	<table class="outline" width="100%">
		<tr>
			<% for(int i=0; i<title.length; i++){ %>
			<th class="m2"><%=title[i]%></th>
			<% } %>
		</tr>

		<% 
		if(lists.size() == 0){
			out.print("<tr><td colspan='8' align='center'>등록한 상품이 없습니다<td></tr>");
		}
		else{
			for(int i=0; i<lists.size(); i++){ %>
			<tr>
				<td align="center"><%=lists.get(i).getPnum()%></td>
				<td align="center"><%=lists.get(i).getPcategory_fk()%></td>
				<td align="center"><%=lists.get(i).getPname()%></td>
				<td align="center">
					<a href="product_view.jsp?pnum=<%=lists.get(i).getPnum()%>">
						<img width="40" height="40" alt="없음" 
						src="<%=request.getContextPath() + "/myshop/images/" + lists.get(i).getPimage()%>">
					</a>
				</td>
				<td align="right"><%=lists.get(i).getPrice()%></td>
				<td align="center"><%=lists.get(i).getPcompany()%></td>
				<td align="right"><%=lists.get(i).getPqty()%></td>
				<td align="center">
					<a href="product_update.jsp">수정</a> | 
					<a href="product_delete.jsp?pnum=<%=lists.get(i).getPnum()%>">삭제</a></td>
			</tr>
			<% }
		}%>
	</table>
	
</td>

<%@ include file="bottom.jsp"%>