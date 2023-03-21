<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	select, #c, #jsp, #java{
		width: 70px; 
	}
	select[name=month], select[name=day]{
		width: 50px;
	}
</style>

<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		// alert(1);
		
		isCheck = false; 
		use = "";
		
		$('#idbtn').click(function() {
			isCheck = true;
			$.ajax({
				url : "idCheckProc.jsp",
				data : ({
					userid : $("input[name=id]").val()
				}),
				success : function(data) {
					
					if( $.trim($("input[name=id]").val())==""){
						alert("아이디를 입력하세요");
						$("input[name=id]").focus();
						return;
					}
					
					// alert(data);
					if( $("input[name=id]").val()==""){
						alert("아이디를 입력하세요");
						$("input[name=id]").focus();
					} else if($.trim(data)=="N"){
						$('#idcheck').html("<font color=red>이미 사용중입니다</font>");
						$("input[name=id]").select();
						use = "impossible";
						$('#idcheck').show();
					} else if($.trim(data)=="Y"){
						$('#idcheck').html("<font color=blue>사용가능합니다</font>");
						use = "possible";
						$('#idcheck').show();
					}
				}
			});
			
		});//idcheck click
		
		$('#sub').click(function() {
			if(!isCheck){
				alert("중복체크 먼저 클릭하세요");
				return false;
			}else if(use == "impossible"){
				alert("이미 사용중입니다");
				$("input[name=id]").select();
				return false;
			}else if( $("input[name=id]").val()==""){
				alert("아이디를 입력하세요");
				$("input[name=id]").focus();
				return false;
			}
		});
		
		$('input[name=id]').keydown(function() {
			$('#idcheck').css('display','none');
			use = ""; // 이미사용중이다 라는 메세지가 계속 저장되어있으므로 초기화해주어야 한다.
			isCheck = false; // 한번 검사하고나서는 값을 잘못입력해도 넘어간당 따라서 false로 다시 초기화
		});
		
		
		$('select[name=month]').change(function() {
			$('select[name=day]').empty();
			
			var year = $('select[name=year]').val();
			var month = $('select[name=month]').val();
			
			var d = new Date(year, month, 0).getDate();
			// alert(d);
			for(i=1; i<=d; i++){
				$('select[name=day]').append("<option value='"+i+"'>" +i+"</option>");
				//document.getElementByName('day').options[i-1] = new Option(i);
			}
		});
	});
</script>



<h2>회원가입 insertForm.jsp</h2>

<form name="myform" action="insertProc.jsp" method="post">
	아이디 : <input type="text" name="id">
	<input type="button" id="idbtn" value="중복체크">
	<span id="idcheck"></span><br><br>
	
	비밀번호 : <input type="password" name="passwd"><br><br>
	이름 :  <input type="text" name="name"><br><br>
	생년월일 :
	<select name="year">
		<%
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		for(int i=year; i>=1930; i--){
		%>
			<option value="<%=i%>"><%=i%></option>
		<%
		}
		%>
	</select> 년 
	
	<select name="month">
		<%for(int i=1; i<=12; i++){%>
			<option value="<%=i%>"><%=i%></option>
		<%}%>
	</select> 월 
	
	<select name="day">
		<option value="1">1</option>
	</select> 일<br><br>
	
	취미 : 
	<% 
	String[] hobby = {"달리기", "수영", "등산", "영화" };
	for(int i=0; i<hobby.length; i++){%>
		<input type="checkbox" name="hobby" value=<%=hobby[i]%>> <%=hobby[i]%>
	<%}%>
	<br><br><br>
	
	[점수입력]<br>
	C언어 : <input type="text" name="c" id="c">
	JAVA : <input type="text" name="java" id="java">
	JSP : <input type="text" name="jsp" id="jsp">
	<br><br>
	
	<input type="submit" value="가입하기" id="sub" onclick="return check()">

</form>