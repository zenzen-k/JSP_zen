package myPkg;

import java.sql.*;
import java.util.ArrayList;

public class MartDao {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private String dbid = "jspid";
	private String dbpw = "jsppw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/* 생성자 */
	public MartDao() {
		System.out.println("MartDao() 생성자");
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
		}catch (Exception e) { // 하나로 묶어도 된당
			System.out.println("드라이버 로드 실패");
		}
	} // 생성자
	
	/* select */
	public ArrayList<MartBean> getAllMart(){
		ArrayList<MartBean> lists = new ArrayList<MartBean>();
		String sql = "select * from emart order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MartBean mb = new MartBean();
				mb.setNum(rs.getInt("num"));
				mb.setId(rs.getString("id"));
				mb.setPw(rs.getString("pw"));
				mb.setProduct(rs.getString("product"));
				mb.setTime(rs.getString("time"));
				mb.setApprove(rs.getString("approve"));
				mb.setAgree(rs.getString("agree"));
				
				lists.add(mb);
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
	}
	
	/* 데이터 삽입 */
	public int insertMart(MartBean mb) {
		int cnt=-1;
		String sql = "insert into emart values(e_seq.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getPw());
			ps.setString(3, mb.getProduct());
			ps.setString(4, mb.getTime());
			ps.setString(5, mb.getApprove());
			ps.setString(6, mb.getAgree());
			
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
	
	/* 데이터 삭제 */
	public int deleteMart(int num) {
		int cnt = 0;
		String sql = "delete emart where num = " + num;
		// 만약 문자열을 넣는다면? '1'
		// 그래도 오류발생은 안함!! 굳이 앞에서 int로 안바꿔도 된당
		try {
			ps = conn.prepareStatement(sql);
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
}
