<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
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
		
		String sql = "select * from register where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		if(rs.next()){
			if(rs.getString("passwd").equals(passwd)){
				sql = "delete from register where id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				
				int cnt = ps.executeUpdate();
				System.out.println("cnt : " + cnt);
				if(cnt>0){
					%>
					<script type="text/javascript">alert("삭제가 완료되었습니다.");</script>
					<meta http-equiv="refresh" content="0; url=select.jsp">
					<%
				}
			}else{
				%>
				<script type="text/javascript">alert("비밀번호가 틀렸습니다.");</script>
				<meta http-equiv="refresh" content="0; url=deleteForm.jsp">
				<%
			}
		}else{
			%>
			<script type="text/javascript">alert("없는 아이디 입니다.");</script>
			<meta http-equiv="refresh" content="0; url=deleteForm.jsp">
			<%
		}
		
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로드 실패");
	} catch(SQLException e){
		System.out.println("접속, 분석, ?값넣기, 실행 실패");
	}finally{
		if(conn!=null){
			conn.close();
			System.out.println("접속종료");				
		}
		if(ps!=null)
			ps.close();
	}
%>