<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		//alert(1);
	});
	
	function check() {
		if($('input[name="name"]').val()==""){
			alert('이름을 입력하세요');
			$('input[name="name"]').focus();
			return false;
		}
		if($('input[name="pw"]').val()==""){
			alert('비밀번호를 입력하세요');
			$('input[name="pw"]').focus();
			return false;
		}
		if($('input[name="fruit"]:checked').length==0){
			alert('과일을 선택하세요');
			return false;
		}
		
		/* if($('select:selected').val()=="선택"){
			alert('운동을 선택하세요2');
			return false;
		} */
		
		if($('select option:selected').length==0){
			alert('운동을 선택하세요');
			return false;
		}
	}
</script>

Ex04_form.jsp<br>


<form name="myform" action="Ex04_result2.jsp" method="post">
	이름 : <input type="text" name="name" value="정국"><br>
	비번 : <input type="text" name="pw" value="1234"><br>
	과일선택 : <br>
	<input type="checkbox" name="fruit" value="포도">포도<br>
	<input type="checkbox" name="fruit" value="딸기">딸기<br>
	<input type="checkbox" name="fruit" value="사과">사과<br>
	<input type="checkbox" name="fruit" value="배">배<br>
	
	좋아하는 운동 : <br>
	<select name="sports" multiple size="3">
		<option value="선택">선택</option>
		<option value="야구">야구</option>
		<option value="축구">축구</option>
		<option value="농구">농구</option>
		<option value="배구">배구</option>
	</select>
	
	<input type="submit" value="전송" onClick="return check()">
	<input type="reset" value="취소">
	
</form>