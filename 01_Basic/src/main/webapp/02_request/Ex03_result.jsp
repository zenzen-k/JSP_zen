<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex03_result.jsp <br>

<%
	request.setCharacterEncoding("utf-8"); // post 방식에서는 한글이 깨질 수 있음

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String color = request.getParameter("color");
	String abc = request.getParameter("abc"); // 없는 걸 작성하면 null이 나온다.
%>

이름 : <%= request.getParameter("name") %><br>
나이 : <%= age %><br>
성별 : <%= gender %><br>
취미 : <%= hobby %><br>
색상 : <%= color %><br>
abc : <%= abc %><br><br>

<%
	if(abc == null){
		out.print("abc없음<br>");
	}

	if(gender.equals("m"))
		out.print("남자");
	else
		out.print("여자");
	
	String selectedColor="";
	if(color.equals("blue")){
		selectedColor = "파란색";
	}else if(color.equals("red")){
		selectedColor = "빨간색";
	}else if(color.equals("green")){
		selectedColor = "초록색";
	}else{
		selectedColor = "노란색";
	}
%>

<br>

선택한 색 : <%=selectedColor %><img src="../images/<%=color%>.jpg">
선택한 색 : <%=selectedColor %><img src="../images/<%=color+".jpg"%>">

