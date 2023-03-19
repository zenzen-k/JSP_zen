package DTO;

import java.sql.*;
import java.util.ArrayList;

public class BookDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private String id = "jspid";
	private String pw = "jsppw";
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public BookDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
		} catch(ClassNotFoundException e) {
			
		} catch(SQLException d) {
			
		}
	} // BookDao
	
	//전체조회
	public ArrayList<BookBean> getAllBook(){
		ArrayList<BookBean> lists = new ArrayList<BookBean>();
		String sql = "select * from book order by no";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BookBean bb = new BookBean();
				bb.setNo(rs.getInt("no"));
				bb.setTitle(rs.getString("title"));
				bb.setAuthor(rs.getString("author"));
				bb.setPublisher(rs.getString("publisher"));
				bb.setPrice(rs.getInt("price"));
				bb.setBuy(String.valueOf(rs.getDate("buy"))); 
				bb.setKind(rs.getString("kind"));
				bb.setBookstore(rs.getString("bookstore"));
				bb.setCount(rs.getInt("count"));
				
				lists.add(bb);
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
	}//getAllBook
	
	//삽입
	public int insertBook(BookBean bb) {
		int cnt = -1;
		String sql = "insert into book values(bseq.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getTitle());
			ps.setString(2, bb.getAuthor());
			ps.setString(3, bb.getPublisher());
			ps.setInt(4, bb.getPrice());
			ps.setString(5, bb.getBuy());
			ps.setString(6, bb.getKind());
			ps.setString(7, bb.getBookstore());
			ps.setInt(8, bb.getCount());
			
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
	}//
	
	//책제목체크
	public boolean searchTitle(String usertitle) {
		boolean flag = false;
		String sql = "select * from book where title=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, usertitle);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				flag =  true;
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
		return flag;
	}
}
