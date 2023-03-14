<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex04_form.jsp<br>

<form action="Ex04_result.jsp" method="post">

이름 : <input type="text" name="name"><br>
비번 : <input type="text" name="password"><br>
좋아하는 과일 <br>
	<input type="checkbox" name="fruit" value="귤">귤<br>
	<input type="checkbox" name="fruit" value="딸기">딸기<br>
	<input type="checkbox" name="fruit" value="사과">사과<br>
	<input type="checkbox" name="fruit" value="포도">포도<br>
	
	<input type="submit" value="전송">
	<input type="reset" value="취소">
</form>