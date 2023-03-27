<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
dbcp.jsp<br>

<%
	Connection conn = null;
	PreparedStatement ps = null;
	
	// 원래는 Class.forName~~` 으로 계정접속해야햇음
	/* 접속 객체 생성 */
	// InitialContext은 NamingException 예외발생. 원래는 예외처리 해줘야하지만 서블릿이 자동으로해쥼~
	try{
		Context initContext = new InitialContext(); 
		Context envContext = (Context)initContext.lookup("java:comp/env"); // 설정정보가 자동저장된다
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); // 
		conn = ds.getConnection(); // 정보에 따라서 접속해라~
		System.out.println("conn : " + conn);
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String sql = "insert into tdbcp values(?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1,name);
		ps.setString(2,email);
		ps.executeUpdate();
	} catch(Exception e){
		
	}
%>


<h2>DBCP 테스트</h2>
<form name="form" method="post" action="dbcp.jsp"> <!-- 현재작업중인 파일로 넘어옴 -->
	이름 : <input type="text" name="name"><br>
	이메일 : <input type="text" name="email"><br>
	<input type="submit" value="등록">
</form>

<hr>
<h2>목록 보기</h2>
<%
	String sql = "select * from tdbcp";
	ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	int i=1;
	while(rs.next()){
		out.print(rs.getString(1) + ", " + rs.getString(2) + "<br>");
		i++;
	}
	rs.close();
	ps.close();
	conn.close();
%>
