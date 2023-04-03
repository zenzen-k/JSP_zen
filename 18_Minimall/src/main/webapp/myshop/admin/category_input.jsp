<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top.jsp -> category_input.jsp<br> -->

<%@ include file="top.jsp" %> <!-- 2번쨰 tr 시작 -->

	<td colspan="6" align="center" valign="top">
		<form method="post" action="categoryProc.jsp">
		<b>카테고리 등록</b>
		<table border="1">
			<tr>
				<td bgcolor="yellow" align="center">
					카테고리 코드
				</td>
				<td>
					<input type="text" name="code">
				</td>
			</tr>
			
			<tr>
				<td bgcolor="yellow" align="center">
					카테고리 이름
				</td>
				<td>
					<input type="text" name="cname">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" bgcolor="#fc0">
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
		
		</form>
	</td>

<%@ include file="bottom.jsp" %> <!-- 2번쨰 tr 끝 -->