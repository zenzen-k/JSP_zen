<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//alert(1);
		var use;
		var isCheck = false;
			
		$('#titleCheck').click(function() {
			//alert(2);
			isCheck = true;
			
			$.ajax({
				url : "title_check_proc.jsp", // 요청 url
				// dataType은 반드시 필요한게 아님. 이번엔 타입말고 data!
				// data 속성은 가져갈 데이터를 넣는다!
				data : ({
					// usertitle 에 데이터를 담아서 가라는 의미
					usertitle : $('input[name=title]').val() // 책제목에 입력한 값을 가져옴 usertitle=책제목
				}),
				success : function(data){ // 자동으로 호출되는 함수 - 콜백함수!
					// 응답받은걸 매개변수로 받음! 변수명은 암거나 ㄱㅊ
					// 많은 공백도 함께 들어오므로 trim으로 공백처리 꼭 해쥬기!
					// alert('data : ' + $.trim(data));
					
					if($('input[name=title]').val()==""){
						$('#titlemessage').html("<font color=green>입력 누락</font>");
						use = "missing";
						$('#titlemessage').show();
					}
					else if($.trim(data)=="YES"){
						$('#titlemessage').html("<font color=blue>등록 가능합니다</font>");
						use = "possible";
						$('#titlemessage').show();
					} else {
						$('#titlemessage').html("<font color=red>이미 등록된 도서입니다</font>");
						use = "impossible";
						$('#titlemessage').show();
					}
				}//success
			});//ajax
		});
		
		$('#sub').click(function() {
			//alert(4);
			if(use == "missing"){ // $('input[name=title]').val()=="" 이거를 여기서 해도 ㄱㅊ
				alert("입력 누락됐습니다.");
				$("input[name=title]").focus();
				return false; // 액션으로 넘어가지 못하게
			} else if(isCheck == false){
				alert("중복체크 먼저 하세요");
				$('input[name=title]').focus();
				return false;
			} else if(use == "impossible"){
				alert("이미 등록된 도서입니다");
				$('input[name=title]').focus();
				return false;
			} 
		});
		
		$('input[name=title]').keydown(function() {
			//alert(5);
			$('#titlemessage').css('display','none');
			use = "";
			isCheck = false;
		}); //keydown
	});
</script>
insertForm.jsp<br>

<%
	String[] kind = {"유료","무료"};
	String[] bookstore = {"교보문고","알라딘","yes24","인터파크"};
%>

<h1>도서 정보 입력</h1>
<form name="myform" action="insertProc.jsp" method="post">
	<table border=1>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title">
				<input type="button" id="titleCheck" value="중복체크">
				<span id="titlemessage"></span>
			</td>
			
		</tr>
		<tr>
			<td>저자</td>
			<td><input type="text" name="author"></td>
		</tr>
		<tr>
			<td>출판사</td>
			<td><input type="text" name="publisher"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>입고일</td>
			<td><input type="date" name="buy"></td>
		</tr>

		<tr>
			<td>배송비</td>
			<td>
			<%
			for(int i=0; i<kind.length; i++){
			%>
				<%=kind[i]%> <input type="radio" name="kind" value="<%=kind[i]%>"> 
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
				<%=bookstore[i]%> <input type="checkbox" name="bookstore" value="<%=bookstore[i]%>">
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
						<option value="<%=i%>"><%=i%></option>
					<%
					}
					%>
				</select>
			</td>
		</tr>
	</table>
	<br> 
	<input type="submit" id="sub" value="전송" onClick="return check()"> 
	<input type="reset"	value="취소">
</form>
