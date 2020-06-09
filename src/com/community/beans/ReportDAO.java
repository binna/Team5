package com.community.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.community.common.*;

public class ReportDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public ReportDAO() {
		
		try {
			Class.forName(CommunityD.DRIVER);
			conn = DriverManager.getConnection(CommunityD.URL, CommunityD.USERID, CommunityD.USERPW);
			
		} catch(Exception e) {
			e.printStackTrace();
		}		
		
	} // 생성자
	
	// DB 자원 반납 메소드,
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()
	
	
	//--------------------------------------------------------
	
	
	// 신고 접수
	public int insert(String rid, int rtype, int rqno) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_REPOT_INSERT);
			pstmt.setString(1, rid);
			pstmt.setInt(2, rtype);
			pstmt.setInt(3, rqno);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
		
	} // end insert()

} //end ReportDAO()









