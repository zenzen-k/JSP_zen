<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


Ex04_form.jsp -> Ex04_result2.jsp <br>


<table border='1'>
<%
	request.setCharacterEncoding("utf-8");
	
	// 열거된 데이터를 관리할 수 있는 Enumeration형 변수에 담아진다.
	Enumeration<String> enu = request.getParameterNames();
	
	// enu가 관리하는건 요소(elements)들 이다.
	while(enu.hasMoreElements()){
		String element = enu.nextElement();
		System.out.println("element : "+element);
		
		//가져온 네임에 해당하는 값을 변수에 저장함
		String[] value = request.getParameterValues(element);
%>
		<!-- 테이블 형태의 출력 -->
		<tr>
		<td><%=element %></td>
		<td>
			<%
			for(int i=0; i<value.length; i++){
				out.print(value[i]+ " ");
			}
			%>
		</td>
		</tr>
<%		
	}//while
%>
</table>