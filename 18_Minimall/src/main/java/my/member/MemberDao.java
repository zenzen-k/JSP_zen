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
}
