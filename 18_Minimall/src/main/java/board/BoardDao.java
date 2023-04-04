package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "jspid";
	String pw = "jsppw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 싱글톤으로 하려면 기본생성자의 생략을 하면 안된다. -> public으로 생성되기 때문에
	private BoardDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//싱글톤 패턴으로 dao 객체 생성하기
	private static BoardDao bdao;
	public static BoardDao getInstance() {
		if(bdao == null)
			bdao = new BoardDao();
		return bdao;
	}
	
	public ArrayList<BoardBean> getArticles(int start, int end){ // 1페이지 : 1,5  / 2페이지 : 6,10
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		
		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";
		
		//String sql = "select * from board order by num desc";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));

				lists.add(bb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 자원반납
			try {
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
	
	//게시글수
	public int getArticleCount() { 
		int count = 0;
		// 또는 as cnt 로 별칭을 지정해서 아래 rs.getInt("cnt"); 로해도 ㄱㅊ
		String sql = "select count(*) from board";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	// 원글쓰기
	public int insertArticle(BoardBean bb) {
		int cnt = -1;
		String sql = "insert into board(num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip) "
				+ "values(board_seq.nextval, ?, ?, ?, ?, ?, board_seq.currval, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getEmail());
			ps.setString(3, bb.getSubject());
			ps.setString(4, bb.getPasswd());
			ps.setTimestamp(5, bb.getReg_date());
			// ps.setInt(6, 0); // readcount -> 어자피 기본값이 0이다.
			// ref : 답글관련 정보를 넣는 칼럼
			// ps.setInt(7, bb.getRef()); // ref -> board_seq.currval 현재 시퀀스와 같은 번호
			ps.setInt(6, 0); // re_step
			ps.setInt(7, 0); // re_level
			ps.setString(8, bb.getContent());
			ps.setString(9, bb.getIp());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("insert cnt : " + cnt);
		return cnt;
	}
	
	
	public BoardBean getArticleByNum(String num) {
		
		String sql2 = "update board set readcount=readcount+1 where num=?";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setString(1, num);
			ps.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		BoardBean bb = new BoardBean();
		String sql = "select * from board where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			try {
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
	
	public BoardBean getContentByNum(String num) {
		BoardBean bb = new BoardBean();
		String sql = "select * from board where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bb;
	} //getContentByNum
	
	
	// 입력된 비밀번호 검사,
	public int updateArticle(BoardBean bb){ // 6가지가 넘어왔음
		int cnt = -1; // 성공 :1 , sql조건실패 :0, 수정실패 :-1, 비밀번호틀림 :-2
		
		// 원래 비밀번호 가져오기
		String dbpw = "";
		String sql = "select passwd from board where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bb.getNum());
			rs = ps.executeQuery();
			if(rs.next()) {
				dbpw = rs.getString("passwd"); // DB에 저장된 비번
				
				// 비밀번호 비교
				if(dbpw.equals(bb.getPasswd())) { // 비밀번호 일치하면
					// 패스워드는 수정대상이 아니다.
					sql = "update board set writer=?, email=?, subject=?, content=? where num=?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, bb.getWriter());
					ps.setString(2, bb.getEmail());
					ps.setString(3, bb.getSubject());
					ps.setString(4, bb.getContent());
					ps.setInt(5, bb.getNum());
					
					cnt = ps.executeUpdate();
				} else { // 다를때
					cnt = -2;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	} //updateArticle
	
	public int deleteArticle(String num, String passwd) {
		int cnt = -1;
		String dbpw = "";
		String sql = "select passwd from board where num=?";
		String sql2 = "delete board where num=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				dbpw = rs.getString("passwd");
				
				if(dbpw.equals(passwd)) {
					ps = conn.prepareStatement(sql2);
					ps.setString(1, num);
					cnt = ps.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	} //deleteArticle
	
	public int replyArticle(BoardBean bb) {
		// 10가지 정보가 넘어옴. 7:답글내용 3:부모정보
		int cnt = -1;
		
		int re_step = 0, re_level = 0;
		// 기존에 있던것들 먼저 수정작업 후 insert 해주어야 함.
		String sql = "update board set re_step = re_step+1 where ref=? and re_step>?";
		String sql2 = "insert into board values(board_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			// update
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bb.getRef());
			ps.setInt(2, bb.getRe_step());
			re_step = bb.getRe_step() +1;
			re_level = bb.getRe_level() +1;
			ps.executeUpdate();
			
			// insert
			ps = conn.prepareStatement(sql2);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getEmail());
			ps.setString(3, bb.getSubject());
			ps.setString(4, bb.getPasswd());
			ps.setTimestamp(5, bb.getReg_date());
			ps.setInt(6, 0); // readcount 
			ps.setInt(7, bb.getRef()); // ref
			ps.setInt(8, re_step); // re_step
			ps.setInt(9, re_level); // re_level
			ps.setString(10, bb.getContent());
			ps.setString(11, bb.getIp());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	} // replyArticle
}
