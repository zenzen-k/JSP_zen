<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top.jsp -> product_input.jsp<br> -->
<style type="text/css">
	table:nth-child(2){
		border-top: double;
		border-bottom: double;
	}
	th{
		background-color: #fc0;
	}
</style>
<%@ include file="top.jsp" %> <!-- 2번쨰 tr 시작 -->

<%
	String[] pspec = {"::NORMAL::","HIT","NEW","BEST"};
	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> lists = cdao.getAllCategory();
	String[] pcategory = new String[lists.size()];
	
	for(int i = 0; i<lists.size(); i++){
		pcategory[i] = lists.get(i).getCname() + " [" + lists.get(i).getCode() +"]";
	}
%>
<td colspan="6" align="center" valign="top">
	product_input.jsp<br>
	<b>상품등록카테고리</b>
	
	<form action="" method="post">
	
	<input type="hidden" name="pinputdate">
	
	<table width="600">
		<tr>
			<th>카테고리</th>
			<td>
				<select name="pcategory_fk">
					<%
					for(String x : pcategory){
					%>
						<option value=<%=x%>><%=x%></option>
					<%
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
			<td><input type="text" name="pname" value="이름"></td>
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
			<td><input type="text" name="pqty" value="3"></td>
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
						<option value=<%=x%>><%=x%></option>
					<%
					}
					%>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>상품 소개</th>
			<td>
				<textarea rows="4" cols="50" name="pcontents">설명</textarea>
			</td>
		</tr>
		
		<tr>
			<th>상품 포인트</th>
			<td><input type="text" name="point" value="100"></td>
		</tr>
		
		<tr bgcolor="#aaa">
			<td colspan="2" align="center">
				<input type="submit" value="상품 등록">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	</form>
	
</td>

<%@ include file="bottom.jsp" %> <!-- 2번쨰 tr 끝 -->