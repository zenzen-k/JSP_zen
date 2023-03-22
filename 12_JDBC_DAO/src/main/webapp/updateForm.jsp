<%@page import="DTO.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:useBean id="dao" class="DTO.MovieDao"/>
<%
	String[] time = {"08~10", "10~12", "12~14", "14~16", "16~18", "18~20"};
	String[] genre = {"공포", "다큐", "액션", "애니메이션"};
	String num = request.getParameter("num");
	MovieBean mb = dao.getMovieByNum(num);
%>

<h3>영화 정보 수정</h3>
<form name="myform" action="updateProc.jsp">
<input type="hidden" name="num" value="<%=num%>">
<table border="1">
	<tr>
		<td>아이디 : </td>
		<td>
			<input type="text" name="id" value="<%=mb.getId()%>">
		</td>
	</tr>
	
	<tr>
		<td>이름 </td>
		<td><input type="text" name="name" value="<%=mb.getName()%>"></td>
	</tr>
	
	<tr>
		<td>나이 </td>
		<td><input type="text" name="age" value="<%=mb.getAge()%>"></td>
	</tr>
	
	<tr>
		<td>좋아하는 장르 </td>
		<td>
		<%for(int i=0; i<genre.length; i++){%>
			<input type="checkbox" name="genre" value="<%=genre[i]%>" 
			<%if(mb.getGenre().contains(genre[i])){%>checked<%} %>> <%=genre[i]%> 
		<%}%>
		</td>
	</tr>
	
	<tr>
		<td>즐겨보는 시간대 </td>
		<td>
		<select name="time">
			<%for(int i=0; i<time.length; i++){%>
				<option value=<%=time[i]%> <%if(time[i].equals(mb.getTime())){%>selected<%} %>>
				<%=time[i]%></option>
			<%}%>
		</select>
		</td>
	</tr>
	
	<tr>
		<td>동반 관객수 </td>
		<td>
			<%for(int i=1; i<=5; i++){%>
				<input type="radio" name="partner" value="<%=i%>" 
				<%if(mb.getPartner() == i){%>checked<%} %>> <%=i%>  
			<%}%>
		</td>
	</tr>
	
	<tr>
		<td>영화관 개선사항</td>
		<td>
		<textarea rows="4" cols="40" name="memo"><%if(mb.getMemo().equals("없음")){%><%}else{%><%=mb.getMemo()%><%}%></textarea>
			</td>
	</tr>
	
	<tr>
		<td colspan="2" style="text-align: center">
			<input type="submit" value="수정하기">
		</td>
	</tr>
</table>
</form>