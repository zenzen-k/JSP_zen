<%@page import="myPkg.StudentBean"%>
<%@page import="java.util.Calendar"%>
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

<jsp:useBean id="sdao" class="myPkg.StudentDao"/>
<%
	String num = request.getParameter("num");
	//StudentDao sdao = new StudentDao();
	StudentBean sb = sdao.getStudByNum(num);
%>

<h2>수정하기 updateForm.jsp</h2>

<form name="myform" action="updateProc.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">

	아이디 : <input type="text" name="id" value="<%=sb.getId()%>">
	<input type="button" id="idbtn" value="중복체크">
	<span id="idcheck"></span><br><br>
	
	비밀번호 : <input type="password" name="passwd" value="<%=sb.getPasswd()%>"><br><br>
	이름 :  <input type="text" name="name" <%=sb.getName()%> value="<%=sb.getName()%>"><br><br>
	생년월일 :
	<select name="year">
		<%
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		for(int i=year; i>=1930; i--){
		%>
			<option value="<%=i%>" <%if(i == sb.getYear()){%>selected<%}%>><%=i%></option>
		<%
		}
		%>
	</select> 년 
	
	<select name="month">
		<%for(int i=1; i<=12; i++){%>
			<option value="<%=i%>" <%if(i == sb.getMonth()){%>selected<%}%>><%=i%></option>
		<%}%>
	</select> 월 
	
	<select name="day">
		<option value="<%=sb.getDay()%>"><%=sb.getDay()%></option>
	</select> 일<br><br>
	
	취미 : 
	<% 
	String[] hobby = {"달리기", "수영", "등산", "영화" };
	for(int i=0; i<hobby.length; i++){%>
		<input type="checkbox" name="hobby" value=<%=hobby[i]%> 
		<%if(sb.getHobby().contains(hobby[i])){%>checked<%}%>> <%=hobby[i]%>
	<%}%>
	<br><br><br>
	
	[점수입력]<br>
	C언어 : <input type="text" name="c" id="c" value=<%=sb.getC()%>>
	JAVA : <input type="text" name="java" id="java" value=<%=sb.getJava()%>>
	JSP : <input type="text" name="jsp" id="jsp" value=<%=sb.getJsp()%>>
	<br><br>
	
	<input type="submit" value="수정하기" id="sub" onclick="return check()">

</form>