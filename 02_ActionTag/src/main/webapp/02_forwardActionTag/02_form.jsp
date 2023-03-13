<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

02_form.jsp<br>

<form action="02_via.jsp" method="post">
이름 : <input type="text" name="name"><br>
색 선택 :<br>
	<input type="radio" name="color" value="yellow">노란색<br>
	<input type="radio" name="color" value="green">초록색<br>
	<input type="radio" name="color" value="blue">파란색<br>
	<input type="radio" name="color" value="red">빨간색<br>
	
	<input type="submit" value="전송">
</form>