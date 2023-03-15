<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

deleteProc.jsp<br>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
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
		
		String sql = "select * from member where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,id);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
			String pw = rs.getString("passwd");
			if(pw.equals(passwd)){
				sql = "delete member where id=?";
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, id);
				
				int cnt = ps.executeUpdate();
				System.out.println("삭제 성공 : " + cnt);
				out.println("삭제 성공했습니다.");
				%>
				<script type="text/javascript">
					alert("삭제 성공");
				</script>
				<%
			}
			else{
				out.println("비밀번호가 잘못되었습니다.");
			}
		}
		else{
			out.println("존재하지 않는 아이디 입니다.");
		}
		
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로드 실패");
	} catch(SQLException e){
		System.out.println("접속 실패");
	} finally{
		// 5. 접속끊기
		if(conn==null)
			conn.close();
	}
%>