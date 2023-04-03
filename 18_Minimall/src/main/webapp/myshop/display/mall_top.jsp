<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- mall_top.jsp -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">
<style type="text/css">
	body{
		text-align: center;
	}
	table{
		margin: auto;
	}
	div:first-child{
		display:inline-block; 
		width:80%; 
		text-align:center; 
		float:left;
	}
	/*
	div:nth-child(2) {
		display: inline-block; 
		width: 20%; 
		text-align: right; 
	} */
	.right{
		float : right;
	}
</style>  
<%
	String conPath = request.getContextPath();

	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> clists = cdao.getAllCategory();
	
	/* 세션 설정한 아이디 가져오기 */
	//Object sid = session.getAttribute("sid");
	String sid = (String)session.getAttribute("sid");
%>

<table border="1" width="900">
	<tr>
		<td colspan="2" height="50">
			<div>
				<a href="<%=conPath%>/main.jsp">HOME</a> | 
				<%
				if(sid.equals("admin")){
				%>
					<a href="<%=conPath%>/myshop/admin/main.jsp">관리자홈</a> | 
				<%
				}
				%>
				<a href="mall.jsp">쇼핑몰홈</a> | 
				<a href="mall_cartList.jsp">장바구니</a> | 
				<a href="">게시판</a> | 
				<a href="">회사소개</a>
			</div>
			
			<!-- 클래스명이 right 인것은 오른쪽정렬하고 싶음~ -->
			<a class="right" href="<%=conPath%>/logout.jsp">
				<img src="<%=conPath%>/myshop/images/logout3.jpg" height="18" style="vertical-align: middle;">
			</a>
			<span class="right"><%=sid %> 님</span>
			
		</td>
	</tr>
	
	<tr>
		<td width="20%" align="center" valign="top">
			카테고리
			<table border="1" width="100%">
				<%for(CategoryBean cb : clists){%>
					<tr>
						<td>
							<a href="<%=conPath%>/myshop/display/mall_cgList.jsp?code=<%=cb.getCode()%>&cname=<%=cb.getCname()%>"><%=cb.getCname()%>[<%=cb.getCode()%>]</a>
						</td>
					</tr>
				<%}%>
			</table>
		</td>
		<td align="center" valign="top">
