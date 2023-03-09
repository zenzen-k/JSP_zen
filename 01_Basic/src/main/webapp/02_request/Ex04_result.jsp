<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	//String fruit = request.getParameter("fruit");
	String[] fruit = request.getParameterValues("fruit");
	String[] sports = request.getParameterValues("sports");
%>


이름 : <%= name %><br>
비번 : <%= pw %><br>

			

<%
	if(fruit==null){
		out.print("선택한 과일이 없습니다.<br>");
	}
	else {
		out.print("과일 : ");
		for(int i=0; i<fruit.length; i++){
			out.print("<font color='red'>" + fruit[i]+ "</font> ");
		}
	}
%>
<br>
운동 : 

<%
	if(sports==null)
		out.print("선택한 운동이 없습니다.<br>");
	else{
		for(String s : sports){
			if(!(s.equals("선택"))){
				out.print(s + " ");
			}
		}
	}
%>
<br>