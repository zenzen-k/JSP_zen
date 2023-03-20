package myPkg;

import java.sql.*;
import java.util.ArrayList;

public class StudentDao {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public StudentDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "jspid", "jsppw");
			System.out.println("접속성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // 생성자
	
	// 전체조회
	public ArrayList<StudentBean> getAllStudent(){
		ArrayList<StudentBean> lists = new ArrayList<StudentBean>();
		
		String sql = "select * from student order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				StudentBean sb = new StudentBean();
				
				sb.setNum(rs.getInt("num"));
				sb.setId(rs.getString("id"));
				sb.setPasswd(rs.getString("passwd"));
				sb.setName(rs.getString("name"));
				sb.setYear(rs.getInt("year"));
				sb.setMonth(rs.getInt("month"));
				sb.setDay(rs.getInt("day"));
				sb.setHobby(rs.getString("hobby"));
				sb.setC(rs.getInt("c"));
				sb.setJava(rs.getInt("java"));
				sb.setJsp(rs.getInt("jsp"));
				sb.setSum(rs.getInt("sum"));
				
				lists.add(sb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	}//getAllStudent
	
	//아이디체크
	public boolean searchId(String userid) {
		boolean result = false;
		String sql = "select * from student where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//삽입
	public int insertStudent(StudentBean sb) {
		int cnt = -1;
		String sql = "insert into student values(stu_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sb.getId());
			ps.setString(2, sb.getPasswd());
			ps.setString(3, sb.getName());
			ps.setInt(4, sb.getYear());
			ps.setInt(5, sb.getMonth());
			ps.setInt(6, sb.getDay());
			ps.setString(7, sb.getHobby());
			ps.setInt(8, sb.getC());
			ps.setInt(9, sb.getJava());
			ps.setInt(10, sb.getJsp());
			ps.setInt(11, sb.getSum());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
} // DAO
