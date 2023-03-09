<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex02_result.jsp 입니다.<br>

<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	//메서드이용
	int num3 = (int)(Math.pow(num1, num2));
	//반복문이용
	int mul = 1;
	int count = 0;
	while(count<num2){
		count++;
		mul *= num1;
	}
%>

숫자1 : <%=num1%><br>
숫자2 : <%=num2%><br>

<%=num1%>의 <%=num2%>승은 <%=num3%>입니다.<br>
<%=num1%>의 <%=num2%>승은 <%=mul%>입니다.<br>
<%=num1%>의 <%=num2%>승은 <%=Math.pow(num1, num2)%>입니다.<br>
<%=num1%><sup><%=num2%></sup> : <%=num3%>입니다.<br>