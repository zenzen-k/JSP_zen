<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String str = "apple";
    switch(str) {
    case "apple" : out.print("사과"); break;
    case "banana" : out.print("바나나"); break;
    default : out.print("그 밖의 과일");
    }
%>
    	
    	