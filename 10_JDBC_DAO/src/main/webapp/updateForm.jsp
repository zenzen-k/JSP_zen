<%@page import="DTO.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- <script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
$(function() {
	//alert(1);
	
	var flag = false;
	var use = "";
	
	$("#titleCheck").click(function() {
		
		flag = true;
		
		$.ajax({
			url : 'title_check_proc.jsp',
			data : ({
				usertitle : $('input[name=title]').val()
			}),
			success : function(data) {
				//alert(1);
				if($('input[name=title]').val()==""){
					$('#titlemessage').html("<font color=red>제목을 입력하세요</font>");
				}else if($.trim(data)=="NO"){
					$('#titlemessage').html("<font color=red>이미 등록된 책입니다</font>");
					use = "impossible";
				}else {
					$('#titlemessage').html("<font color=green>등록가능합니다</font>");
					use = "possible";
				}
			}
		}); //ajax
	}); //#titleCheck.click
	
	$('#sub').click(function() {
		if(!flag){
			alert('중복체크를 해주세요');
			return false;
		}
	});
});

</script> -->

updateForm.jsp

<jsp:useBean id="bdao" class="DTO.BookDao"/>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");

	String[] kind = {"유료","무료"};
	String[] bookstore = {"교보문고","알라딘","yes24","인터파크"};
	
	BookBean bb = bdao.getBookByNo(no);
%>

<h1>도서 정보 수정</h1>
<!-- action="updateProc.jsp?no=< % =no%>" 이렇게 써도 됨 -->
<form name="myform" action="updateProc.jsp" method="post">
	<input type="hidden" name="no" value="<%=no%>">
	<table border=1>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" value="<%=bb.getTitle()%>">
				<input type="button" id="titleCheck" value="중복체크">
				<span id="titlemessage"></span>
			</td>
			
		</tr>
		<tr>
			<td>저자</td>
			<td><input type="text" name="author" value="<%=bb.getAuthor()%>"></td>
		</tr>
		<tr>
			<td>출판사</td>
			<td><input type="text" name="publisher" value="<%=bb.getPublisher()%>"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price" value="<%=bb.getPrice()%>"></td>
		</tr>
		<tr>
			<td>입고일</td>
			<td><input type="date" name="buy" value="<%=bb.getBuy()%>"></td>
		</tr>

		<tr>
			<td>배송비</td>
			<td>
			<%
			for(int i=0; i<kind.length; i++){
			%>
				<%=kind[i]%> <input type="radio" name="kind" value="<%=kind[i]%>" 
				<%if(bb.getKind().equals(kind[i])){%> checked <%} %>> 
			<%
			}
			%>
			</td>
		</tr>
		<tr>
			<td>구입가능 서점</td>
			<td>
			<% 
			for(int i=0; i<bookstore.length; i++){
			%>
				<%=bookstore[i]%> <input type="checkbox" name="bookstore" value="<%=bookstore[i]%>" 
				<%if(bb.getBookstore().contains(bookstore[i])){%> checked <%} %>>
			<%
			}
			%>
			</td>
		</tr>
		<tr>
			<td>보유수량</td>
			<td>
				<select name="count" id="count">
					<option value="선택">선택
					<%
					for(int i=1; i<=5; i++){
					%>
						<option value="<%=i%>" <%if(bb.getCount()==i){%> selected <%} %>><%=i%></option>
					<%
					}
					%>
				</select>
			</td>
		</tr>
	</table>
	<br> 
	<input type="submit" id="sub" value="수정" onClick="return check()"> 
	<input type="button" value="취소" onClick="location.href='select.jsp'">
</form>