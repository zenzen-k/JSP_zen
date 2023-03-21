<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//alert(1);
		isCheck = false;
		use = "";
		
		$("#chk").click(function() {
			//alert(2);
			
			isCheck = true;
			
			$.ajax({
				url : "idCheckProc.jsp" ,
				data : ({
					userid : $('input[name=id]').val()
				}),
				success : function(data) {
					//alert(data);
					
					if( $('input[name=id]').val() == ""){
						alert("아이디를 입력하세요");
						$('input[name=id]').focus();
					}else if($.trim(data) == "N"){
						$('#checkMsg').html("<font color=red>이미 존재하는 아이디입니다.</font>");
						$('input[name=id]').select();
						use = "impossible";
						$('#checkMsg').show();
					}else if($.trim(data) == "Y"){
						$('#checkMsg').html("<font color=blue>사용가능한 아이디입니다.</font>");
						use = "possible";
						$('#checkMsg').show();
					}
				}
			});
		}); // chk
		
		$("#sub").click(function() {
			if(!isCheck){
				alert("중복체크를 먼저 해주세요");
				return false;
			}else if(use == "impossible"){
				alert("이미 존재하는 아이디입니다");
				$('input[name=id]').select();
				return false;
			}else if($('input[name=id]').val() == ""){
				alert("아이디를 입력하세요");
				$('input[name=id]').focus();
				return false;
			}
		});
		
		$('input[name=id]').keydown(function() {
			use = "";
			isCheck = false;
			$('#checkMsg').css('display','none');
		});
	});
</script>

<h3>영화 선호도 조사</h3>
<form name="myform" action="insertProc.jsp">
<%
	String[] time = {"08~10", "10~12", "12~14", "14~16", "16~18", "18~20"};
	String[] genre = {"공포", "다큐", "액션", "애니메이션"};
%>
<table border="1">
	<tr>
		<td>아이디 : </td>
		<td>
			<input type="text" name="id">
			<input type="button" value="중복체크" id="chk">
			<span id="checkMsg"></span>
		</td>
	</tr>
	
	<tr>
		<td>이름 </td>
		<td><input type="text" name="name"></td>
	</tr>
	
	<tr>
		<td>나이 </td>
		<td><input type="text" name="age"></td>
	</tr>
	
	<tr>
		<td>좋아하는 장르 </td>
		<td>
		<%for(int i=0; i<genre.length; i++){%>
			<input type="checkbox" name="genre" value="<%=genre[i]%>"> <%=genre[i]%> 
		<%}%>
		</td>
	</tr>
	
	<tr>
		<td>즐겨보는 시간대 </td>
		<td>
		<select name="time">
			<%for(int i=0; i<time.length; i++){%>
				<option value=<%=time[i]%>><%=time[i]%></option>
			<%}%>
		</select>
		</td>
	</tr>
	
	<tr>
		<td>동반 관객수 </td>
		<td>
		<%for(int i=1; i<=5; i++){%>
			<input type="radio" name="partner" value="<%=i%>"> <%=i%>  
		<%}%>
		</td>
	</tr>
	
	<tr>
		<td>영화관 개선사항</td>
		<td><textarea row="4" cols="40" name="memo"></textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" style="text-align: center">
			<input type="submit" value="가입하기" id="sub">
		</td>
	</tr>
</table>
</form>