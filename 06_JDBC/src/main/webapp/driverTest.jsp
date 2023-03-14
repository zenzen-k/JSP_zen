<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

driverTest.jsp<br>

<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "jspid";
	String pw = "jsppw";
	Connection conn = null;
	// 0. jar 화일 추가
	// C:\Oracle\product\12.2.0\dbhome_1\jdbc\lib\ojdbc8.jar
	
	// 1. 드라이버 로드
	try{
		Class.forName(driver);
		System.out.println("드라이버 로드 성공");
		
		// 2.계정에 접속
		conn = DriverManager.getConnection(url,id,pw);
		System.out.println("계정 접속 성공");
		// 3. SQL분석, 4. SQL실행
		
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로드 실패");
	} catch(SQLException e){
		System.out.println("계정 접속 실패");
	} finally{
		// 5. 접속끊기
		conn.close();
		System.out.println("계정 접속 종료");
	}
%>