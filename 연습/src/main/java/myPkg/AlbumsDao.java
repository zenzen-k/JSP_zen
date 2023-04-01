package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AlbumsDao {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "jspid";
	String pw = "jsppw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// 생성자
	public AlbumsDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,id,pw);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로드 실패");
		} catch (SQLException e) {
			System.out.println("계정접속 실패");
		}
		
	}//AlbumsDao
	
	//전체조회
	public ArrayList<AlbumsBean> getAllAlbums() {
		ArrayList<AlbumsBean> lists = new  ArrayList<AlbumsBean>();
		String sql = "select * from albums";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AlbumsBean ab = new AlbumsBean();
				ab.setNum(rs.getInt("num"));
				ab.setSong(rs.getString("song"));
				ab.setSinger(rs.getString("singer"));
				ab.setCompany(rs.getString("company"));
				ab.setPrice(rs.getInt("price"));
				ab.setPub_day(String.valueOf(rs.getDate("pub_day")));
				
				lists.add(ab);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}// getAllAlbums
	
	//
	
}
