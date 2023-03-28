package my.member;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	private static MemberDao mdao; // static 메서드 안에서는 static 변수만 사용 가능하므로!
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/* 생성자 */
	private MemberDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env"); // 설정정보가 자동저장된다
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); // 
			conn = ds.getConnection(); // 정보에 따라서 접속해라~
			System.out.println("conn : " + conn);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	/* 객체생성 메서드 */
	public static MemberDao getInstance() { // 클래스로 호출하기 위해 static
		if(mdao==null)
			mdao = new MemberDao();
		return mdao;
	}
	
	/* 아이디 중복체크 */
	public boolean searchId(String userid) {
		boolean result = false;
		String sql = "select * from members where id=?";
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
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/* 회원가입 */
	public int insertMember(MemberDTO mdto) {
		int cnt = -1;
		String sql = "insert into members values(memseq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getId());
			ps.setString(3, mdto.getPassword());
			ps.setString(4, mdto.getRrn1());
			ps.setString(5, mdto.getRrn2());
			ps.setString(6, mdto.getEmail());
			ps.setString(7, mdto.getHp1());
			ps.setString(8, mdto.getHp2());
			ps.setString(9, mdto.getHp3());
			ps.setString(10, mdto.getJoindate());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	/* 아이디 찾기 */
	public MemberDTO findid(MemberDTO mdto) { // 3가지가 넘어온다.
		String sql = "select * from members where name=? and rrn1=? and rrn2=?";
		MemberDTO member = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getRrn1());
			ps.setString(3, mdto.getRrn2());
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				member = getMemberDTO(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member; // 못찾으면 null값 리턴된다.
	}
	
	// 찾은 레코드가 있으면 rs에 담긴 레코드를 memberDTO객체에 넣어주는 함수 -> 자주 있을거임
	private MemberDTO getMemberDTO(ResultSet rs2) throws SQLException {
		MemberDTO member = new MemberDTO();
		member.setNo(rs2.getInt("no"));
		member.setName(rs2.getString("name"));
		member.setId(rs2.getString("id"));
		member.setPassword(rs2.getString("password"));
		member.setRrn1(rs2.getString("rrn1"));
		member.setRrn2(rs2.getString("rrn2"));
		member.setEmail(rs2.getString("email"));
		member.setHp1(rs2.getString("hp1"));
		member.setHp2(rs2.getString("hp2"));
		member.setHp3(rs2.getString("hp3"));
		member.setJoindate(rs2.getString("joindate"));

		return member;
	}
	
	/* 비밀번호 찾기 */
	public MemberDTO findpw(MemberDTO mdto) { //4가지가 넘어온다
		MemberDTO member = new MemberDTO();
		String sql = "select * from members where id=? and name=? and rrn1=? and rrn2=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mdto.getId());
			ps.setString(2, mdto.getName());
			ps.setString(3, mdto.getRrn1());
			ps.setString(4, mdto.getRrn2());
			
			rs = ps.executeQuery();
			if(rs.next()) {
				member = getMemberDTO(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
	
	/* 로그인-정보찾기 */
	public MemberDTO getMemberInfo(String id, String password) {
		MemberDTO member = null;
		String sql = "select * from members where id=? and password=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				member = getMemberDTO(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
}
