<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<style>
		table{
			width:80%;
			margin: 20px auto;
			text-align: center;
		}
		th{
			background: pink;
		}
	</style>
    
    <table border=1>
    <%
    out.print("<tr>");
    for(int i=2; i<=9; i++){
    	out.print("<th>" + i +"단</th>");
    }
    out.print("</tr>");
    
    for(int i=1; i<=9; i++){
    	out.print("<tr>");
    	for(int j=2; j<=9; j++){
    		
    		out.print("<td>" + j +" * "+ i + " = " + j*i +"</td>");

    	}
    	out.print("</tr>");
    }
    
    %>
    
    </table>