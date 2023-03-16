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
	
	/* 전체조회 */
	public ArrayList<EmplBean> getAllEmpl(){
		ArrayList<EmplBean> lists = new ArrayList<EmplBean>();

		String sql = "select * from empl order by num";
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
	
	/* 삽입 */
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
	
	/* 특정값 조회 */
	public EmplBean getEmplByNum(int num) {
		EmplBean eb = new EmplBean();
		String sql = "select * from empl where num = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				eb.setNum(rs.getInt("num"));
				eb.setName(rs.getString("name"));
				eb.setDeptno(rs.getInt("deptno"));
				eb.setSalary(rs.getInt("salary"));
			}
		} catch (SQLException e) {
			System.out.println("sql분석,실행 실패");
		} finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				System.out.println("접속종료 실패");
			}
		}
		return eb;
	}
	
	/* 수정 */
	public int updateEmpl(EmplBean eb) {
		int cnt = -1;
		String sql = "update empl set name=?, deptno=?, salary=? where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, eb.getName());
			ps.setInt(2, eb.getDeptno());
			ps.setInt(3, eb.getSalary());
			ps.setInt(4, eb.getNum());
			
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
		System.out.println(cnt);
		return cnt;
	}
	
	/* 삭제 */
	public int delEmpl(int num) {
		int cnt = -1;
		String sql = "delete empl where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				System.out.println("접속종료 실패");
			}
		}
		System.out.println(cnt);
		return cnt;
	}
}
