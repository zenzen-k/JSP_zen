<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
$(function() {
	//alert(1);
	//$('th').attr('class',"m2");
	$('th').addClass("m2");
});


</script>

<%@ include file="top.jsp" %> <!-- 2번쨰 tr 시작 -->

<%
	String[] pspec = {"::NORMAL::","HIT","NEW","BEST"};
	
	String pnum = request.getParameter("pnum");
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getProductByNum(pnum);
%>
<td colspan="6" align="center" valign="top">
	<b>상품수정</b>
	
	<form action="productUpdateProc.jsp" method="post" enctype="multipart/form-data">
	<table width="600" class="outline">
		<tr>
			<th>카테고리</th>
			<td>
				<input type="text" name="pcategory_fk" value="<%=pb.getPcategory_fk()%>" disabled>
			</td>
		</tr>
		
		<tr>
			<th>상품번호</th>
			<td>
				<%=pnum%><!-- input에 쓰지 않아서 넘어가지 않는다. 따라서 hidden으로,, -->
				<input type="hidden" name="pnum" value="<%=pnum%>">
			</td> 
		</tr>
		
		<tr>
			<th>상품명</th>
			<td><input type="text" name="pname" value="<%=pb.getPname()%>"></td>
		</tr>
		
		<tr>
			<th>제조회사</th>
			<td><input type="text" name="pcompany" value="<%=pb.getPcompany()%>"></td>
		</tr>
		
		<tr>
			<th>상품이미지</th>
			<td>
				<img alt="없음" src="<%=request.getContextPath()%>/myshop/images/<%=pb.getPimage()%>" width="100">
				<input type="file" name="pimage"><br>
				<input type="text" name="pimageold" value="<%=pb.getPimage()%>">
			</td>
		</tr>
		
		<tr>
			<th>상품 수량</th>
			<td><input type="text" name="pqty" maxlength="5" value="<%=pb.getPqty()%>"></td><!-- 5자리 -> 99,999 -->
		</tr>
		
		<tr>
			<th>상품 가격</th>
			<td><input type="text" name="price" value="<%=pb.getPrice()%>"></td>
		</tr>
		
		<tr>
			<th>상품 스펙</th>
			<td>
				<select name="pspec">
					<%
					for(String x : pspec){
					%>
						<option value="<%=x%>" <%if(x.equals(pb.getPspec())){%>selected<%}%>><%=x%></option>
					<%
					}
					%>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>상품 소개</th>
			<td>
				<textarea rows="4" cols="50" name="pcontents" style="resize: none"><%=pb.getPcontents()%></textarea>
			</td>
		</tr>
		
		<tr>
			<th>상품 포인트</th>
			<td><input type="text" name="point" value="<%=pb.getPoint()%>"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center" class="m1">
				<input type="submit" value="상품 수정">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	</form>
	
</td>

<%@ include file="bottom.jsp" %> <!-- 2번쨰 tr 끝 -->