/**
 * script.js
 */
 // id pw name 
 

var use = "";
var isCheck = false;
var pwuse;
var pwuse2;

//가입버튼클릭
function writeSave(){
	//alert(1);
	if($('input[name=id]').val()==""){
		alert("아이디를 입력하세요");
		$('input[name=id]').focus();
		return false;
	}
	
	// 중복체크검사하기
	if(use == "missing"){
		alert("아이디를 입력하세요");
		$("input[name=id]").focus();
		return false; // submit 버튼클릭했을때 오는거니까 action으로 넘어가지 못하도록 return false
	}
	else if(use == "impossible"){
		alert("이미 등록된 아이디입니다");
		$('input[name=id]').select();
		return false;
	}
	else if(isCheck == false){
		alert("중복체크를 먼저 하세요");
		return false;
	} 
	
	
	if($('input[name=password]').val()==""){
		alert("비밀번호를 입력하세요");
		$('input[name=password]').focus();
		return false;
	}
	
	if(pwuse == "pwerror"){
		alert("비밀번호 형식이 잘못되었습니다.");
		$('input[name=password]').select();
		return false;
	}
	
	if($('input[name=password2]').val()==""){
		alert("비밀번호 확인을 입력하세요");
		$('input[name=password2]').focus();
		return false;
	}
	
	if(pwuse2 == "Nosame"){
		alert("비밀번호가 일치하지 않습니다.");
		$('input[name=password2]').select();
		return false;
	}
	
	if($('input[name=name]').val()==""){
		alert("이름을 입력하세요");
		$('input[name=name]').focus();
		return false;
	}
}

//중복체크클릭
function duplicate(){
	//alert(1);
	isCheck = true; // 중복체크 버튼을 클릭 했는지 확인
	$.ajax({
		url : "idCheckProc.jsp",
		data : ({
			userid : $('input[name=id]').val()
		}),
		success : function(data){
			//alert(data)
			
			if($('input[name=id]').val()==""){
				$("#idcheck").html('<font color=red>아이디를 입력하세요<font>').show();
				$('input[name=id]').focus();
				use = "missing";
			}
			else if($.trim(data) == "N"){
				$("#idcheck").html('<font color=red>이미 등록된 아이디입니다<font>').show();
				$('input[name=id]').select();
				use = "impossible";
			}
			else if($.trim(data) == "Y"){
				$("#idcheck").html('<font color=blue>사용가능한 아이디입니다<font>').show();
				use = "possible";
			}
		},
		error : function(){
			alert("error");
		}
	});
}

//아이디 텍스트창 키보드눌렀을때
function keyd(){
	//alert('key');
	$('#idcheck').css('display','none');
	use = "";
	isCheck = false;
}


//비밀번호
function pwcheck(){
	//alert(1);
	
	// i -> 대소문자 포함해라
	var regexp = /^[a-z0-9]{3,8}$/i; // -> 포함해서가 안된다. aaaa 는 틀린형식(숫자가없)인데도 맞는걸로 판단해버림
	var pw = $('input[name=password]').val();
	
	
	
	var chk_num = pw.search(/[0-9]/); // 숫자의 위치를 찾음
	var chk_eng = pw.search(/[a-z]/i); // 대소문자무시하고 모두합쳐서~ // 알파벳의 위치를 찾음
	
	
	
	//if(pw.search(regexp) == -1)
	if(!(regexp.test(pw))){ // test -> true or false(패턴에맞지않을때)
		$("#pwcheck").html('<font color=red>비밀번호 형식이 틀렸습니다<font>').show();
		//alert('비밀번호 형식이 틀렸습니다.');
		pwuse = "pwerror";
		return;
	}
	//alert(chk_num + " , " + chk_eng); // ab3 -> 2,0 즉, 입력안되면 -1이뜸
	else if(chk_num < 0 || chk_eng < 0){
		$("#pwcheck").html('<font color=red>비밀번호는 영문자와 숫자의 조합으로 작성하세요<font>');
		pwuse = "pwerror";
	}
	// 조합이 잘되었을 때
	else{
		$("#pwcheck").html('<font color=blue>올바른 형식입니다.<font>');
		pwuse = "";
	}
	
}

function pwcheck2(){
	//alert(1);
	if($('input[name=password2]').val() != $('input[name=password]').val()){
		$("#pwcheck2").html('<font color=red>입력한 비밀번호와 일치하지 않습니다.<font>');
		pwuse2 = "Nosame"
		return;
	} else{
		$("#pwcheck2").html('<font color=blue>비밀번호가 일치합니다<font>');
		pwuse2 = "";
	}
	
}