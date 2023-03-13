<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

main.jsp<br>

<h3>템플릿 페이지 - 메인 페이지</h3><br>

<form method="post" action="control.jsp">
<table border='1' width="300" height="200">
  <tr>
    <th colspan="2">제품을 선택해 주세요</th>
  </tr>
  
  <tr>
    <td><b>제품</b></td>
    <td>
    	<input type="radio" name="products" value="1">텔레비전<br>
    	<input type="radio" name="products" value="2">디지털카메라<br>
    	<input type="radio" name="products" value="3">MP3 플레이어<br>
    </td>
  </tr>
  
  <tr>
    <th colspan="2">
    	<input type="submit" value="확인">
    	<input type="reset" value="취소">
    </th>
  </tr>
</table>
</form>