<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

form_김아연.jsp<br>

<form name="regForm" method = "post" action = "Result_김아연.jsp" > 
<table border='1'>
    <tr>
        <td align = "center">아이디</td>
        <td><input type = "text" name = "id" size = "20"></td>
    </tr>
    <tr>
        <td align = "center">비밀번호</td>
        <td><input type = "password" name = "pw" size = "20"></td> 
    </tr>
    <tr>
        <td align = "center">회원이름</td>
        <td><input type = "text" name = "name" size = "20"></td>
    </tr>
    <tr>
        <td align = "center">회원구분</td>
        <td>
        	<input type = "radio" name = "mclass" value = "1">비회원
            <input type = "radio" name = "mclass" value = "2">정회원
            <input type = "radio" name = "mclass" value = "3">우수회원
            <input type = "radio" name = "mclass" value = "4">관리자
        </td>
    </tr>
    <tr>
        <td align = "center">전화번호</td>
        <td>
            <select name = "phone1">
                <option value = "선택">선택</option>
                <option value = "010">010</option>
                <option value = "011">011</option>
                <option value = "016">016</option>
                <option value = "017">017</option>
            </select>
            -
            <input type = "text" name = "phone2" size = "4" 
            		maxlength ="4">
            -
            <input type = "text" name = "phone3" size = "4" 
            		maxlength ="4">
        </td>
    </tr>
    
    <tr>
        <td align = "center" colspan = 2>
            <input type = "submit" value = "전송" > 
            <input type = "reset" value = "취소">
        </td>
    </table>
</form>