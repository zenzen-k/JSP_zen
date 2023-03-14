<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex05_form.jsp<br>

<form action="Ex05_result.jsp">

이름 : <input type="text" name="name"><br>
비번 : <input type="text" name="password"><br><br>

과목 점수<br>
<%
	String[] subject = {"국어","영어","수학","과학","음악"};
	for(int i=0; i<subject.length; i++){
%>		<%=subject[i] %> : <input type="text" name="jumsu"><br>
<%
	}
%>

<br>
좋아하는 걸그룹<br>
<select name="group" multiple>
	<option value="블랙핑크">블랙핑크</option>
	<option value="핑클">핑클</option>
	<option value="에이핑크">에이핑크</option>
	<option value="레드벨벳">레드벨벳</option>
	<option value="트와이스">트와이스</option>
</select>
<br>

<input type="submit" value="전송">
<input type="reset" value="취소">
</form>