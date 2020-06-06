package com.community.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.community.common.CommunityD;

// 비즈니스 로직 : 데이터 동작, 트랜잭션들
// DAO : Data Access Object
// DB에 접속하는 트랜잭션을 수행하는 객체

// 다루는 데이터 소스의 종류에 따라 DAO는 여러개 있을 수 있다

public class CommentDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()

	// DAO 객체가 생성될때 Connection 도 생성된다.
	public CommentDAO() {
		
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
	
	// 댓글 작성
	public int insert(int cQno, String content) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_COMMENT_INSERT);
			pstmt.setInt(1, cQno);
			pstmt.setString(2, content);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
		
	} // end insert()
	
	// list.jsp
	// 전체 SELECT
	public CommentDTO[] select() throws SQLException {
		CommentDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_COMMENT_SELECT_ALL);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	} // end select()
	
	// ResultSet --> DTO 배열로 리턴
	public CommentDTO[] createArray(ResultSet rs) throws SQLException {
		CommentDTO[] arr = null;  // DTO 배열
		
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		
		while(rs.next()) {
			int cNo = rs.getInt("Cno");
			int cQno = rs.getInt("Cqno");
			String content = rs.getString("Ccontent");
			Date d = rs.getDate("Cregdate");
			Time t = rs.getTime("Cregdate");
			
			String regDate = "";
			if(d != null){
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			CommentDTO dto = new CommentDTO(cNo, cQno, content);
			dto.setCregDate(regDate);
			list.add(dto);
			
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new CommentDTO[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}

} // end DAO









