<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

select.jsp<br>
<style>
	td{
		text-align: center;
	}
</style>
<h2>Member 테이블의 조회 결과</h2>
<table border="1" width="500" >
	<tr>
		<th width="100">아이디</th>
		<th width="100">패스워드</th>
		<th width="100">이름</th>
		<th width="200">가입일</th>
	</tr>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "jspid";
	String dbpw = "jsppw";
	Connection conn = null;
	
	try{
		// 1. 드라이버 로드
		Class.forName(driver);
		
		// 2. 계정접속
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		// 3. SQL 작성 및 분석
		String sql = "select * from member";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		// 4. SQL 실행
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			String name = rs.getString("name");
			String reg_date = String.valueOf(rs.getDate("reg_date"));
			System.out.println(id+","+passwd+","+name+","+reg_date);
		%>
		<tr align="center">
			<td><%=id %></td>
			<td><%=passwd %></td>
			<td><%=name %></td>
			<td><%=reg_date %></td>
		</tr>
		<%
		}//while
	}catch(ClassNotFoundException e){
		// 클래스파일을 잘못 작성하거나 jar화일이 없을 때
		System.out.println("드라이버 접속 실패");
	}catch(SQLException e){
		System.out.println("계정 접속 실패");
	}finally{
		try{
			conn.close();
		}catch(SQLException e){
			System.out.println("접속 종료 실패");
		}
	}
%>

</table>