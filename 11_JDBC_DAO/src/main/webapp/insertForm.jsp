<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			use = "";
			isCheck = false;
		});
		
	});
	
	
	function date() {
		year = document.getElementByName('year').text();
		month = document.getElementByName('month').text();
		
		var d = new Date(year, month, 0).getDate();
		
		for(i=1; i<=d; i++){
			$('input[name=""]')
			document.write("<option value='"+i+"'>"+i+"</option>")
		}
	}
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
	
	<select name="month" onchange="date()">
		<%for(int i=1; i<=12; i++){%>
			<option value="<%=i%>"><%=i%></option>
		<%}%>
	</select> 월 
	
	<select name="date" >
		<%-- <%
		for(int i=1; i<=31; i++){
		%>
			<option value="<%=i%>"><%=i%></option>
		<%}%> --%>
	</select> 일<br><br>
	
	취미 : 
	<% 
	String[] hobby = {"달리기", "수영", "등산", "영화" };
	for(int i=0; i<hobby.length; i++){%>
		<input type="checkbox" name="hobby" value=<%=hobby[i]%>> <%=hobby[i]%>
	<%}%>
	<br><br><br>
	
	[점수입력]<br>
	C언어 : <input type="text" name="c">
	JAVA : <input type="text" name="java">
	JSP : <input type="text" name="jsp">
	<br><br>
	
	<input type="submit" value="가입하기" id="sub" onclick="return check()">

</form>

