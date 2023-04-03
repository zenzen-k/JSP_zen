package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import my.shop.ProductBean;

public class OrdersDao {
	
	private static OrdersDao odao;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	private OrdersDao() {
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
	public static OrdersDao getInstance() {
		if(odao == null)
			odao = new OrdersDao();
		return odao;
	}
	
	// orders 테이블 삽입 작업
	public int insertOrder(int sno, Vector<ProductBean> clists) {
		int cnt = 0;
		String sql = "insert into orders values(orderseq.nextval, ?, ?, ?, ?)";
		try {
			for(ProductBean pb : clists) {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, sno);
				ps.setInt(2, pb.getPnum());
				ps.setInt(3, pb.getPqty());
				ps.setInt(4, pb.getPrice() * pb.getPqty());
				
				cnt += ps.executeUpdate();
			}
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
	
	
	// 상품목록가져오기
	public Vector<OrdersBean> getOrderList(String memid) {
		Vector<OrdersBean> olists = new Vector<OrdersBean>();
		String sql = "select m.name as mname, m.id mid, p.pname, o.qty, o.amount "
				+ "from ( members m inner join orders o on m.no = o.memno) inner join product p "
				+ "on o.pnum = p.pnum  "
				+ "where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, memid);
			rs = ps.executeQuery();
			while(rs.next()) {
				OrdersBean ob = new OrdersBean();
				ob.setMname(rs.getString("mname"));
				ob.setMid(rs.getString("mid"));
				ob.setPname(rs.getString("pname"));
				ob.setQty(rs.getInt("qty"));
				ob.setAmount(rs.getInt("amount"));
				
				olists.add(ob);
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
		return olists;
	}
}
