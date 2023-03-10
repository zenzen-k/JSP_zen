<%@page import="java.util.Enumeration"%>
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
	/* if(request.getParameter("agree").equals("on"))
		agree = "동의함"; */
	
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



<br><br>



<table border=1>
<%
	Enumeration<String> enu =  request.getParameterNames();
	
	while(enu.hasMoreElements()){
		String elem = enu.nextElement();
		String[] value = request.getParameterValues(elem);

%>
		<tr>
			<%
			if(!(elem.equals("agree"))){
				for(String v : value){
					out.print("<td>" + elem + "</td>");
					out.print("<td>" + v + "</td>");
				}
			}
			else{
				String[] values = request.getParameterValues("agree");
				out.print("<td>agree</td>");
				for(int i=0; i<values.length; i++){
					if(values[i] == null){
						out.print("동의안함");
					}else{
						out.print("동의함");
					}
				}
			}
				
				// checkbox는 선택하지 않으면 이름조차 가져올 수 없다
				/* if(elem.equals("agree")){
					for(int i=0; i<value.length; i++){
						if(value[i] == null){
							out.print("동의안함");
						}else{
							out.print("동의함");
						}
					}
				} */
				
			%>
		</tr>
<%
		
	}
%>
</table>