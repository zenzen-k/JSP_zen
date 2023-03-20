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
	}//
	
	//일부select
	public BookBean getBookByNo(String no) {
		BookBean bb = new BookBean();
		String sql = "select * from book where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb.setNo(rs.getInt("no"));
				bb.setTitle(rs.getString("title"));
				bb.setAuthor(rs.getString("author"));
				bb.setPublisher(rs.getString("publisher"));
				bb.setPrice(rs.getInt("price"));
				bb.setBuy(String.valueOf(rs.getDate("buy"))); 
				bb.setKind(rs.getString("kind"));
				bb.setBookstore(rs.getString("bookstore"));
				bb.setCount(rs.getInt("count"));
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
		return bb;
	}
	
	//update
	public int updateBook(BookBean bb) {
		int cnt = -1;
		
		String sql = "update book set title=?, author=?, publisher=?, price=?, buy=?, kind=?, bookstore=?, count=? where no=?";
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
			ps.setInt(9, bb.getNo());
			
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
	}//updateBook
	
	//삭제
	public int deleteBook(String no) {
		int cnt = -1;
		String sql = "delete book where no="+no;
		
		try {
			ps = conn.prepareStatement(sql);
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
				e.printStackTrace();
			}
		}
		return cnt;
	} //deleteBook
	
	//선택삭제
	public int deleteCheckData(String[] no){
		int cnt = -1;
		// delete book where no in(?,?,?)
		// delete book where no=? or no=? or no=?
		String sql = "delete book where no=?";
		for(int i=1; i<no.length; i++) {
			sql += " or no=? ";
		}
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0; i<no.length; i++) {
				ps.setString(i+1, no[i]);
			}
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
		// 삭제 성공개수 리턴
		System.out.println("cnt : " + cnt);
		return cnt;
	} //deleteCheckData
	
}
