<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- product_list.jsp<br> -->

<script>
	function deleteCheck(pnum, pimage) {
		// alert(pnum + "," + pimage);
		
		// 대화상자 : alert, confirm, prompt
		var isDel = confirm("정말 삭제하시겠습니까?");
		//alert(isval); // 확인버튼 : true | 취소 : false
		
		if(isDel){
			location.href="product_delete.jsp?pnum="+pnum+"&pimage="+pimage;
		}
		
	}
</script>



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
			for(ProductBean pb : lists){ %>
			<tr>
				<td align="center"><%=pb.getPnum()%></td>
				<td align="center"><%=pb.getPcategory_fk()%></td>
				<td align="center"><%=pb.getPname()%></td>
				<td align="center">
					<a href="product_view.jsp?pnum=<%=pb.getPnum()%>">
						<img width="40" height="40" alt="없음" 
						src="<%=request.getContextPath() + "/myshop/images/" + pb.getPimage()%>">
					</a>
				</td>
				<td align="right"><%=pb.getPrice()%></td>
				<td align="center"><%=pb.getPcompany()%></td>
				<td align="right"><%=pb.getPqty()%></td>
				<td align="center">
					<a href="product_update.jsp?pnum=<%=pb.getPnum()%>">수정</a> | 
					<%-- <a href="product_delete.jsp?pnum=<%=lists.get(i).getPnum()%>&pimage=<%=lists.get(i).getPimage()%>">삭제</a></td> --%>
					<a href="javascript:deleteCheck('<%=pb.getPnum()%>','<%=pb.getPimage()%>')">삭제</a></td>
			</tr>
			<% }
		}%>
	</table>
	
</td>

<%@ include file="bottom.jsp"%>