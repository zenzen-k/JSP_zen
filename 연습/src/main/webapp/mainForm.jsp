<%@page import="myPkg.AlbumsBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	html{
		text-align: center;
	}
	#menuBar{
		background: #686868;
		padding: 10px;
		margin: 20px;
	}
	a{
		color: white;
		text-decoration: none;
		margin: 20px;
	}
	a:hover{  /* 마우스 올렸을때 효과 */
		color: #E1E1E1;
		background: gray;
	}
	table{
		margin: auto;
		text-align: center;
		width: 600px;
	}
	#main{
		color: black;
	}
	#main:hover{
		color: #gray;
	}
	
</style>

<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	$(function () {
		$('div a:eq(0)').click(function() {
			$('#mainForm').load("updateForm.jsp");
		});
		
		$('div a:eq(1)').click(function() {
			$('#mainForm').load("deleteForm.jsp");
		});
		
		$('div a:eq(2)').click(function() {
			$('#mainForm').load("insertForm.jsp");
		});
	});
</script>

<h2><a id="main" href="mainForm.jsp">main 페이지 입니다</a></h2>


<div id="menuBar">
	<a href="#">앨범 수정하기 </a> <!-- updateForm.jsp -->
	<a href="#">앨범 삭제하기 </a>
	<a href="#">앨범 추가하기 </a>
</div>

<div id="mainForm">
<h3 style="margin: 50px ">전체 테이블 조회</h3>
	<jsp:useBean id="dao" class="myPkg.AlbumsDao"/>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>노래명</th>
			<th>가수</th>
			<th>회사</th>
			<th>가격</th>
			<th>발매일</th>
		</tr>
		
		<%
		ArrayList<AlbumsBean> lists = dao.getAllAlbums();
		for(AlbumsBean a : lists){
		%>
		<tr>
			<td><%=a.getNum()%></td>
			<td><%=a.getSong()%></td>
			<td><%=a.getSinger()%></td>
			<td><%=a.getCompany()%></td>
			<td><%=a.getPrice()%></td>
			<td><%=a.getPub_day()%></td>
		</tr>
		<%
		}
		%>
	</table>
</div>

<div id="clickForm"></div>
