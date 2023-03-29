package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CategoryDao {
	
	private static CategoryDao cdao;
	PreparedStatement ps = null;
	ResultSet rs = null;
	Connection conn = null;
	
	public static CategoryDao getInstance() {
		if(cdao == null)
			cdao = new CategoryDao();
		return cdao;
	}
	
	/* 생성자 */
	private CategoryDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/* 카테고리 등록 */
	public int insertCategory(String code,String cname) {
		int cnt = -1;
		String sql = "insert into category values(catseq.nextval, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, cname);
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
	
	/* 전체 카테고리 조회 */ // 카테고리목록보기, 상품등록 폼 에서 사용됨
	public ArrayList<CategoryBean> getAllCategory() {
		ArrayList<CategoryBean> lists = new ArrayList<CategoryBean>();
		String sql = "select * from category order by cnum";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				//CategoryBean cb = new CategoryBean();
				// 생성자를 통한 주입
				CategoryBean cb = new CategoryBean(rs.getInt("cnum"), rs.getString("code"), rs.getString("cname"));
				//cb.setCnum(rs.getInt("cnum"));
				//cb.setCode(rs.getString("code"));
				//cb.setCname(rs.getString("cname"));
				
				lists.add(cb);
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
		return lists;
	}
	
	/* 카테고리 삭제 */
	public int deleteCategory(String cnum) {
		int cnt = -1;
		String sql = "delete category where cnum=" + cnum;
		try {
			ps = conn.prepareStatement(sql);
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
	
	/* 번호조회 */
	public CategoryBean getCategoryByIno(String cnum) {
		CategoryBean cb = null;
		String sql = "select * from category where cnum=" + cnum;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cb = new CategoryBean(rs.getInt("cnum"),rs.getString("code"),rs.getString("cname"));
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
		return cb;
	}
	
	/* 수정 */
	public int updateCategory(String code, String cname, String cnum) {
		int cnt = -1;
		String sql = "update category set code=?, cname=? where cnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, cname);
			ps.setString(3, cnum);
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
