<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String uname = request.getParameter("uname");
	String dname = request.getParameter("dname");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "jspid";
	String dbpw = "jsppw";
	Connection conn = null;
	PreparedStatement ps = null;
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "insert into register values(?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, passwd);
		ps.setString(3, name);
		ps.setString(4, gender);
		ps.setString(5, uname);
		ps.setString(6, dname);
		
		int cnt = ps.executeUpdate();
		if(cnt>0){
			System.out.println("insert성공 : " + cnt);
		}else{
			System.out.println("insert실패 : " + cnt);
		}
	}catch(ClassNotFoundException e){
		System.out.println("드라이버 로드 실패");
	}catch(SQLException e){
		System.out.println("접속, 분석, ?값넣기, 실행 실패");
	}finally{
		if(conn!=null)
			conn.close();
		if(ps!=null)
			ps.close();
	}
	
	response.sendRedirect("select.jsp");
%>