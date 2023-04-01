<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	tr{
		height: 60px;
	}
	/* 모든 td의 자손들에게 적용하려면 어케해야할지 생각해버쟈 */
</style>

<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		// alert(1);
	});
	
	function check() {
		$()
	}
</script>


<%
	String[] company = {"구글", "네이버", "다음", "유튜브"};
%>

<form name="myform" action="insertProc" method="post">
<h3 style="margin: 50px ">앨범 추가하기</h3>
<table>
	<tr>
		<th>노래명 : </th>
		<td>
			<input type="text" name="song" size="30">
		</td>
	</tr>
	<tr>
		<th>가수 : </th>
		<td>
			<input type="text" name="singer" size="30">
		</td>
	</tr>
	<tr>
		<th>회사 : </th>
		<td>
			<select name="company" style="width: 240px">
			<%
			for(int i=0; i<company.length; i++){
			%>
				<option value="<%=company[i]%>"><%=company[i]%></option>
			<%
			}
			%>
			</select>
		</td>
	</tr>
	<tr>
		<th>가격 : </th>
		<td>
			<input type="text" name="price" size="30">
		</td>
	</tr>
	<tr>
		<th>발매일 : </th>
		<td>
			<input type="date" name="pub_day">
		</td>
	</tr>
</table>

<br><br>
<input type="submit" value="저장" onclick="return check()">
</form>
