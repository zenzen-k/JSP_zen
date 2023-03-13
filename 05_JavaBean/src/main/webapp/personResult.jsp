<%@page import="myPkg.PersonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

personResult.jsp<br>

<!-- 
4가지 클래스 생성, 객체생성, setter, getter 호출

getter 리턴값 웹브라우저에 출력하기
1. 자바코드로 객체 
2. jsp코드로 객체 
 -->

<br>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	
	// 0. 그냥출력
	out.print("이름0 : " + name + "<br>");
	out.print("나이0 : " + age + "<br>");
	out.print("주소0 : " + addr + "<br>");
	out.print("번호0 : " + tel + "<br><br>");
	
	// 1. 자바코드출력
	PersonBean pb1 = new PersonBean();
	pb1.setName(name);
	pb1.setAge(Integer.parseInt(age));
	pb1.setAddr(addr);
	pb1.setPhone(tel);
%>

이름1 : <%=pb1.getName() %><br>
나이1 : <%=pb1.getAge() %><br>
주소1 : <%=pb1.getAddr() %><br>
번호1 : <%=pb1.getPhone() %><br><br>


<!-- 2. jsp 출력 -->

<!-- myPkg.PersonBean pb2 = new myPkg.PersonBean(); -->
<jsp:useBean id="pb2" class="myPkg.PersonBean"/>

<!-- pb2.setName(name); -->
<jsp:setProperty property="name" name="pb2"/> <!--  param="name" 생략가능 -->
<jsp:setProperty property="age" name="pb2" param="age"/>
<jsp:setProperty property="addr" name="pb2" param="addr"/>
<jsp:setProperty property="phone" name="pb2" param="tel"/>

이름2 : <jsp:getProperty property="name" name="pb2"/><br>
나이2 : <jsp:getProperty property="age" name="pb2"/><br>
주소2 : <jsp:getProperty property="addr" name="pb2"/><br>
번호2 : <jsp:getProperty property="phone" name="pb2"/><br>
