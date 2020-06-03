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

//비지니스 로직 : 데이터 동작, 트랜잭션들

// DAO : Date Access Object
// DB에 접속하는 트랜잭션을 수행하는 객체

// 다루는 데이터 소스의 종류에 따라 DAO는 여러개 정의 가능

public class WriteDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public WriteDAO() {
		
		try {
			Class.forName(CommunityD.DRIVER);
			conn = DriverManager.getConnection(CommunityD.URL, CommunityD.USERID, CommunityD.USERPW);
			System.out.println("WriteDAO 생성, 데이터 베이스 연결!");
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
	
	
	// write.jsp, writeOk.jsp
	// 새 글 작성 <-- DTO
	public int insert(WriteDTO dto) throws SQLException {
		String title = dto.getTitle();
		String content = dto.getContent();
		String keyword = dto.getKeyword();
		
		int cnt = this.insert(title, content, keyword);
		return cnt;
	}
	
	// 새 글 작성 <-- 제목, 내용, 키워드 
	public int insert(String title, String content, String keyword) throws SQLException {
		int cnt = 0;
		
		try {			
			// Qtitle, Qcontent, Qkeyword
			pstmt = conn.prepareStatement(CommunityD.SQL_WRITE_INSERT);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, keyword);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();			
		}

		return cnt;
	}
	
	// ResultSet --> DTO 배열로 리턴
	public WriteDTO[] createArray(ResultSet rs) throws SQLException {
		WriteDTO [] arr = null;  // DTO 배열
		
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()) {
			int no = rs.getInt("Qno");
			String title = rs.getString("Qtitle");
			String content = rs.getString("Qcontent");
			Date d = rs.getDate("content");
			Time t = rs.getTime("Qregdate");
			int clickCnt = rs.getInt("Qregdate");
			String keyword = rs.getString("Qkeyword");
			
			String regDate = "";
			if(d != null){
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			WriteDTO dto = new WriteDTO(no, title, content, clickCnt, keyword);
			dto.setRegDate(regDate);
			list.add(dto);
			
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new WriteDTO[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}
	
	
} // end DAO
