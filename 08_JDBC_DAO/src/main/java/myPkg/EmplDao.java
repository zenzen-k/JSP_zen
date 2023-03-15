package myPkg;

import java.sql.*;
import java.util.ArrayList;

public class EmplDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "jspid";
	String dbpw = "jsppw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/* 생성자 */
	public EmplDao() {
		System.out.println("EmplDao() 생성자");
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);

		}catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
		}catch (SQLException e) {
			System.out.println("접속실패");
		}
	} // 생성자

	public ArrayList<EmplBean> getAllEmpl(){
		ArrayList<EmplBean> lists = new ArrayList<EmplBean>();

		String sql = "select * from empl";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println("rs");
				EmplBean eb = new EmplBean();
				eb.setNum(rs.getInt("num"));
				eb.setName(rs.getString("name"));
				eb.setDeptno(rs.getInt("deptno"));
				eb.setSalary(rs.getInt("salary"));

				lists.add(eb);
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
		System.out.println("lists.size() : " + lists.size());
		return lists;
	}

	public int insertEmpl(EmplBean eb) {
		int cnt = -1;
		String sql = "insert into empl values(eseq.nextval,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, eb.getName());
			ps.setInt(2, eb.getDeptno());
			ps.setInt(3, eb.getSalary());
			
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
				System.out.println("접속종료 실패");
			}
		}
		return cnt;
	}
}
