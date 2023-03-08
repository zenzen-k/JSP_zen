<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! // 메서드 정의
	
	public int multiply(int a, int b){
		int c = a * b;
		return c;
	}
	
	// add 메서드 정의
	public int add(int num1, int num2){
		return num1 + num2;
	}
%>

<%-- 리턴된 값을 출력할 것이니까 표현식을 작성한다. --%>
<%-- 만약에 위 메서드가 void 여서 리턴값이 없다면 표현식을 굳이 사용하지 않아도 된다 --%>

20*30 = <%= multiply(20,30) %>

<br><br>

<%-- <%! // add 정의
	public int add(int num1, int num2){
		return num1 + num2;
	}
%> --%>

<%
	int num1 = 70;
	int num2 = 10;
	int result = add(num1, num2);
	// result 출력
%>

<%= num1 %> + <%= num2 %> = <%= result %>
