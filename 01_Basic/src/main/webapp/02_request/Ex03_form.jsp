<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function check() {
		// form 에 이름이 없다면 forms[0] 이렇게 해야한당
		if(myform.name.value.length==0){
			alert("이름을 입력하세요");
			myform.name.focus();
			return false;
		}
		if(myform.age.value.length==0){
			alert("나이를 입력하세요");
			myform.age.focus();
			return false;
		}
		if(isNaN(myform.age.value)){
			alert("나이는 숫자만 입력하세요");
			myform.age.select();
			return false;
		}
		
		flag = false;
		for(i=0; i<myform.gender.length; i++){
			if(myform.gender[i].checked){
				flag = true;
				break;
			}
		}
		if(!flag){
			alert("성별을 선택하세요");
			return false;
		}
		
		if(myform.hobby.value == ""){
			alert("취미를 선택하세요");
			return false;
		}
		if(myform.color.value == ""){
			alert("색상을 선택하세요");
			return false;
		}
	}
</script>

    
Ex03_form.jsp <br>

<h3>Request 내장 객체 예제1</h3>
<form action="Ex03_result.jsp" method="post" name="myform">
	이름 : <input type="text" name="name"><br><br>
	나이 : <input type="text" name="age"><br><br>
	성별 : <input type="radio" name="gender" value="m">남자
			<input type="radio" name="gender" value="f">여자<br><br>
	취미 : 
		<select name="hobby">
			<option value="">선택</option>
			<option value="Java공부">Java공부</option>
			<option value="뮤지컬 감상">뮤지컬 감상</option>
			<option value="영화 감상">영화 감상</option>
			<option value="드라마 보기">드라마 보기</option>
		</select><br><br>
	
	색 선택 : 
		<select name="color">
			<option value="">선택</option>
			<option value="blue">파랑색</option>
			<option value="green">초록색</option>
			<option value="red">빨강색</option>
			<option value="yellow">기타</option>
		</select><br><br>
	
	<input type="submit" value="보내기" onclick="return check()">
</form>