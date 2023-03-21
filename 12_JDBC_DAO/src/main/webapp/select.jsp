<%@page import="DTO.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	th{
		background: yellow;
	}
	table{
		text-align: center;
	}
</style>

<script type="text/javascript">
	function allCheck(obj) {
		var rowch = document.getElementsByName("rowcheck");
		
		if(obj.checked){
			for(i=0; i<rowch.length; i++){
				rowch[i].checked = true;
			}
		}else{
			for(i=0; i<rowch.length; i++){
				rowch[i].checked = false;
			}
		}
	}
	
	function selectDel() {
		flag = false;
		rowch = document.getElementsByName("rowcheck");
		for(i=0; i<rowch.length; i++){
			if(rowch[i].checked){
				flag = true
			}
		}
		if(!flag){
			alert("한개이상 선택하세요");
			return;
		}
		
		document.myform.submit();
	}
</script>


<form name="myform" action="allDelete.jsp">
<input type="button" value="삭제" onclick="selectDel()">
<input type="button" value="추가" onclick="location.href='insertForm.jsp'">
<table border="1">
	<jsp:useBean id="dao" class="DTO.MovieDao"/>
<%
	String[] th = {"번호","아이디","이름","나이","좋아하는 장르","즐겨보는 시간대","동반관객수","개선사항","수정","삭제"};

	ArrayList<MovieBean> lists = dao.getAllMovie();
%>
	<tr>
		<th><input type="checkbox" name="allcheck" onclick="allCheck(this)"></th>
		<%for(int i=0; i<th.length; i++){%><th><%=th[i]%></th><%} %>
	</tr>
	
	<%for(MovieBean mb : lists){%>
		<tr>
			<td><input type="checkbox" name="rowcheck" value="<%=mb.getNum()%>"></td>
			<td><%=mb.getNum()%></td>
			<td><%=mb.getId()%></td>
			<td><%=mb.getName()%></td>
			<td><%=mb.getAge()%></td>
			<td><%=mb.getGenre()%></td>
			<td><%=mb.getTime()%></td>
			<td><%=mb.getPartner()%></td>
			<td><%=mb.getMemo()%></td>
			<td><a href="updateForm.jsp?num=<%=mb.getNum()%>">수정</a></td>
			<td><a href="deleteProc.jsp?num=<%=mb.getNum()%>">삭제</a></td>
		</tr>
	<%}%>
</table>
</form>