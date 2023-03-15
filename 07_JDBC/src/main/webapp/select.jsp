<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	td{
		width: 100px;
		text-align: center;
	}
</style>

select.jsp<br>
<h2>register 테이블의 레코드를 화면에 표시하는 예제</h2>

<table border="1">
	<tr>
		<th>아이디</th>
		<th>패스워드</th>
		<th>이름</th>
		<th>성별</th>
		<th>email</th>
	</tr>
	
	<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "jspid";
	String dbpw = "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
	Class.forName(driver);
	conn = DriverManager.getConnection(url, dbid, dbpw);
	
	String sql = "select * from register";
	ps = conn.prepareStatement(sql);
	rs = ps.executeQuery();
	while(rs.next()){
		String id = rs.getString(1);
		String passwd = rs.getString("passwd");
		String name = rs.getString("name");
		String gender = rs.getString("gender");
		String email = rs.getString("uname") + "@" + rs.getString("dname");
		%>
		<tr><!-- <tr align="center"> -->
			<td><%=id %></td>
			<td><%=passwd %></td>
			<td><%=name %></td>
			<td><%=gender %></td>
			<td><%=email %></td>
			<%-- <td><%=uname%>@<%=dname%></td> --%>
		</tr>
		<%
	}
	
	}catch(ClassNotFoundException e){
		System.out.println("드라이버로드실패");
	}catch(SQLException e){
		System.out.println("접속실패");
	}finally{
		if(conn!=null)
			conn.close();
		if(rs!=null)
			rs.close();
		if(ps!=null)
			ps.close();
	}
	%>
</table>
