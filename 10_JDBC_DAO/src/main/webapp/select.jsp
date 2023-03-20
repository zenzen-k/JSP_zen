<%@page import="DTO.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
	table{
		border-color: blue;
		width: 80%;
		margin: auto;
		text-align: center;
	}
	th{ /* or tr:first-child */
		background: yellow;
	}
</style>

<script type="text/javascript">
function insert() {
	//alert(1);
	location.href="insertForm.jsp";
}
function allDelete() {
	//alert(2);
	//document.myform.rowcheck
	
	var check = document.myform.allcheck.checked;
	//alert(allCheck); // 체크상태 - true , 해제 - false
	
	var chkObj = document.getElementsByName("rowcheck"); // 배열이 됨
	if(check){ // 체크상태이면~
		for(i=0; i<chkObj.length; i++){
			chkObj[i].checked = true;
		}
	}else{
		for(i=0; i<chkObj.length; i++){
			chkObj[i].checked = false;
		}
	}
}
function selectDelete() {
	//alert('selectDelete');
	flag = false;
	var chkObj = document.getElementsByName("rowcheck");
	for(i=0; i<chkObj.length; i++){
		if(chkObj[i].checked){
			flag = true;
			break;
		}
	}
	
	if(!flag){
		alert('삭제할 체크박스를 하나라도 선택하세요');
		return;
	}
	
	
	// submit이 아닌 버튼이어도 action으로 넘어가는 법
	document.myform.submit();
}
</script>
select.jsp<br>

<jsp:useBean id="bdao" class="DTO.BookDao"/>
<%
	ArrayList<BookBean> lists = bdao.getAllBook();
	String[] th = {"번호","제목","저자","출판사","가격","입고일","배송비","구입 가능 서점","보유수량","수정","삭제"};
%>

<!-- form에서 입력한 항목 즉, rowcheck가 넘어간다. -->
<form name="myform" action="deleteAll.jsp" method="post">
<input type="button" value="삭제" onClick="selectDelete()">
<input type="button" value="추가" onClick="insert()"> <!--onClick="location.href='insertForm.jsp'"-->
<table border="1">
	<tr>
		<th><input type="checkbox" name="allcheck" onClick="allDelete()"></th>
		<%
		for(int i=0; i<th.length; i++){
			out.print("<th>"+th[i]+"</th>");
		}
		%>
	</tr>
	
	<%
	for(BookBean bb : lists){
	%>
		<tr>
			<td><input type="checkbox" name="rowcheck" value="<%=bb.getNo()%>"></td>
			<td><%=bb.getNo()%></td>
			<td><%=bb.getTitle()%></td>
			<td><%=bb.getAuthor()%></td>
			<td><%=bb.getPublisher() %></td>
			<td><%=bb.getPrice()%></td>
			<td><%=bb.getBuy()%></td>
			<td><%=bb.getKind()%></td>
			<td><%=bb.getBookstore()%></td>
			<td><%=bb.getCount()%></td>
			<td><a href="updateForm.jsp?no=<%=bb.getNo()%>">수정</a></td>
			<td><a href="deleteProc.jsp?no=<%=bb.getNo()%>">삭제</a></td>
		</tr>
	<%
	}
	%>

</table>
</form>

<br><br>
<!-- <a href="insertForm.jsp">삽입</a> -->