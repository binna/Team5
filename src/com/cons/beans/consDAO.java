package com.cons.beans;

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
		} catch(Exception e) {
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
			int cno = rs.getInt("Cno");
			String cname = rs.getString("Cname");
			String cadr = rs.getString("Cadr");
			String ctel = rs.getString("Ctel");
			String carea = rs.getString("Carea");
			String ccategory = rs.getString("Ccategory");
			
			consDTO dto = new consDTO(cno, cname, cadr, ctel, carea, ccategory);
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
			pstmt = conn.prepareStatement(consD.SQL_COM_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	} // end select()
	
	// 특정 uid 의 글 내용 읽기, 조회수 증가
	// viewCnt 도 1 증가 해야 하고, 글 읽어와야 한다 --> 트랜잭션 처리
	public consDTO [] readByUid(int uid) throws SQLException{
		int cnt = 0;
		consDTO [] arr = null;
		
		try {
			// 트랜잭션 처리
			// Auto-commit 비활성화
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(consD.SQL_COM_SELECT_BY_UID);
			pstmt.setInt(1, uid);
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
	} // end readByUid()

}