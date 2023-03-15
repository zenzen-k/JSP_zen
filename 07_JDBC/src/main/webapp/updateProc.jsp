<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

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
	ResultSet rs = null;
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "select * from register where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1,id);
		
		rs = ps.executeQuery();
		if(rs.next()){
			if(rs.getString("passwd").equals(passwd)){ // 가져온 아이디중 비번같으면
				sql = "update register set name=?, gender=?, uname=?, dname=? where id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, gender);
				ps.setString(3, uname);
				ps.setString(4, dname);
				ps.setString(5, id);
				
				int cnt = ps.executeUpdate();
				if(cnt>0){ // 0이면 해당되는 조건이 없을 때!
					%>
					<script type="text/javascript">alert("update 성공.");</script>
					<meta http-equiv="refresh" content="0; url=select.jsp">
					<%
					System.out.println("update성공 : " + cnt);
				}
			}else{ // 비번없을때
				%>
				<script type="text/javascript">alert("비밀번호가 틀렸습니다.");</script>
				<meta http-equiv="refresh" content="0; url=updateForm.jsp">
				<%
			}
		}else{ // 아이디없을때
			%>
			<script type="text/javascript">alert("아이디가 없습니다.");</script>
			<meta http-equiv="refresh" content="0; url=updateForm.jsp">
			<%
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
%>