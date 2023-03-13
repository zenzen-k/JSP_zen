<%@page import="myPkg.Bean_김아연"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String mclass = request.getParameter("mclass");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	
	String className = "";
	if(mclass.equals("1")){
		className = "비회원";
	}else if(mclass.equals("2")){
		className = "정회원";
	}else if(mclass.equals("3")){
		className = "우수회원";
	}else if(mclass.equals("4")){
		className = "관리자";
	}
	
	/* 1. 자바코드 - 객체 생성 및 setter*/
	Bean_김아연 bb = new Bean_김아연();
	
	bb.setId(id);
	bb.setPw(pw);
	bb.setName(name);
	bb.setMclass(className);
	bb.setPhone1(phone1);
	bb.setPhone2(phone2);
	bb.setPhone3(phone3);
%>
<!--  1. 자바코드 - getter 출력 -->
<h3>당신이 입력한 정보입니다.</h3>
<hr>
아이디1 : <%=bb.getId() %><br>
비번1 : <%=bb.getPw() %><br>
이름1 : <%=bb.getName() %><br>
회원구분1 : <%=bb.getMclass() %><br>
전화번호1 : <%=bb.getPhone1() %> - 
			<%=bb.getPhone2() %> - 
			<%=bb.getPhone3() %>

<hr>
<!-- 2. jsp코드 - 객체생성 및 setProperty -->
<jsp:useBean id="bb2" class="myPkg.Bean_김아연"/>
<jsp:setProperty property="id" name="bb2"/>
<jsp:setProperty property="pw" name="bb2"/>
<jsp:setProperty property="name" name="bb2"/>
<jsp:setProperty property="mclass" name="bb2" value="<%=className%>"/>
<jsp:setProperty property="phone1" name="bb2" param="phone1"/>
<jsp:setProperty property="phone2" name="bb2" param="phone2"/>
<jsp:setProperty property="phone3" name="bb2" param="phone3"/>

<!-- 2. jsp코드 - getProperty 출력 -->
아이디2 : <jsp:getProperty property="id" name="bb2"/><br>
비번2 : <jsp:getProperty property="pw" name="bb2"/><br>
이름2 : <jsp:getProperty property="name" name="bb2"/><br>
회원구분2 : <jsp:getProperty property="mclass" name="bb2"/><br>
전화번호2 : <jsp:getProperty property="phone1" name="bb2"/> - 
			<jsp:getProperty property="phone2" name="bb2"/> - 
			<jsp:getProperty property="phone3" name="bb2"/>
