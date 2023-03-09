<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    int sum = 0;
    int i=1;
    while(i<=10){
    	sum += i;
    	i++;
    }
    out.print("<h3>1~10까지의 합 : " + sum + "</h3><br>");
    %>
    <h2>1~10까지의 합 : <%=sum%></h2>
    
    
    