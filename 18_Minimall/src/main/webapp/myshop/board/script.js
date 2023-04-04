/**
 * 
 */
function writeSave() {
	//alert('writeSave');
	
	// 또는 jquery로 작서하ㅣ기
	/*if($('input[name=writer]').val() == ""){
		alert("이름을 입력하세요");
		$('input[name=writer]').focus();
		return false;
	}*/
	
	
	
	if(writeForm.writer.value.length == 0){
		alert("이름을 입력하세요");
		writeForm.writer.focus();
		return false;
	}
	
	if(writeForm.subject.value == ""){
		alert("제목을 입력하세요");
		writeForm.subject.focus();
		return false;
	}
	
	if(writeForm.email.value == ""){
		alert("이메일을 입력하세요");
		writeForm.email.focus();
		return false;
	}
	
	if(writeForm.content.value == ""){
		alert("내용을 입력하세요");
		writeForm.content.focus();
		return false;
	}
	
	if(writeForm.passwd.value == ""){
		alert("비밀번호를 입력하세요");
		writeForm.passwd.focus();
		return false;
	}
}