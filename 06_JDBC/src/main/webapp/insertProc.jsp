<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
%>

<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "jspid";
	String dbpw = "jsppw";
	Connection conn = null;

	try{
		Class.forName(driver);
		System.out.println("드라이버 로드 성공");
		
		// 2.계정에 접속
		conn = DriverManager.getConnection(url,dbid,dbpw);
		System.out.println("계정 접속 성공");

		// 3. SQL분석, 4. SQL실행
		String sql = "insert into member values(?,?,?,sysdate)"; // 또는 default
		PreparedStatement ps = conn.prepareStatement(sql);
		System.out.println(1);
		ps.setString(1, id);
		ps.setString(2, passwd);
		ps.setString(3, name);
		System.out.println(2);
		
		int cnt = ps.executeUpdate();
		System.out.println(3);
		System.out.println("삽입성공 : " + cnt);
		
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로드 실패");
	} catch(SQLException e){
		System.out.println("접속 실패");
	} finally{
		// 5. 접속끊기
		conn.close();
		System.out.println("계정 접속 종료");
	}
%>