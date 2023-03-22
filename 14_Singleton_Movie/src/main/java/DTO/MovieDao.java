package DTO;

import java.sql.*;
import java.util.ArrayList;


public class MovieDao {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private MovieDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,"jspid","jsppw");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로드실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("접속실패");
			e.printStackTrace();
		}
	}
	// 싱글톤
	private static MovieDao dao;
	public static MovieDao getInstance() { 
		if(dao == null) {
			dao = new MovieDao();
		}
		return dao;
	}
	
	
	public ArrayList<MovieBean> getAllMovie() {
		ArrayList<MovieBean> lists = new ArrayList<MovieBean>();
		String sql = "select * from movie order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieBean mb = new MovieBean();
				mb.setNum(rs.getInt("num"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setGenre(rs.getString("genre"));
				mb.setTime(rs.getString("time"));
				mb.setPartner(rs.getInt("partner"));
				mb.setMemo(rs.getString("memo"));
				
				lists.add(mb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//if(conn!=null)
				//	conn.close();
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	} // getAllMovie
	
	// 값 삽입
	public int insertMovie(MovieBean mb) {
		int cnt = -1;
		String sql = "insert into movie values(mv_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getName());
			ps.setInt(3, mb.getAge());
			ps.setString(4, mb.getGenre());
			ps.setString(5, mb.getTime());
			ps.setInt(6, mb.getPartner());
			ps.setString(7, mb.getMemo());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//if(conn!=null)
				//	conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//insertMovie
	
	//아이디검사
	public boolean searchId(String id) {
		boolean result = false;
		String sql = "select * from movie where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//if(conn!=null)
				//	conn.close();
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}//searchId
	
	// 조건 - 레코드가져오기
	public MovieBean getMovieByNum(String num) {
		MovieBean mb = new MovieBean();
		String sql = "select * from movie where num=" + num;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				mb.setNum(rs.getInt("num"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setGenre(rs.getString("genre"));
				mb.setTime(rs.getString("time"));
				mb.setPartner(rs.getInt("partner"));
				mb.setMemo(rs.getString("memo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//if(conn!=null)
				//	conn.close();
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mb;
	}//getMovieByNum
	
	public int updateMovie(MovieBean mb) {
		int cnt = -1;
		String sql = "update movie set id=?, name=?, age=?, genre=?, time=?, partner=?, memo=? where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getName());
			ps.setInt(3, mb.getAge());
			ps.setString(4, mb.getGenre());
			ps.setString(5, mb.getTime());
			ps.setInt(6, mb.getPartner());
			ps.setString(7, mb.getMemo());
			ps.setInt(8, mb.getNum());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//if(conn!=null)
				//	conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//updateMovie
	
	public int deleteMovie(String num) {
		int cnt = -1;
		String sql = "delete movie where num="+num;
		try {
			ps = conn.prepareStatement(sql);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//if(conn!=null)
				//	conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//deleteMovie
	
	public int selectDel(String[] num) {
		int cnt = -1;
		String sql = "delete movie where num=? ";
		for(int i=1; i<num.length; i++) {
			sql += " or num=? ";
		}
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0; i<num.length; i++) {
				ps.setString(i+1, num[i]);
			}
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//if(conn!=null)
				//	conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//selectDel
	
	
	public void end() {
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
}
