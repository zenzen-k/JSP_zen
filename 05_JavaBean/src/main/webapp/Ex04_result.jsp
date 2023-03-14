<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex04_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");

	String[] fruit = request.getParameterValues("fruit");
	
	for(int i=0; i<fruit.length; i++){
		out.print(fruit[i]+" ");
	}
%>
<hr>

<jsp:useBean id="b" class="myPkg.Ex04_Bean"/>
<%-- <jsp:setProperty property="*" name="b"/> --%>
<jsp:setProperty property="name" name="b"/>
<jsp:setProperty property="password" name="b"/>
<jsp:setProperty property="fruit" name="b"/>
이름 : <jsp:getProperty property="name" name="b"/><br>
비번 : <jsp:getProperty property="password" name="b"/><br>
과일1 : <jsp:getProperty property="fruit" name="b"/><br>
과일2 : 
<%
	String[] fruit2 = b.getFruit();
	for(int i=0; i<fruit2.length; i++){
		//out.print();
%>
		<%=fruit2[i]%>
<%
	}
%>