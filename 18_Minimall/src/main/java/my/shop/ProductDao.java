package my.shop;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	
	private static ProductDao pdao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private ProductDao() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 객체생성
	public static ProductDao getInstance() {
		if(pdao == null)
			pdao = new ProductDao();
		return pdao;
	}
	
	// 상품등록
	public int insertProduct(MultipartRequest mr) {
		int cnt = -1;
		String sql = "insert into product(pnum, pname, pcategory_fk, pcompany, pimage, pqty, price, pspec, pcontents, point, pinputdate) "
				+ "values(catprod.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			//Calendar cal = Calendar.getInstance();
			// sdf.format(cal.getTime());
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			//System.out.println(sdf.format(d));
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			
			// 카테고리 코드와 상품코드를 연결해서 넣을거임
			String p_fk = mr.getParameter("pcategory_fk");
			p_fk += mr.getParameter("pcode");
			ps.setString(2, p_fk); // pcategory_fk + pcode -> 나중에 활용할것이 있어서,,
			
			ps.setString(3, mr.getParameter("pcompany"));
			ps.setString(4, mr.getFilesystemName("pimage"));
			ps.setInt(5, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(6, Integer.parseInt(mr.getParameter("price")));
			ps.setString(7, mr.getParameter("pspec"));
			ps.setString(8, mr.getParameter("pcontents"));
			ps.setInt(9, Integer.parseInt(mr.getParameter("point")));
			ps.setString(10, sdf.format(d));
			
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
	
	/* 상품 전체 조회*/
	public ArrayList<ProductBean> getAllProduct() {
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		String sql = "select * from product order by pnum";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcategory_fk(rs.getString("pcategory_fk"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPoint(rs.getInt("point"));
				pb.setPinputdate(rs.getString("pinputdate"));
				
				lists.add(pb);
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
	
	/* 조건조회 */ // 쇼핑몰홈-상세보기, 관리자페이지-이미지클릭상세보기, 장바구니, 
	public ProductBean getProductByNum(String pnum) {
		ProductBean pb = new ProductBean();
		String sql = "select * from product where pnum=" + pnum;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcategory_fk(rs.getString("pcategory_fk"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPoint(rs.getInt("point"));
				pb.setPinputdate(rs.getString("pinputdate"));
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
		//System.out.println(pb.getPnum());
		//System.out.println(pb.getPname());
		return pb;
	}
	
	/* 상품삭제 */
	public int productDelete(String pnum) {
		int cnt = -1;
		String sql = "delete product where pnum=" + pnum;
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
	
	/* 상품수정 */
	public int updateProduct(MultipartRequest mr, String pimage) {
		int cnt = -1;
		String sql = "update product set pname=?, pcompany=?, pimage=?, pqty=?, price=?, pspec=?, pcontents=?, point=? where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			ps.setString(2, mr.getParameter("pcompany"));
			ps.setString(3, pimage);
			// 숫자컬럼이지만 문자를 넣어도 문제는 안되지만 정확하게 하는게 좋음~
			ps.setInt(4, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(5, Integer.parseInt(mr.getParameter("price")));
			ps.setString(6, mr.getParameter("pspec"));
			ps.setString(7, mr.getParameter("pcontents"));
			ps.setInt(8, Integer.parseInt(mr.getParameter("point")));
			ps.setString(9, mr.getParameter("pnum"));
			
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
	
	/**/
	public ArrayList<ProductBean> getProductByPspec(String pspec) {
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		String sql = "select * from product where pspec=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pspec);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcategory_fk(rs.getString("pcategory_fk"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPoint(rs.getInt("point"));
				pb.setPinputdate(rs.getString("pinputdate"));
				
				lists.add(pb);
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
	
	/* 다른방법 */
	public ArrayList<ProductBean> getProductByCategory(String code) {
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		String sql = "select * from product where pcategory_fk like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, code+"%"); // man% woman%
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcategory_fk(rs.getString("pcategory_fk"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPoint(rs.getInt("point"));
				pb.setPinputdate(rs.getString("pinputdate"));
				
				lists.add(pb);
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
	
}
