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

public class DAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public DAO() {
		
		try {
			Class.forName(CommunityD.DRIVER);
			conn = DriverManager.getConnection(CommunityD.URL, CommunityD.USERID, CommunityD.USERPW);
			
			// 확인용, 나중에 지우기
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
	public int insert(DTO dto) throws SQLException {
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
	
	
	
	
	
	// 아직 사용 안함ㅋ----------------------------------------
	// write에서 view단으로 넘어가기 위해 Qtitle로 Qno 검색이 필요
	public DTO[] selectByQtitle(String title) throws SQLException {
		DTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_SELECT_BY_Qtitle);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		
		return arr;
	} // end selectByQtitle()
	//--------------------------------------------------------
	
	
	
	
	
	// View 조회를 위해
	// ResultSet --> DTO 배열로 리턴
	public DTO[] createArray(ResultSet rs) throws SQLException {
		DTO [] arr = null;  // DTO 배열
		
		ArrayList<DTO> list = new ArrayList<DTO>();
		
		while(rs.next()) {
			int no = rs.getInt("Qno");
			String title = rs.getString("Qtitle");
			String content = rs.getString("Qcontent");
			Date d = rs.getDate("Qregdate");
			Time t = rs.getTime("Qregdate");
			int clickCnt = rs.getInt("Qclickcnt");
			String keyword = rs.getString("Qkeyword");
			
			String regDate = "";
			if(d != null){
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			DTO dto = new DTO(no, title, content, clickCnt, keyword);
			dto.setRegDate(regDate);
			list.add(dto);
			
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new DTO[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}

	// 특정 uid 의 글 내용 읽기, 조회수 증가
	// viewCnt 도 1 증가 해야 하고, 글 읽어와야 한다 --> 트랜잭션 처리
	public DTO[] readByQno(int no) throws SQLException{
		DTO[] arr = null;
		
		try {
			// 트랜잭션 처리
			// Auto-commit 비활성화
			conn.setAutoCommit(false);
			
			// 쿼리들 수행
			pstmt = conn.prepareStatement(CommunityD.SQL_INC_QCLICKCNT);
			pstmt.setInt(1, no);
			
			// 작용한 열의 개수(갱신 카운트로 간주되는)를 나타내는 정수
			pstmt.executeUpdate();
			
			pstmt.close();
			
			pstmt = conn.prepareStatement(CommunityD.SQL_SELECT_BY_QNO);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			conn.commit();
			
		} catch(SQLException e) {
			conn.rollback();
			throw e;
		} finally {
			close();
		}
		
		return arr;
	} // end readByQno()
			
		
	
//	// 특정 uid의 글만 SELECT(조회수 증가 없음)
//	public WriteDTO [] selectByUid(int uid) throws SQLException {
//		WriteDTO [] arr = null;
//		
//		try {
//			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
//			pstmt.setInt(1, uid);
//			rs = pstmt.executeQuery();
//			arr = createArray(rs);
//		} finally {
//			close();
//		}
//		return arr;
//	}
	
	
} // end DAO
