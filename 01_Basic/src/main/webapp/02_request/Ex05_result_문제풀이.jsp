<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id"); // 넘어온 값의 name 속성을 작성.
	String pw = request.getParameter("pw");
	String[] product = request.getParameterValues("product");
	String time = request.getParameter("time");
	String approve = request.getParameter("approve");
	String agree = request.getParameter("agree");
	
%>

<table border=1>
	<tr>
		<td>id</td>
		<td><%=id%></td>
	</tr>
	<tr>
		<td>pw</td>
		<td><%=pw%></td>
	</tr>
	<tr>
		<td>product</td>
		<td>
		<%
		for(int i =0; i<product.length; i++){
			out.print(product[i] + " ");
		}
		%>
		</td>
	</tr>
	<tr>
		<td>time</td>
		<td><%=time%></td>
	</tr>
	<tr>
		<td>approve</td>
		<td><%=approve%></td>
	</tr>
	<tr>
		<td>agree</td>
		<td>
		<%
		if(agree == null) //체크하면 on, 체크 안하면 null이 나온다 
			out.print("동의안함");
		else 
			out.print("동의함");
		%>
		</td>
	</tr>
</table>