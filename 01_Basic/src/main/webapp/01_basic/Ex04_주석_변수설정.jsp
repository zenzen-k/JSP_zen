<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! // 메서드 정의.  - 선언문 <%! 
	// 메서드 안에서는 선언문 안에 있는 변수를 사용.
	String id = "kim"; // 전역변수
	public String getId(String id){
		return id;
	}
%>


<%= getId("choi") %> <!--  표현식(출력) -->  <br>


<% String id = "park"; // 지역변수 %>
<%= getId("choi") %> <br>
id : <%=id %> <br>

<%-- 지역변수가 우선순위가 높당. --%>
<%-- 스크립트릿에 있는 변수는 지역변수이며, 선언문에 있는 변수는 전역변수다. 지역변수가 없다면 전역변수가 사용된다. --%>
<%-- 전역변수는 기본 null 로 자동 초기화가 되지만 지역변수는 초기화 안하면 에러뜸 --%>

<%--            --%>


<%
	String comments = "주석문 연습";
%>

첫번째 comments : <%= comments %> <br>
두번째 comments : <%-- <%=comments %> --%> <br>
세번째 comments : <!-- <%= comments %> --> <br>





