<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	// 상품목록
	String[] product = request.getParameterValues("product");
	String p = "";
	for(int i =0; i<product.length; i++){
		p += product[i] + " ";
	}
	//동의여부
	String agree = "";
	if(request.getParameter("agree").equals("on"))
		agree = "동의함";
	
	String[] arr = {"id","pw","product","time","approve","agree"};
	String[] arr2 = {request.getParameter("id"),
					request.getParameter("pw"),
					p,
					request.getParameter("time"),
					request.getParameter("approve"),
					agree};
%>
 
<table border=1>
	<%
	for(int i=0; i<6; i++){
		out.print("<tr>");
			out.print("<td>" + arr[i] + "</td>");
			out.print("<td>" + arr2[i] + "</td>");
		out.print("</tr>");
	}
	%>
</table>