<%@page import="myPkg.StudentDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
table{
	width: 800px;
	text-align: center;
}
th{
	background: yellow;
}
</style>

<script type="text/javascript">
	function allCheck(obj) {
		//var chk = document.myform.allcheck.checked;
		
		// 간단한 다른방법 -> this 를 작성함으로 obj로 allcheck 체크상태를 받는다!
		
		
		var rchk = document.getElementsByName('rcheck');
		//alert(chk);
		if(obj.checked){ // allcheck 체크할때
			for(i=0; i<rchk.length; i++){
				//alert(rchk[i].checked);
				rchk[i].checked = true;
			}
		}else{ // allcheck 체크안했을ㄸ 
			for(i=0; i<rchk.length; i++){
				rchk[i].checked = false;
			}
		}
		
	}
	
	function selectDel() {
		//alert(1);
		flag = false;
		var rch = document.getElementsByName('rcheck');
		// rcheck는 여러개가 있음. 따라서 rch라는 이름의 배열이 만들어진당.
		
		for(i=0; i<rch.length; i++){
			if(rch[i].checked){
				flag = true;
				break;
			}
		}
		
		if(!flag){
			alert("한개이상 선택하세요");
			return; // submit을 만나짐 못하게 return해쥼
		}
		
		document.myform.submit();
	}
</script>

<%-- <jsp:useBean id="sdao" class="myPkg.StudentDao"/> --%>

<form name="myform" action="allDelete.jsp" method="post">
<table border='1'>
<%
	StudentDao sdao = StudentDao.getInstance();
	System.out.println("sdao : " + sdao);

	String[] th = {"번호","아이디","비번","이름","생년월일","취미","C언어","JAVA","JSP","합계","수정","삭제"};
	ArrayList<StudentBean> lists = sdao.getAllStudent();
%>
	<tr>
		<th><input type="checkbox" name="allcheck" onClick="allCheck(this)"></th>
		<%for(String x : th){%>
			<th><%=x%></th>
		<%}%>
	</tr>
	<%
	for(StudentBean sb : lists){
	%>
	<tr>
		<td><input type="checkbox" name="rcheck" value="<%=sb.getNum()%>"></td>
		<td><%=sb.getNum()%></td>
		<td><%=sb.getId()%></td>
		<td><%=sb.getPasswd()%></td>
		<td><%=sb.getName()%></td>
		<td><%=sb.getYear()%>-<%=sb.getMonth()%>-<%=sb.getDay()%></td>
		<td><%=sb.getHobby()%></td>
		<td><%=sb.getC()%></td>
		<td><%=sb.getJava()%></td>
		<td><%=sb.getJsp()%></td>
		<td><%=sb.getSum()%></td>
		<td><a href="updateForm.jsp?num=<%=sb.getNum()%>">수정</a></td>
		<td><a href="deleteProc.jsp?num=<%=sb.getNum()%>">삭제</a></td>
	</tr>
	<%
	}
	%>
</table>
<br><br>
<!-- 함수로 위치이동하던지 아래처럼 바로가던지~ -->
<input type="button" value="삽입" onclick="location.href='insertForm.jsp'">
<input type="button" value="삭제" onclick="selectDel()">

</form>