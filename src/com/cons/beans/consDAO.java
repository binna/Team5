package com.cons.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.cons.common.consD;

public class consDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // SELECT 결과, executeQuery()

	// DAO 객체가 생성될때 Connection 도 생성된다.
	public consDAO() {

		try {
			Class.forName(consD.DRIVER);
			conn = DriverManager.getConnection(consD.URL, consD.USERID, consD.USERPW);
			System.out.println("WriteDAO 생성, 데이터 베이스 연결!");
		} catch (Exception e) {
			e.printStackTrace();
			// throw e;
		}

	} // 생성자

	// DB 자원 반납 메소드,
	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	} // end close()

	// ResultSet --> DTO 배열로 리턴
	public consDTO[] createArray(ResultSet rs) throws SQLException {
		consDTO[] arr = null; // DTO 배열

		ArrayList<consDTO> list = new ArrayList<consDTO>();

		while (rs.next()) {
			int csno = rs.getInt("CSno");
			String csuid = rs.getString("CSuid");
			int cno = rs.getInt("Cno");
			String csarea = rs.getString("CSarea");
			String cstel = rs.getString("CStel");
			String cname = rs.getString("Cname");

			consDTO dto = new consDTO(csno, csuid, cno, csarea, cstel, cname);
			list.add(dto);

		} // end while

		int size = list.size();

		if (size == 0)
			return null;

		arr = new consDTO[size];
		list.toArray(arr); // List -> 배열
		return arr;
	}

	// 전체 SELECT
	public consDTO[] select() throws SQLException {
		consDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	} // end select()

	// 특정 uid 의 글 수정 (제목, 내용)
	public int update(int csno, String CSuid, String CSarea, String CStel) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_UPDATE);
			pstmt.setString(1, CSuid);
			pstmt.setString(2, CSarea);
			pstmt.setString(3, CStel);
			pstmt.setInt(4, csno);
			System.out.println(CSarea);
			System.out.println(CStel);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}		
		
		return cnt;
	} // end update()
	
	// 특정 uid 글 삭제하기
	public int deleteByUid(int uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_DELETE);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}		
		return cnt;
	} // end deleteByUid()
	
	// 특정 uid 의 글 만 SELECT (조회수 증가 없슴!)
	public consDTO [] selectByUid(int csuid) throws SQLException {
		consDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_UID_SELECT);
			pstmt.setInt(1, csuid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

} // end class
