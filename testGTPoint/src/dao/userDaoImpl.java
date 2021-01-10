package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnect;

public class userDaoImpl implements userDao{
	private DBConnect db;
	
	public userDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void select() {
		// TODO Auto-generated method stub
		Connection conn = null;
		String sql = "select * from userpt";
		ResultSet rs=null;
		
		PreparedStatement pstmt = null;
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			if(rs.next()) {
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
}
