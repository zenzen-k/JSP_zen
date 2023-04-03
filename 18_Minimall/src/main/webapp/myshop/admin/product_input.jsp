<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top.jsp -> product_input.jsp<br> -->

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
	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> lists = cdao.getAllCategory();
	/* String[] pcategory = new String[lists.size()];
	
	for(int i = 0; i<lists.size(); i++){
		pcategory[i] = lists.get(i).getCname() + " [" + lists.get(i).getCode() +"]";
	} */
%>
<td colspan="6" align="center" valign="top">
	<b>상품등록카테고리</b>
	
	<form action="productProc.jsp" method="post" enctype="multipart/form-data">
	<table width="600" class="outline">
		<tr>
			<th>카테고리</th>
			<td>
				<select name="pcategory_fk">
					<%
					if(lists.size() == 0){
					%>
						<option value="">카테고리 없음</option>
					<%	
					}else{
						for(CategoryBean cate : lists){
						%>
							<option value="<%=cate.getCode()%>"><%=cate.getCname()%> [<%=cate.getCode()%>]</option>
						<%
						}
					}
					%>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>상품명</th>
			<td><input type="text" name="pname" value="이름"></td>
		</tr>
		
		<tr>
			<th>상품코드</th>
			<td><input type="text" name="pcode" value="이름"></td>
		</tr>
		
		<tr>
			<th>제조회사</th>
			<td><input type="text" name="pcompany" value="이름"></td>
		</tr>
		
		<tr>
			<th>상품이미지</th>
			<td>
				<input type="file" name="pimage"><br>
			</td>
		</tr>
		
		<tr>
			<th>상품 수량</th>
			<td><input type="text" name="pqty" maxlength="5" value="3"></td><!-- 5자리 -> 99,999 -->
		</tr>
		
		<tr>
			<th>상품 가격</th>
			<td><input type="text" name="price" value="100"></td>
		</tr>
		
		<tr>
			<th>상품 스펙</th>
			<td>
				<select name="pspec">
					<%
					for(String x : pspec){
					%>
						<option value="<%=x%>"><%=x%></option>
					<%
					}
					%>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>상품 소개</th>
			<td>
				<textarea rows="4" cols="50" name="pcontents" style="resize: none">설명</textarea>
			</td>
		</tr>
		
		<tr>
			<th>상품 포인트</th>
			<td><input type="text" name="point" value="100"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center" class="m1">
				<input type="submit" value="상품 등록">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	</form>
	
</td>

<%@ include file="bottom.jsp" %> <!-- 2번쨰 tr 끝 -->