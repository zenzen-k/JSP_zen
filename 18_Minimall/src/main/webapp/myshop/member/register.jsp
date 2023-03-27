<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">
<style type="text/css">
	th {
		background-color: yellow;
	}
	tr:last-child th, tr:first-child th, tr:nth-child(6) th{ /* th[colspan="2"] */
		background-color: #fc0;
		font-size: 15px;
	}
</style>

<!-- webapp파일까지는 포함한당! -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script.js"></script>

main.jsp(회원가입버튼) -> myshop/member/register.jsp<br>

<form action="registerProc.jsp" method="post" onsubmit="return writeSave()">
<table border="1">
	<tr>
		<th colspan="2">◈ 기본 정보 ◈</th>
	</tr>

	<tr>
		<th>* 회원 아이디</th>
		<td>
			<input type="text" name="id" onkeydown="keyd()">
			<input type="button" id="idbtn" value="중복체크" onclick="duplicate()">
			<span id="idcheck"></span>
		</td>
	</tr>
	
	<tr>
		<th>* 비밀번호</th>
		<td>
			<input type="password" name="password" onBlur="pwcheck()">
			<span id="pwcheck">영문 소문자/숫자 조합 3~8자</span>
		</td>
	</tr>
	
	<tr>
		<th>* 비밀번호 확인</th>
		<td>
			<input type="password" name="password2" onkeyup="pwcheck2()">
			<span id="pwcheck2"></span>
		</td>
	</tr>
	
	<tr>
		<th>E-Mail</th>
		<td>
			<input type="text" name="email" value="gildong@naver.com">
		</td>
	</tr>
	
	<tr>
		<th colspan="2">◈ 개인 신상 정보 ◈</th>
	</tr>
	
	<tr>
		<th>한글이름</th>
		<td>
			<input type="text" name="name" value="홍길동">
			<span id="namecheck">성과 이름을 붙여주세요 (예)홍길동</span>
		</td>
	</tr>
	
	<tr>
		<th>주민 등록 번호</th>
		<td>
			<input type="text" name="rrn1" maxlength="6" size="7" value="123456"> - 
			<input type="text" name="rrn2" maxlength="7" size='7' value="1234567">
		</td>
	</tr>
	
	<tr>
		<th>휴대 전화 번호</th>
		<td>
			<select name="hp1">
				<option value="010">010</option>
				<option value="011">011</option>
			</select>
			 - 
			<input type="text" name="hp2" maxlength="4" size="4" value="1234"> - 
			<input type="text" name="hp3" maxlength="4" size="4" value="1234">
			<span id="hpcheck">예) 011-000-0000</span>
		</td>
	</tr>
	
	<tr>
		<th>가입 일자</th>
		<td>
			<input type="text" name="joindate" value="2020/01/01">
			<span id="joincheck">예)2000/05/22</span>
		</td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="가입하기">
			<input type="reset" value="취소">
		</th>
	</tr>
</table>
</form>